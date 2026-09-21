# Force BSP rebuild so translation_table.S picks up full DDR (to 0x3FFFFFFF)
set proj [file normalize [file join [file dirname [info script]] ..]]
set ws   [file join $proj vitis_hdmi_ws]
set xsa  [file join $proj zybo_z7_imx219 design_1_wrapper.xsa]

setws $ws
platform read [file join $ws zybo_hdmi_plat export zybo_hdmi_plat.xpfm]
catch {platform config -updatehw $xsa}

# Clean and regenerate so MMU table matches xparameters DDR HIGHADDR
catch {platform clean}
platform generate

puts "BSP regenerated. Check XPAR_PS7_DDR_0_S_AXI_HIGHADDR in include/xparameters.h"
puts "Then run flash.cmd to relink the app."
