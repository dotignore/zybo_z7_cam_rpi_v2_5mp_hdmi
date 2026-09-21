# Program FPGA + CPU over JTAG (Digilent Zybo Z7)
#
# Hard rules:
#   - Never rst / rst -system AFTER fpga (GP0 abort DFAR=0x43000000).
#   - rst -srst is OK BEFORE fpga only — recovers wedged A9 debug.
#   - ps7_init after halt on A9#0, after bitstream + reconnect.
#     Doing it before fpga, or on APU, kills this Digilent FTDI
#     (Invalid context / DAP IDCODE 0 / FT_Write).
#   - If ps7_init still kills DAP: reconnect and skip it (QSPI already
#     initialized DDR/MIO; we force FCLK in this script).

set proj [file normalize [file join [file dirname [info script]] ..]]
set bit  [file join $proj zybo_z7_imx219 zybo_z7_imx219.runs impl_1 design_1_wrapper.bit]
set bit_alt [file join $proj zybo_z7_imx219 design_1_wrapper.bit]
set bin  [file join $proj vitis_hdmi_ws cam_hdmi Debug cam_hdmi.bin]
set xsa  [file join $proj zybo_z7_imx219 design_1_wrapper.xsa]
set ps7tcl [file join $proj vitis_hdmi_ws zybo_hdmi_plat hw ps7_init.tcl]

set status_file [file join $proj scripts .program_board_status]
catch {file delete -force $status_file}

proc die {msg} {
  global status_file
  puts "FATAL: $msg"
  catch {
    set f [open $status_file w]
    puts $f "FAIL $msg"
    close $f
  }
  catch {disconnect}
  exit 1
}

proc mark_ok {} {
  global status_file
  set f [open $status_file w]
  puts $f "OK"
  close $f
}

if {![file exists $bit]} {
  if {[file exists $bit_alt]} {
    die "missing $bit — wait for impl_1 bitstream"
  }
  die "missing $bit"
}
foreach f [list $bin $xsa $ps7tcl] {
  if {![file exists $f]} { die "missing $f" }
}
puts "BIT=$bit"

proc sel {filt} { targets -set -filter $filt }

proc try_stop {} {
  set err ""
  if {[catch {stop} err] == 0} { return 1 }
  if {[string match -nocase "*Already stopped*" $err]} { return 1 }
  puts "stop: $err"
  return 0
}

proc cpu0_ready {} {
  sel {name =~ "*Cortex-A9 MPCore #1*"}
  try_stop
  sel {name =~ "*Cortex-A9 MPCore #0*"}
  try_stop
  set st ""
  catch {set st [state]}
  if {[catch {mrd 0xF8007080} err] == 0} {
    puts "CPU0 ready state=$st"
    return 1
  }
  puts "CPU0 not ready state=$st: $err"
  return 0
}

proc halt_cpu0 {when} {
  puts "Halt CPU0 ($when)"
  if {[cpu0_ready]} { return 1 }
  after 400
  if {[cpu0_ready]} { return 1 }
  if {$when eq "before FPGA"} {
    puts "rst -srst (before FPGA only)"
    sel {name =~ "APU*"}
    if {[catch {rst -srst} e]} { puts "rst -srst: $e" }
    after 1500
    catch {configparams force-mem-accesses 1}
    if {[cpu0_ready]} { return 1 }
    after 500
    if {[cpu0_ready]} { return 1 }
  }
  return 0
}

proc reconnect_hw {} {
  global xsa ps7tcl
  puts "Reconnect JTAG..."
  catch {disconnect}
  after 2000
  connect
  after 1500
  catch {configparams force-mem-accesses 1}
  catch {configparams reset-on-disconnect 0}
  sel {name =~ "APU*"}
  loadhw -hw $xsa
  source $ps7tcl
}

proc dap_lost {err} {
  expr {
    [string match "*DAP*" $err] ||
    [string match "*FT_Write*" $err] ||
    [string match "*IDCODE*" $err] ||
    [string match "*JTAG server*" $err] ||
    [string match "*Invalid context*" $err]
  }
}

