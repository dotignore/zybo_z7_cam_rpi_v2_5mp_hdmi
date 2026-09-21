# Add IMX219 capture -> HDMI OUT pipeline and build bitstream.
# Vivado 2025.2 batch: vivado -mode batch -source scripts/add_hdmi_and_build.tcl

set proj_dir [file normalize [file join [file dirname [info script]] ..]]
set xpr      [file join $proj_dir zybo_z7_imx219 zybo_z7_imx219.xpr]
set ip_repo  [file join $proj_dir vivado-library]
set boards   [file join $proj_dir vivado-boards-master new board_files]
set xsa_out  [file join $proj_dir zybo_z7_imx219 design_1_wrapper.xsa]

if {![file exists $xpr]} {
  error "Project not found: $xpr"
}

set_param board.repoPaths $boards

# Windows MAX_PATH: HLS demosaic filenames blow past 260 chars on the long Desktop path.
# Run this script from a subst drive (see scripts/flash_hdmi.cmd).
puts "PROJ_DIR=$proj_dir (len=[string length $proj_dir])"

# Vivado regenerates changed IP; retain cached synthesis results.
open_project $xpr
set_property board_part_repo_paths [list $boards] [current_project]
set_property board_part {digilentinc.com:zybo-z7-20:part0:1.2} [current_project]
set_property ip_repo_paths [list $ip_repo] [current_project]
catch {config_ip_cache -use_cache_location [file join $proj_dir ipcache]}
update_ip_catalog -rebuild

open_bd_design [get_files design_1.bd]
catch {upgrade_ip [get_ips] -sync}

# -------------------------------------------------------------------------
# Capture: CSI RAW10 (16b) -> 8b -> demosaic GBRG -> RGB888 -> VDMA S2MM
# Display: VDMA MM2S -> axi4s_vid_out + VTC 1080p30 -> rgb2dvi -> HDMI
# -------------------------------------------------------------------------

if {[llength [get_bd_intf_nets -quiet mipi_csi2_rx_subsyst_0_video_out]]} {
  delete_bd_objs [get_bd_intf_nets mipi_csi2_rx_subsyst_0_video_out]
}

set_property -dict [list \
  CONFIG.c_include_mm2s {1} \
  CONFIG.c_use_mm2s_fsync {0} \
  CONFIG.c_use_s2mm_fsync {2} \
  CONFIG.c_s2mm_sof_enable {1} \
  CONFIG.c_mm2s_max_burst_length {32} \
  CONFIG.c_s2mm_max_burst_length {32} \
  CONFIG.c_num_fstores {5} \
  CONFIG.c_m_axis_mm2s_tdata_width {24} \
  CONFIG.c_mm2s_linebuffer_depth {4096} \
  CONFIG.c_s2mm_linebuffer_depth {4096} \
] [get_bd_cells axi_vdma_0]

if {[llength [get_bd_cells -quiet axis_raw10to8]] == 0} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 axis_raw10to8
}
set_property -dict [list \
  CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER \
  CONFIG.M_TDATA_NUM_BYTES.VALUE_SRC USER \
  CONFIG.S_TDATA_NUM_BYTES {2} \
  CONFIG.M_TDATA_NUM_BYTES {1} \
  CONFIG.TDATA_REMAP {tdata[9:2]} \
  CONFIG.TUSER_REMAP {tuser[0:0]} \
  CONFIG.TLAST_REMAP {tlast[0]} \
] [get_bd_cells axis_raw10to8]

if {[llength [get_bd_cells -quiet v_demosaic_0]] == 0} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:v_demosaic:1.1 v_demosaic_0
}
set_property -dict [list \
  CONFIG.SAMPLES_PER_CLOCK {1} \
  CONFIG.MAX_COLS {1920} \
  CONFIG.MAX_ROWS {1080} \
  CONFIG.MAX_DATA_WIDTH {8} \
] [get_bd_cells v_demosaic_0]

