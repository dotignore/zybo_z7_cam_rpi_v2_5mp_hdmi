# Force BSP rebuild so translation_table.S picks up full DDR (to 0x3FFFFFFF)
set proj [file normalize [file join [file dirname [info script]] ..]]
set ws   [file join $proj vitis_hdmi_ws]
set xsa  [file join $proj zybo_z7_imx219 design_1_wrapper.xsa]

setws $ws
# Vitis 2025.2 wants the .spr, not the exported .xpfm.
set status_file [file join $proj scripts .bsp_status]
catch {file delete -force $status_file}
platform read [file join $ws zybo_hdmi_plat platform.spr]
if {[catch {platform config -updatehw $xsa} err]} {
  puts "WARN: platform updatehw failed: $err"
  set hwdir [file join $ws zybo_hdmi_plat hw]
  set tmpd  [file join $ws zybo_hdmi_plat tempdsa]
  file mkdir $hwdir
  foreach fn {ps7_init.tcl ps7_init.c ps7_init.h} {
    set src [file join $tmpd $fn]
    if {[file exists $src]} {
      file copy -force $src [file join $hwdir $fn]
    }
  }
} else {
  catch {platform clean}
  platform generate
}

puts "BSP regenerated. Check XPAR_PS7_DDR_0_S_AXI_HIGHADDR in include/xparameters.h"
puts "Then run flash.cmd to relink the app."
set status_file [file join $proj scripts .bsp_status]
set f [open $status_file w]
puts $f "OK"
close $f
