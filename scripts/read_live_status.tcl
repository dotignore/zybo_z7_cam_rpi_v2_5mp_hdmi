connect
after 300
targets -set -filter {name =~ "*Cortex-A9 MPCore #0*"}
catch {configparams force-mem-accesses 1}
foreach {name addr count} {
  MM2S 0x43000000 2
  S2MM 0x43000030 2
  PARK 0x43000028 1
  CSI 0x43C00000 12
  VTC 0x43C20000 4
  BUF0 0x01000000 4
} {
  if {[catch {mrd $addr $count} value]} {
    puts "$name ERROR $value"
  } else {
    puts "$name $value"
  }
}
disconnect
exit
