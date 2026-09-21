# Force BSP rebuild so translation_table.S picks up full DDR (to 0x3FFFFFFF)
set proj [file normalize [file join [file dirname [info script]] ..]]
set ws   [file join $proj vitis_hdmi_ws]
set xsa  [file join $proj zybo_z7_imx219 design_1_wrapper.xsa]

setws $ws
# Vitis 2025.2 wants the .spr, not the exported .xpfm.
set status_file [file join $proj scripts .bsp_status]
catch {file delete -force $status_file}
platform read [file join $ws zybo_hdmi_plat platform.spr]
set internal_xsa [file join $ws zybo_hdmi_plat hw design_1_wrapper.xsa]
# Vitis 2025.2 updatehw loses ps7_init.c/h after moving a workspace.
# The platform's internal handoff points at this copy; generate directly.
file copy -force $xsa $internal_xsa
# platform generate builds FSBL from loose ps7_init.c/h.  Vitis does not
# re-extract these reliably after the project directory is moved.
set fsbl_dir [file join $ws zybo_hdmi_plat zynq_fsbl]
exec tar -xf $xsa -C $fsbl_dir ps7_init.c ps7_init.h
exec tar -xf $xsa -C [file dirname $internal_xsa] ps7_init.c ps7_init.h ps7_init.tcl
if {[catch {platform generate} err]} {
  set f [open $status_file w]
  puts $f "FAIL: platform generate: $err"
  close $f
  error "Cannot use stale BSP: $err"
}

puts "BSP regenerated. Check XPAR_PS7_DDR_0_S_AXI_HIGHADDR in include/xparameters.h"
puts "Then run flash.cmd to relink the app."
set status_file [file join $proj scripts .bsp_status]
set f [open $status_file w]
puts $f "OK"
close $f
