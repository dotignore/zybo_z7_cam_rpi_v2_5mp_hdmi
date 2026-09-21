connect
after 500
targets -set -filter {name =~ "*Cortex-A9 MPCore #0*"}
catch {stop}
source [file join [file dirname [info script]] .. vitis_hdmi_ws zybo_hdmi_plat hw ps7_init.tcl]
catch {ps7_init}
catch {ps7_post_config}
con -addr 0x00100000
puts "restarted"