if {[llength [get_bd_cells -quiet clk_wiz_hdmi]] == 0} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_hdmi
}
set_property -dict [list \
  CONFIG.PRIM_IN_FREQ {100.000} \
  CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {74.250} \
  CONFIG.USE_LOCKED {true} \
  CONFIG.USE_RESET {false} \
] [get_bd_cells clk_wiz_hdmi]

if {[llength [get_bd_cells -quiet rst_hdmi]] == 0} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_hdmi
}

# VTC clock-enables must be high or AXI-lite hangs forever on MMIO.
if {[llength [get_bd_cells -quiet xlconstant_one]] == 0} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_one
}
set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] \
  [get_bd_cells xlconstant_one]

if {[llength [get_bd_cells -quiet v_tc_0]] == 0} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.2 v_tc_0
}
set_property -dict [list \
  CONFIG.enable_detection {false} \
  CONFIG.enable_generation {true} \
] [get_bd_cells v_tc_0]
# CEA 1920x1080 totals (2200x1125). Pixel clock 74.25 MHz → 30 Hz.
# v_tc VIDEO_MODE enum is 720p/480p/1080p/Custom — there is no 1080p30.
set_property CONFIG.VIDEO_MODE {1080p} [get_bd_cells v_tc_0]

if {[llength [get_bd_cells -quiet v_axi4s_vid_out_0]] == 0} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:v_axi4s_vid_out:4.0 v_axi4s_vid_out_0
}
set_property -dict [list \
  CONFIG.C_PIXELS_PER_CLOCK {1} \
  CONFIG.C_NATIVE_COMPONENT_WIDTH {8} \
  CONFIG.C_HAS_ASYNC_CLK {1} \
  CONFIG.C_ADDR_WIDTH {12} \
  CONFIG.C_VTG_MASTER_SLAVE {0} \
] [get_bd_cells v_axi4s_vid_out_0]

if {[llength [get_bd_cells -quiet rgb2dvi_0]] == 0} {
  create_bd_cell -type ip -vlnv digilentinc.com:ip:rgb2dvi:1.4 rgb2dvi_0
}
set_property -dict [list \
  CONFIG.kGenerateSerialClk {true} \
  CONFIG.kClkPrimitive {MMCM} \
  CONFIG.kClkRange {2} \
  CONFIG.kRstActiveHigh {false} \
] [get_bd_cells rgb2dvi_0]

# Stream path
foreach pair {
  {mipi_csi2_rx_subsyst_0/video_out axis_raw10to8/S_AXIS}
  {axis_raw10to8/M_AXIS v_demosaic_0/s_axis_video}
  {v_demosaic_0/m_axis_video axi_vdma_0/S_AXIS_S2MM}
  {axi_vdma_0/M_AXIS_MM2S v_axi4s_vid_out_0/video_in}
  {v_tc_0/vtiming_out v_axi4s_vid_out_0/vtiming_in}
} {
  catch {connect_bd_intf_net [get_bd_intf_pins [lindex $pair 0]] [get_bd_intf_pins [lindex $pair 1]]}
}

foreach pair {
  {v_axi4s_vid_out_0/vid_data rgb2dvi_0/vid_pData}
  {v_axi4s_vid_out_0/vid_hsync rgb2dvi_0/vid_pHSync}
  {v_axi4s_vid_out_0/vid_vsync rgb2dvi_0/vid_pVSync}
  {v_axi4s_vid_out_0/vid_active_video rgb2dvi_0/vid_pVDE}
  {v_axi4s_vid_out_0/vtg_ce v_tc_0/gen_clken}
} {
  catch {connect_bd_net [get_bd_pins [lindex $pair 0]] [get_bd_pins [lindex $pair 1]]}
}

