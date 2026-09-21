# Sourced after the base design wiring. No silent connection failures here.
foreach fn {axis_isp.v axis_raw_to_gbr.v isp_srgb.mem} {
  set f [file join $proj_dir src $fn]
  if {![llength [get_files -quiet $f]]} {add_files -norecurse $f}
}
update_compile_order -fileset sources_1
proc clear_intf {path} {
  set pin [get_bd_intf_pins $path]
  set nets [get_bd_intf_nets -quiet -of_objects $pin]
  if {[llength $nets]} {disconnect_bd_intf_net $nets $pin}
}
# Remove the irreversible RAW10->8 truncation.
foreach p {mipi_csi2_rx_subsyst_0/video_out v_demosaic_0/s_axis_video v_demosaic_0/m_axis_video axi_vdma_0/S_AXIS_S2MM} {clear_intf $p}
if {[llength [get_bd_cells -quiet axis_raw10to8]]} {delete_bd_objs [get_bd_cells axis_raw10to8]}
set_property CONFIG.MAX_DATA_WIDTH 10 [get_bd_cells v_demosaic_0]
if {![llength [get_bd_cells -quiet axis_isp_0]]} {
  create_bd_cell -type module -reference axis_isp axis_isp_0
}
if {![llength [get_bd_cells -quiet axis_raw_to_gbr_0]]} {
  create_bd_cell -type module -reference axis_raw_to_gbr axis_raw_to_gbr_0
}
if {![llength [get_bd_cells -quiet raw_switch]]} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 raw_switch
}
set_property -dict [list CONFIG.NUM_SI 2 CONFIG.NUM_MI 1 CONFIG.TDATA_NUM_BYTES 2 CONFIG.HAS_TLAST 1 CONFIG.TUSER_WIDTH 1 CONFIG.ROUTING_MODE 1] [get_bd_cells raw_switch]
if {![llength [get_bd_cells -quiet raw_vdma]]} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 raw_vdma
}
set_property -dict [list CONFIG.c_include_mm2s 1 CONFIG.c_include_s2mm 0 CONFIG.c_num_fstores 5 CONFIG.c_m_axis_mm2s_tdata_width 16 CONFIG.c_use_mm2s_fsync 0 CONFIG.c_mm2s_linebuffer_depth 4096 CONFIG.c_mm2s_max_burst_length 32] [get_bd_cells raw_vdma]
foreach pair {
 {raw_vdma/M_AXIS_MM2S raw_switch/S01_AXIS}
 {v_demosaic_0/m_axis_video axis_isp_0/S_AXIS}
 {axis_isp_0/M_AXIS axi_vdma_0/S_AXIS_S2MM}
} {
  clear_intf [lindex $pair 1]
  connect_bd_intf_net [get_bd_intf_pins [lindex $pair 0]] [get_bd_intf_pins [lindex $pair 1]]
}
# Minimal camera path bypasses the HLS demosaic and stream switch.
clear_intf mipi_csi2_rx_subsyst_0/video_out
clear_intf v_demosaic_0/s_axis_video
clear_intf axi_vdma_0/S_AXIS_S2MM
connect_bd_intf_net [get_bd_intf_pins mipi_csi2_rx_subsyst_0/video_out] \
                    [get_bd_intf_pins axis_raw_to_gbr_0/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_raw_to_gbr_0/M_AXIS] \
                    [get_bd_intf_pins axi_vdma_0/S_AXIS_S2MM]
reconnect_pin processing_system7_0/FCLK_CLK1 axis_raw_to_gbr_0/aclk
reconnect_pin proc_sys_reset_0/peripheral_aresetn axis_raw_to_gbr_0/aresetn
foreach p {axis_isp_0/aclk raw_switch/aclk raw_switch/s_axi_ctrl_aclk raw_vdma/s_axi_lite_aclk raw_vdma/m_axi_mm2s_aclk raw_vdma/m_axis_mm2s_aclk} {
  reconnect_pin processing_system7_0/FCLK_CLK1 $p
}
foreach p {axis_isp_0/aresetn raw_switch/aresetn raw_switch/s_axi_ctrl_aresetn raw_vdma/axi_resetn} {
  reconnect_pin proc_sys_reset_0/peripheral_aresetn $p
}
foreach p {raw_switch/S_AXI_CTRL raw_vdma/S_AXI_LITE} {
  if {![llength [get_bd_intf_nets -quiet -of_objects [get_bd_intf_pins $p]]]} {
    apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config [list Master /processing_system7_0/M_AXI_GP0 Clk Auto] [get_bd_intf_pins $p]
  }
}
if {![llength [get_bd_intf_nets -quiet -of_objects [get_bd_intf_pins raw_vdma/M_AXI_MM2S]]]} {
  apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config [list Slave /processing_system7_0/S_AXI_HP0 Clk Auto] [get_bd_intf_pins raw_vdma/M_AXI_MM2S]
}
assign_bd_address
# Fixed control addresses are part of the software/hardware contract.
set_property offset 0x43010000 [get_bd_addr_segs processing_system7_0/Data/SEG_raw_vdma_Reg]
set_property offset 0x43C30000 [get_bd_addr_segs processing_system7_0/Data/SEG_raw_switch_Reg]
