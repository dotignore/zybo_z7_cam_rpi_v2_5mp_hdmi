connect
after 300
targets -set -filter {name =~ "*Cortex-A9 MPCore #0*"}
catch {stop}
configparams force-mem-access 1
puts "PC=[rrd pc]"
puts "SCTLR=[rrd cp15 1 sctlr]"
puts "DFAR:"
catch {puts [rrd cp15 6 dfar]}
puts "DFSR:"
catch {puts [rrd cp15 5 dfsr]}
# clear outstanding by resetting FPGA
mwr 0xF8000008 0xDF0D
puts "FPGA_RST before: [mrd 0xF8000240]"
mwr 0xF8000240 0xF
after 10
mwr 0xF8000240 0x0
after 50
puts "FPGA_RST after: [mrd 0xF8000240]"
puts "VDMA after rst:"
catch {puts [mrd 0x43000000 2]}
puts "CSI after rst:"
catch {puts [mrd 0x43C00000 2]}
puts "VTC after rst:"
catch {puts [mrd 0x43C20000 2]}
disconnect
exit