# 100 MHz fabric
set fclk [get_bd_pins processing_system7_0/FCLK_CLK1]
set rstn [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
set rstn_fclk [get_bd_pins processing_system7_0/FCLK_RESET0_N]

foreach pair [list \
  [list $fclk [get_bd_pins axis_raw10to8/aclk]] \
  [list $rstn [get_bd_pins axis_raw10to8/aresetn]] \
  [list $fclk [get_bd_pins v_demosaic_0/ap_clk]] \
  [list $rstn [get_bd_pins v_demosaic_0/ap_rst_n]] \
  [list $fclk [get_bd_pins axi_vdma_0/m_axi_mm2s_aclk]] \
  [list $fclk [get_bd_pins axi_vdma_0/m_axis_mm2s_aclk]] \
  [list $fclk [get_bd_pins v_axi4s_vid_out_0/aclk]] \
  [list $rstn [get_bd_pins v_axi4s_vid_out_0/aresetn]] \
  [list $fclk [get_bd_pins v_tc_0/s_axi_aclk]] \
  [list $rstn [get_bd_pins v_tc_0/s_axi_aresetn]] \
  [list $fclk [get_bd_pins clk_wiz_hdmi/clk_in1]] \
  [list [get_bd_pins clk_wiz_hdmi/clk_out1] [get_bd_pins rst_hdmi/slowest_sync_clk]] \
  [list [get_bd_pins clk_wiz_hdmi/locked] [get_bd_pins rst_hdmi/dcm_locked]] \
  [list $rstn_fclk [get_bd_pins rst_hdmi/ext_reset_in]] \
  [list [get_bd_pins clk_wiz_hdmi/clk_out1] [get_bd_pins v_tc_0/clk]] \
  [list $rstn [get_bd_pins v_tc_0/resetn]] \
  [list [get_bd_pins clk_wiz_hdmi/clk_out1] [get_bd_pins v_axi4s_vid_out_0/vid_io_out_clk]] \
  [list [get_bd_pins rst_hdmi/peripheral_reset] [get_bd_pins v_axi4s_vid_out_0/vid_io_out_reset]] \
  [list [get_bd_pins clk_wiz_hdmi/clk_out1] [get_bd_pins rgb2dvi_0/PixelClk]] \
  [list [get_bd_pins rst_hdmi/peripheral_aresetn] [get_bd_pins rgb2dvi_0/aRst_n]] \
  [list [get_bd_pins xlconstant_one/dout] [get_bd_pins v_tc_0/s_axi_aclken]] \
  [list [get_bd_pins xlconstant_one/dout] [get_bd_pins v_tc_0/clken]] \
] {
  catch {connect_bd_net [lindex $pair 0] [lindex $pair 1]}
}

# TMDS -> Zybo HDMI OUT connector
# HDMI pins as plain ports + XDC (no Digilent TMDS VLNV)
foreach p {TMDS_Clk_p TMDS_Clk_n} {
  if {[llength [get_bd_ports -quiet $p]] == 0} {
    create_bd_port -dir O $p
  }
  catch {connect_bd_net [get_bd_pins rgb2dvi_0/$p] [get_bd_ports $p]}
}
if {[llength [get_bd_ports -quiet TMDS_Data_p]] == 0} {
  create_bd_port -dir O -from 2 -to 0 TMDS_Data_p
  create_bd_port -dir O -from 2 -to 0 TMDS_Data_n
}
catch {connect_bd_net [get_bd_pins rgb2dvi_0/TMDS_Data_p] [get_bd_ports TMDS_Data_p]}
catch {connect_bd_net [get_bd_pins rgb2dvi_0/TMDS_Data_n] [get_bd_ports TMDS_Data_n]}
set xdc [file join $proj_dir constrs hdmi_out.xdc]
catch {add_files -fileset constrs_1 -norecurse $xdc}

# AXI-Lite + MM2S to HP0
catch {apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
  -config [list Master "/processing_system7_0/M_AXI_GP0" Clk "Auto"] \
  [get_bd_intf_pins v_demosaic_0/s_axi_CTRL]}
catch {apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
  -config [list Master "/processing_system7_0/M_AXI_GP0" Clk "Auto"] \
  [get_bd_intf_pins v_tc_0/ctrl]}
catch {apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
  -config [list Slave "/processing_system7_0/S_AXI_HP0" Clk "Auto"] \
  [get_bd_intf_pins axi_vdma_0/M_AXI_MM2S]}

# axi_smc must have exactly 4 MI (CSI, VDMA, demosaic, VTC).
# A dangling M05/M04 with arready=0 hangs GP0 MMIO to every slave except M00.
set smc [get_bd_cells -quiet axi_smc]
if {[llength $smc]} {
  set_property CONFIG.NUM_MI {4} $smc
}

# VTC video resetn must not wait on clk_wiz lock (AXI-lite hangs while resetn=0).
set vtc_rstn [get_bd_pins v_tc_0/resetn]
set vtc_rstn_net [get_bd_nets -quiet -of_objects $vtc_rstn]
if {[llength $vtc_rstn_net]} {
  disconnect_bd_net $vtc_rstn_net $vtc_rstn
}
catch {connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] $vtc_rstn}

