connect
after 500
targets -set -filter {name =~ "*Cortex-A9 MPCore #0*"}
catch {stop}
puts "VTC @0x43C20000: [mrd 0x43C20000]"
puts "VDMA @0x43000000: [mrd 0x43000000]"
puts "CSI @0x43C00000: [mrd 0x43C00000]"
puts done
