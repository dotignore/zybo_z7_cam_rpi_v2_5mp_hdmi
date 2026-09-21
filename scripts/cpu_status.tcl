connect
after 500
targets -set -filter {name =~ "*Cortex-A9 MPCore #0*"}
catch {stop}
configparams force-mem-access 1
puts "PC=[rrd pc]"
puts "SCTLR:"
catch {puts [rrd cp15 1 sctlr]}
# With MMU as CPU left it — try PL reads without clearing SCTLR first
puts "VDMA (MMU on):"
catch {puts [mrd 0x43000000 2]}
puts "CSI (MMU on):"
catch {puts [mrd 0x43C00000 2]}
# Then MMU off like jtag_probe
rwr cp15 1 sctlr 0x00C50078
catch {rwr cp15 8 tlbiall 0}
puts "VDMA (MMU off):"
catch {puts [mrd 0x43000000 2]}
puts "CSI (MMU off):"
catch {puts [mrd 0x43C00000 2]}
puts "VTC (MMU off):"
catch {puts [mrd 0x43C20000 2]}
# Sample framebuf magic / first pixels of buf0
puts "BUF0:"
catch {puts [mrd 0x01000000 4]}
disconnect
exit