if {[catch {
  connect
  after 1000
  puts [targets]
  catch {configparams force-mem-accesses 1}
  catch {configparams reset-on-disconnect 0}

  sel {name =~ "APU*"}
  loadhw -hw $xsa
  source $ps7tcl

  if {![halt_cpu0 "before FPGA"]} {
    die "Cannot halt CPU0. Power-cycle Zybo, close HW Manager/other XSDB, JP5=JTAG, retry."
  }

  puts "Programming bitstream into PL (xc7z020)..."
  sel {name =~ "*xc7z020*"}
  fpga -f $bit
  after 2500
  puts "PL bitstream loaded"

  reconnect_hw

  if {![halt_cpu0 "after FPGA"]} {
    die "Cannot halt CPU0 after FPGA. Power-cycle, JP5=JTAG, retry."
  }

  catch {configparams force-mem-accesses 1}
  sel {name =~ "*Cortex-A9 MPCore #0*"}
  try_stop

  # Do not call ps7_init here: on this Digilent cable it often kills DAP
  # (IDCODE 0 / FT_Write) and then VDMA probe is skipped. QSPI already
  # initialized DDR. Apply only post_config: FCLK + level shifters + PL reset.
  puts "PS post_config (no ps7_init)..."
  mwr -force 0xF8000008 0xDF0D
  mwr -force 0xF8000170 0x00100500
  mwr -force 0xF8000180 0x00200500
  mwr -force 0xF8000900 0x0000000F
  mwr -force 0xF8000240 0x00000000
  after 150
  puts "FPGA0_CLK [mrd 0xF8000170]"
  puts "FPGA1_CLK [mrd 0xF8000180]"
  puts "LVL_SHFTR [mrd 0xF8000900]"
  puts "FPGA_RST  [mrd 0xF8000240]"

  if {[catch {puts "VDMA probe [mrd 0x43000000]"} e]} {
    die "VDMA probe failed (GP0/PL dead): $e"
  }
  if {[catch {puts "VTC probe  [mrd 0x43C20000]"} e]} {
    puts "VTC probe failed: $e (HDMI timing may be dead)"
  }
  if {[catch {puts "CSI probe  [mrd 0x43C00000]"} e]} {
    puts "CSI probe failed: $e"
  }

  sel {name =~ "*Cortex-A9 MPCore #1*"}
  try_stop
  sel {name =~ "*Cortex-A9 MPCore #0*"}
  try_stop

  set bootline [mrd 0xF800025C]
  puts "BOOT_MODE $bootline"
  if {[regexp {:\s*([0-9A-Fa-f]+)} $bootline -> hex]} {
    set bm [expr {"0x$hex" & 0x7}]
    if {$bm == 0} {
      puts "BOOT_MODE=JTAG OK"
    } elseif {$bm == 1} {
      puts "WARNING: BOOT_MODE=QSPI - factory demo returns on PS reset. Set JP5 to JTAG."
    } else {
      puts "WARNING: BOOT_MODE=$bm (want 0=JTAG). Set JP5 to JTAG."
    }
  }

  mwr -force 0xF8000008 0xDF0D
  catch {mwr -force 0xF8005000 0x00ABC000}

  puts "SCTLR before: [rrd cp15 1 sctlr]"
  rwr cp15 1 sctlr 0x00C50078
  catch {rwr cp15 8 tlbiall 0}
  catch {rwr cp15 7 iciallu 0}
  puts "SCTLR after:  [rrd cp15 1 sctlr]"

  puts "DDR probe:"
  mwr 0x00100000 0xA5A5A5A5
  puts [mrd 0x00100000]

  set fp [open $bin rb]
  fconfigure $fp -translation binary
  set addr 0x00100000
  set nbytes 0
  while {1} {
    set chunk [read $fp 256]
    set n [string length $chunk]
    if {$n == 0} { break }
    if {$n % 4} {
      append chunk [string repeat "\x00" [expr {4 - ($n % 4)}]]
      set n [string length $chunk]
    }
    binary scan $chunk iu* words
    mwr $addr $words
    incr addr $n
    incr nbytes $n
  }
  close $fp
  puts "Wrote $nbytes bytes from $bin"

  proc load_bin_at {path addr} {
    set fp [open $path rb]
    fconfigure $fp -translation binary
    set nbytes 0
    set a $addr
    while {1} {
      set chunk [read $fp 1024]
      set n [string length $chunk]
      if {$n == 0} { break }
      if {$n % 4} {
        append chunk [string repeat "\x00" [expr {4 - ($n % 4)}]]
        set n [string length $chunk]
      }
      binary scan $chunk iu* words
      mwr $a $words
      incr a $n
      incr nbytes $n
    }
    close $fp
    return $nbytes
  }

  set gbr [file join $proj pic HDMI_test_1920x1080_gbr888.bin]
  if {[file exists $gbr]} {
    puts "Loading HDMI_test GBR888 -> 0x02800000 ..."
    if {[catch {dow -data $gbr 0x02800000} e]} {
      puts "dow -data failed ($e); mwr fallback"
      puts "Loaded [load_bin_at $gbr 0x02800000] bytes GBR888"
    } else {
      puts "dow -data HDMI_test GBR888 OK"
    }
    mwr 0x02E00000 0x47425231
    puts "TEST magic [mrd 0x02E00000]"
    puts "TEST pix0  [mrd 0x02800000]"
  } else {
    puts "WARN missing $gbr — CPU will draw GBR bars"
  }

  sel {name =~ "*Cortex-A9 MPCore #1*"}
  try_stop
  mwr 0xFFFF0000 0xE320F003
  mwr 0xFFFF0004 0xEAFFFFFE
  rwr pc 0xFFFF0000
  catch {rwr cpsr 0x1D3}
  con
  puts "CPU1 parked in WFI @ 0xFFFF0000"

  proc rd32 {addr} {
    set line [mrd $addr]
    if {[regexp {:\s*([0-9A-Fa-f]+)} $line -> hex]} {
      return [expr {"0x$hex"}]
    }
    return 0
  }

  proc uart_puts {s} {
    mwr 0xE0001000 0x17
    foreach c [split $s {}] {
      scan $c %c ch
      for {set i 0} {$i < 20000} {incr i} {
        if {([rd32 0xE000102C] & 0x10) == 0} { break }
      }
      mwr 0xE0001030 $ch
    }
  }

  uart_puts "\r\nJTAG UART1 OK\r\n"

  mwr 0xF8F00100 0x00000000
  mwr 0xF8F01000 0x00000000

  sel {name =~ "*Cortex-A9 MPCore #0*"}
  rwr cpsr 0x000001D3
  con -addr 0x0010012c
  puts "CPU0 running _boot @ 0x0010012c (leave it running, do not halt)"
  puts {COM4 should show: JTAG UART1 OK  then cam_hdmi [M01] main() entered}
} err]} {
  die $err
}

mark_ok
puts "PROGRAM OK"
exit 0
