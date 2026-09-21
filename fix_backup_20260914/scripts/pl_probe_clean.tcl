# Fresh FPGA config then PL probe — do NOT run application.
set proj [file normalize [file join [file dirname [info script]] ..]]
set bit  [file join $proj zybo_z7_imx219 zybo_z7_imx219.runs impl_1 design_1_wrapper.bit]
set xsa  [file join $proj zybo_z7_imx219 design_1_wrapper.xsa]
set ps7tcl [file join $proj vitis_hdmi_ws zybo_hdmi_plat hw ps7_init.tcl]

connect
after 500
targets -set -filter {name =~ "APU*"}
loadhw -hw $xsa
source $ps7tcl
targets -set -filter {name =~ "*xc7z020*"}
fpga -f $bit
after 2000
targets -set -filter {name =~ "*Cortex-A9 MPCore #0*"}
catch {stop}
catch {rst -processor}
after 500
catch {stop}
ps7_init
ps7_post_config
after 200
mwr 0xF8000008 0xDF0D
mwr 0xF8000170 0x00100500
mwr 0xF8000180 0x00200500
mwr 0xF8000240 0xF
after 5
mwr 0xF8000240 0x0
after 100
configparams force-mem-access 1
catch {rwr cp15 1 sctlr 0x00C50078}
catch {rwr cp15 8 tlbiall 0}
puts "FPGA0 [mrd 0xF8000170]"
puts "FPGA1 [mrd 0xF8000180]"
puts "VDMA  [mrd 0x43000000 2]"
puts "CSI   [mrd 0x43C00000 2]"
puts "DEMO  [mrd 0x43C10000 2]"
puts "VTC   [mrd 0x43C20000 2]"
puts "DONE_PROBE"
disconnect
exit
