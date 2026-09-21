# After bitstream: build ELF and program Zybo via JTAG
set proj   [file normalize [file join [file dirname [info script]] ..]]
set xsa    [file join $proj zybo_z7_imx219 design_1_wrapper.xsa]
set ws     [file join $proj vitis_hdmi_ws]
set src    [file join $proj sw src]

if {![file exists $xsa]} {
  error "No XSA yet: $xsa"
}

file mkdir $ws
setws $ws

if {[catch {platform list}] || [lsearch -exact [platform list] zybo_hdmi_plat] < 0} {
  platform create -name zybo_hdmi_plat -hw $xsa -proc ps7_cortexa9_0 -os standalone -out $ws
} else {
  platform read [file join $ws zybo_hdmi_plat export zybo_hdmi_plat.xpfm]
  catch {platform config -updatehw $xsa}
}
platform generate

if {[catch {app list}] || [lsearch -exact [app list] cam_hdmi] < 0} {
  app create -name cam_hdmi -platform zybo_hdmi_plat -domain standalone_domain \
    -template {Empty Application(C)}
}

foreach f {main.c imx219.c imx219.h imx219_regs.h pipeline.c pipeline.h parameters.h} {
  file copy -force [file join $src $f] [file join $ws cam_hdmi src $f]
}

app build -name cam_hdmi
puts "ELF: [file join $ws cam_hdmi Debug cam_hdmi.elf]"
