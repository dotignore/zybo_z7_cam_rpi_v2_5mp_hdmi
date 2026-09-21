connect
after 500
targets -set -filter {name =~ "*Cortex-A9 MPCore #0*"}
catch {stop}
configparams force-mem-access 1
rwr cp15 1 sctlr 0x00C50078
catch {rwr cp15 8 tlbiall 0}
puts "PC=[rrd pc]"
puts "LVL_SHFTR 0xF8000240:"
catch {puts [mrd 0xF8000240]}
puts "FPGA0_CLK 0xF8000170:"
catch {puts [mrd 0xF8000170]}
puts "FPGA1_CLK 0xF8000180:"
catch {puts [mrd 0xF8000180]}
puts "VDMA 0x43000000:"
catch {puts [mrd 0x43000000 4]}
puts "CSI 0x43C00000:"
catch {puts [mrd 0x43C00000 2]}
puts "DEMOSAIC 0x43C10000:"
catch {puts [mrd 0x43C10000 2]}
puts "VTC 0x43C20000:"
catch {puts [mrd 0x43C20000 2]}
disconnect
exit
