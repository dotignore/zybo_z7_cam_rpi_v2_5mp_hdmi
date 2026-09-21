connect
after 500
targets -set -filter {name =~ "*Cortex-A9 MPCore #0*"}
catch {stop}
puts "mrd 0x00F00000: [mrd 0x00F00000]"
mwr 0x00F00000 0xDEADBEEF
puts "after write: [mrd 0x00F00000]"
puts "mrd 0x01000000: [mrd 0x01000000]"
mwr 0x01000000 0xCAFEBABE
puts "after write 16M: [mrd 0x01000000]"
puts "mrd 0x02000000: [mrd 0x02000000]"
mwr 0x02000000 0x12345678
puts "after write 32M: [mrd 0x02000000]"
puts done