# 1080p30 needs 62.208 Mpixel/s; retain a 200 MHz display AXIS domain for headroom.
# The previous 1080p60 mode required 124.416 Mpixel/s, exceeding the old 100 MHz bus.
# Only the display AXIS domain runs at 200 MHz; DDR/AXI-Lite stay 100 MHz.
# Vivado derives asynchronous VDMA mode from these distinct clock connections.
proc reconnect_pin {source sink} {
  set pin [get_bd_pins $sink]
  set old [get_bd_nets -quiet -of_objects $pin]
  if {[llength $old]} { disconnect_bd_net $old $pin }
  connect_bd_net [get_bd_pins $source] $pin
}
if {![llength [get_bd_cells -quiet rst_display_axis]]} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_display_axis
}
reconnect_pin processing_system7_0/FCLK_CLK0 rst_display_axis/slowest_sync_clk
reconnect_pin processing_system7_0/FCLK_RESET0_N rst_display_axis/ext_reset_in
reconnect_pin xlconstant_one/dout rst_display_axis/dcm_locked
reconnect_pin processing_system7_0/FCLK_CLK0 axi_vdma_0/m_axis_mm2s_aclk
reconnect_pin processing_system7_0/FCLK_CLK0 v_axi4s_vid_out_0/aclk
reconnect_pin rst_display_axis/peripheral_aresetn v_axi4s_vid_out_0/aresetn
reconnect_pin xlconstant_one/dout v_axi4s_vid_out_0/aclken
reconnect_pin xlconstant_one/dout v_axi4s_vid_out_0/vid_io_out_ce
# Slave mode allows the bridge to align VTC timing to AXIS start-of-frame.
reconnect_pin v_axi4s_vid_out_0/vtg_ce v_tc_0/gen_clken

assign_bd_address
regenerate_bd_layout
validate_bd_design
save_bd_design

# Wrapper
set wrap [make_wrapper -files [get_files design_1.bd] -top]
add_files -norecurse $wrap
update_compile_order -fileset sources_1
set_property top design_1_wrapper [current_fileset]

# Build
reset_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 6
wait_on_run impl_1

set impl_status [get_property STATUS [get_runs impl_1]]
set impl_progress [get_property PROGRESS [get_runs impl_1]]
puts "IMPL STATUS=$impl_status PROGRESS=$impl_progress"
if {[get_property PROGRESS [get_runs impl_1]] != "100%"} {
  error "Implementation failed: $impl_status"
}

# Do not export an image that violates serializer or data-path timing.
set timing_file [file join $proj_dir zybo_z7_imx219 zybo_z7_imx219.runs impl_1 design_1_wrapper_timing_summary_routed.rpt]
set tf [open $timing_file r]
set timing_text [read $tf]
close $tf
if {[string first "Timing constraints are not met" $timing_text] >= 0} {
  error "Timing failed: inspect $timing_file before programming the board"
}
write_hw_platform -fixed -include_bit -force $xsa_out
puts "XSA written: $xsa_out"
exit 0
