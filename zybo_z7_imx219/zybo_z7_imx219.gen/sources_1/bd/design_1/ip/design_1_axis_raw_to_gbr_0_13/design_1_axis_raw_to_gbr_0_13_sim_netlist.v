// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Wed Sep 23 20:04:07 2026
// Host        : DESKTOP-6M954OF running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               v:/zybo_z7_imx219/zybo_z7_imx219.gen/sources_1/bd/design_1/ip/design_1_axis_raw_to_gbr_0_13/design_1_axis_raw_to_gbr_0_13_sim_netlist.v
// Design      : design_1_axis_raw_to_gbr_0_13
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_axis_raw_to_gbr_0_13,axis_raw8_to_gbr,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "axis_raw8_to_gbr,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module design_1_axis_raw_to_gbr_0_13
   (aclk,
    aresetn,
    s_axis_tdata,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tuser,
    s_axis_tlast,
    m_axis_tdata,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tuser,
    m_axis_tlast,
    bayer_phase);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK2, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK2, LAYERED_METADATA undef, INSERT_VIP 0" *) input [7:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER" *) input s_axis_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK2, LAYERED_METADATA undef, INSERT_VIP 0" *) output [23:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER" *) output m_axis_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output m_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 bayer_phase DATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME bayer_phase, LAYERED_METADATA undef" *) input [1:0]bayer_phase;

  wire aclk;
  wire aresetn;
  wire [1:0]bayer_phase;
  wire [23:0]m_axis_tdata;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire m_axis_tuser;
  wire m_axis_tvalid;
  wire [7:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tuser;
  wire s_axis_tvalid;

  design_1_axis_raw_to_gbr_0_13_axis_raw8_to_gbr inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .bayer_phase(bayer_phase),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tuser(m_axis_tuser),
        .m_axis_tvalid_reg_0(m_axis_tvalid),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "axis_raw8_to_gbr" *) 
module design_1_axis_raw_to_gbr_0_13_axis_raw8_to_gbr
   (m_axis_tvalid_reg_0,
    m_axis_tdata,
    m_axis_tuser,
    m_axis_tlast,
    s_axis_tready,
    aclk,
    s_axis_tdata,
    s_axis_tuser,
    aresetn,
    m_axis_tready,
    s_axis_tvalid,
    s_axis_tlast,
    bayer_phase);
  output m_axis_tvalid_reg_0;
  output [23:0]m_axis_tdata;
  output m_axis_tuser;
  output m_axis_tlast;
  output s_axis_tready;
  input aclk;
  input [7:0]s_axis_tdata;
  input s_axis_tuser;
  input aresetn;
  input m_axis_tready;
  input s_axis_tvalid;
  input s_axis_tlast;
  input [1:0]bayer_phase;

  wire aclk;
  wire aresetn;
  wire [1:0]bayer_phase;
  wire have_prev_row_i_1_n_0;
  wire have_prev_row_reg_n_0;
  wire \left_pixel_reg_n_0_[2] ;
  wire \left_pixel_reg_n_0_[3] ;
  wire \left_pixel_reg_n_0_[4] ;
  wire \left_pixel_reg_n_0_[5] ;
  wire \left_pixel_reg_n_0_[6] ;
  wire \left_pixel_reg_n_0_[7] ;
  wire \left_pixel_reg_n_0_[8] ;
  wire \left_pixel_reg_n_0_[9] ;
  wire [23:0]m_axis_tdata;
  wire \m_axis_tdata[10]_i_2_n_0 ;
  wire \m_axis_tdata[11]_i_2_n_0 ;
  wire \m_axis_tdata[12]_i_2_n_0 ;
  wire \m_axis_tdata[13]_i_2_n_0 ;
  wire \m_axis_tdata[14]_i_2_n_0 ;
  wire \m_axis_tdata[15]_i_2_n_0 ;
  wire \m_axis_tdata[15]_i_3_n_0 ;
  wire \m_axis_tdata[15]_i_4_n_0 ;
  wire \m_axis_tdata[15]_i_5_n_0 ;
  wire \m_axis_tdata[15]_i_6_n_0 ;
  wire \m_axis_tdata[15]_i_7_n_0 ;
  wire \m_axis_tdata[15]_i_8_n_0 ;
  wire \m_axis_tdata[16]_i_2_n_0 ;
  wire \m_axis_tdata[17]_i_2_n_0 ;
  wire \m_axis_tdata[18]_i_2_n_0 ;
  wire \m_axis_tdata[19]_i_2_n_0 ;
  wire \m_axis_tdata[20]_i_2_n_0 ;
  wire \m_axis_tdata[21]_i_2_n_0 ;
  wire \m_axis_tdata[22]_i_2_n_0 ;
  wire \m_axis_tdata[23]_i_10_n_0 ;
  wire \m_axis_tdata[23]_i_11_n_0 ;
  wire \m_axis_tdata[23]_i_12_n_0 ;
  wire \m_axis_tdata[23]_i_13_n_0 ;
  wire \m_axis_tdata[23]_i_2_n_0 ;
  wire \m_axis_tdata[23]_i_4_n_0 ;
  wire \m_axis_tdata[23]_i_5_n_0 ;
  wire \m_axis_tdata[23]_i_6_n_0 ;
  wire \m_axis_tdata[23]_i_7_n_0 ;
  wire \m_axis_tdata[23]_i_8_n_0 ;
  wire \m_axis_tdata[23]_i_9_n_0 ;
  wire \m_axis_tdata[7]_i_2_n_0 ;
  wire \m_axis_tdata[7]_i_3_n_0 ;
  wire \m_axis_tdata[7]_i_4_n_0 ;
  wire \m_axis_tdata[8]_i_2_n_0 ;
  wire \m_axis_tdata[9]_i_2_n_0 ;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire m_axis_tuser;
  wire m_axis_tvalid_i_1_n_0;
  wire m_axis_tvalid_reg_0;
  wire p_0_in;
  wire [10:1]p_2_in;
  wire [23:0]p_3_out;
  wire prev_row_reg_0_127_0_0__1_i_1_n_0;
  wire prev_row_reg_0_127_0_0__1_i_2_n_0;
  wire prev_row_reg_0_127_0_0__1_n_0;
  wire prev_row_reg_0_127_0_0__2_n_0;
  wire prev_row_reg_0_127_0_0__3_n_0;
  wire prev_row_reg_0_127_0_0__4_n_0;
  wire prev_row_reg_0_127_0_0__5_n_0;
  wire prev_row_reg_0_127_0_0__6_n_0;
  wire prev_row_reg_0_127_0_0__7_n_0;
  wire prev_row_reg_0_127_0_0__8_n_0;
  wire prev_row_reg_0_255_2_2_i_1_n_0;
  wire prev_row_reg_0_255_2_2_i_2_n_0;
  wire prev_row_reg_0_255_2_2_i_3_n_0;
  wire prev_row_reg_0_255_2_2_i_4_n_0;
  wire prev_row_reg_0_255_2_2_i_5_n_0;
  wire prev_row_reg_0_255_2_2_i_6_n_0;
  wire prev_row_reg_0_255_2_2_i_7_n_0;
  wire prev_row_reg_0_255_2_2_i_8_n_0;
  wire prev_row_reg_0_255_2_2_i_9_n_0;
  wire prev_row_reg_0_255_2_2_n_0;
  wire prev_row_reg_0_255_3_3_n_0;
  wire prev_row_reg_0_255_4_4_n_0;
  wire prev_row_reg_0_255_5_5_n_0;
  wire prev_row_reg_0_255_6_6_n_0;
  wire prev_row_reg_0_255_7_7_n_0;
  wire prev_row_reg_0_255_8_8_n_0;
  wire prev_row_reg_0_255_9_9_n_0;
  wire prev_row_reg_1024_1279_2_2_i_1_n_0;
  wire prev_row_reg_1024_1279_2_2_n_0;
  wire prev_row_reg_1024_1279_3_3_n_0;
  wire prev_row_reg_1024_1279_4_4_n_0;
  wire prev_row_reg_1024_1279_5_5_n_0;
  wire prev_row_reg_1024_1279_6_6_n_0;
  wire prev_row_reg_1024_1279_7_7_n_0;
  wire prev_row_reg_1024_1279_8_8_n_0;
  wire prev_row_reg_1024_1279_9_9_n_0;
  wire prev_row_reg_1280_1535_2_2_i_1_n_0;
  wire prev_row_reg_1280_1535_2_2_n_0;
  wire prev_row_reg_1280_1535_3_3_n_0;
  wire prev_row_reg_1280_1535_4_4_n_0;
  wire prev_row_reg_1280_1535_5_5_n_0;
  wire prev_row_reg_1280_1535_6_6_n_0;
  wire prev_row_reg_1280_1535_7_7_n_0;
  wire prev_row_reg_1280_1535_8_8_n_0;
  wire prev_row_reg_1280_1535_9_9_n_0;
  wire prev_row_reg_1536_1791_2_2_i_1_n_0;
  wire prev_row_reg_1536_1791_2_2_n_0;
  wire prev_row_reg_1536_1791_3_3_n_0;
  wire prev_row_reg_1536_1791_4_4_n_0;
  wire prev_row_reg_1536_1791_5_5_n_0;
  wire prev_row_reg_1536_1791_6_6_n_0;
  wire prev_row_reg_1536_1791_7_7_n_0;
  wire prev_row_reg_1536_1791_8_8_n_0;
  wire prev_row_reg_1536_1791_9_9_n_0;
  wire prev_row_reg_256_511_2_2_i_1_n_0;
  wire prev_row_reg_256_511_2_2_n_0;
  wire prev_row_reg_256_511_3_3_n_0;
  wire prev_row_reg_256_511_4_4_n_0;
  wire prev_row_reg_256_511_5_5_n_0;
  wire prev_row_reg_256_511_6_6_n_0;
  wire prev_row_reg_256_511_7_7_n_0;
  wire prev_row_reg_256_511_8_8_n_0;
  wire prev_row_reg_256_511_9_9_n_0;
  wire prev_row_reg_512_767_2_2_i_1_n_0;
  wire prev_row_reg_512_767_2_2_n_0;
  wire prev_row_reg_512_767_3_3_n_0;
  wire prev_row_reg_512_767_4_4_n_0;
  wire prev_row_reg_512_767_5_5_n_0;
  wire prev_row_reg_512_767_6_6_n_0;
  wire prev_row_reg_512_767_7_7_n_0;
  wire prev_row_reg_512_767_8_8_n_0;
  wire prev_row_reg_512_767_9_9_n_0;
  wire prev_row_reg_768_1023_2_2_i_1_n_0;
  wire prev_row_reg_768_1023_2_2_n_0;
  wire prev_row_reg_768_1023_3_3_n_0;
  wire prev_row_reg_768_1023_4_4_n_0;
  wire prev_row_reg_768_1023_5_5_n_0;
  wire prev_row_reg_768_1023_6_6_n_0;
  wire prev_row_reg_768_1023_7_7_n_0;
  wire prev_row_reg_768_1023_8_8_n_0;
  wire prev_row_reg_768_1023_9_9_n_0;
  wire [7:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tuser;
  wire s_axis_tvalid;
  wire site_color3;
  wire [9:2]up;
  wire [9:2]up_left_pixel;
  wire \up_left_pixel[2]_i_2_n_0 ;
  wire \up_left_pixel[2]_i_3_n_0 ;
  wire \up_left_pixel[2]_i_4_n_0 ;
  wire \up_left_pixel[2]_i_5_n_0 ;
  wire \up_left_pixel[2]_i_6_n_0 ;
  wire \up_left_pixel[2]_i_7_n_0 ;
  wire \up_left_pixel[3]_i_2_n_0 ;
  wire \up_left_pixel[3]_i_3_n_0 ;
  wire \up_left_pixel[3]_i_4_n_0 ;
  wire \up_left_pixel[3]_i_5_n_0 ;
  wire \up_left_pixel[3]_i_6_n_0 ;
  wire \up_left_pixel[3]_i_7_n_0 ;
  wire \up_left_pixel[4]_i_2_n_0 ;
  wire \up_left_pixel[4]_i_3_n_0 ;
  wire \up_left_pixel[4]_i_4_n_0 ;
  wire \up_left_pixel[4]_i_5_n_0 ;
  wire \up_left_pixel[4]_i_6_n_0 ;
  wire \up_left_pixel[4]_i_7_n_0 ;
  wire \up_left_pixel[5]_i_2_n_0 ;
  wire \up_left_pixel[5]_i_3_n_0 ;
  wire \up_left_pixel[5]_i_4_n_0 ;
  wire \up_left_pixel[5]_i_5_n_0 ;
  wire \up_left_pixel[5]_i_6_n_0 ;
  wire \up_left_pixel[5]_i_7_n_0 ;
  wire \up_left_pixel[6]_i_2_n_0 ;
  wire \up_left_pixel[6]_i_3_n_0 ;
  wire \up_left_pixel[6]_i_4_n_0 ;
  wire \up_left_pixel[6]_i_5_n_0 ;
  wire \up_left_pixel[6]_i_6_n_0 ;
  wire \up_left_pixel[6]_i_7_n_0 ;
  wire \up_left_pixel[7]_i_2_n_0 ;
  wire \up_left_pixel[7]_i_3_n_0 ;
  wire \up_left_pixel[7]_i_4_n_0 ;
  wire \up_left_pixel[7]_i_5_n_0 ;
  wire \up_left_pixel[7]_i_6_n_0 ;
  wire \up_left_pixel[7]_i_7_n_0 ;
  wire \up_left_pixel[8]_i_2_n_0 ;
  wire \up_left_pixel[8]_i_3_n_0 ;
  wire \up_left_pixel[8]_i_4_n_0 ;
  wire \up_left_pixel[8]_i_5_n_0 ;
  wire \up_left_pixel[8]_i_6_n_0 ;
  wire \up_left_pixel[8]_i_7_n_0 ;
  wire \up_left_pixel[9]_i_2_n_0 ;
  wire \up_left_pixel[9]_i_3_n_0 ;
  wire \up_left_pixel[9]_i_4_n_0 ;
  wire \up_left_pixel[9]_i_5_n_0 ;
  wire \up_left_pixel[9]_i_6_n_0 ;
  wire \up_left_pixel[9]_i_7_n_0 ;
  wire [10:0]x;
  wire \x[10]_i_1_n_0 ;
  wire \x[10]_i_3_n_0 ;
  wire \x[5]_i_2_n_0 ;
  wire \x[6]_i_2_n_0 ;
  wire \x[9]_i_2_n_0 ;
  wire y_odd;
  wire y_odd_i_1_n_0;

  LUT5 #(
    .INIT(32'hEE2A0000)) 
    have_prev_row_i_1
       (.I0(have_prev_row_reg_n_0),
        .I1(\m_axis_tdata[23]_i_2_n_0 ),
        .I2(s_axis_tuser),
        .I3(s_axis_tlast),
        .I4(aresetn),
        .O(have_prev_row_i_1_n_0));
  FDRE have_prev_row_reg
       (.C(aclk),
        .CE(1'b1),
        .D(have_prev_row_i_1_n_0),
        .Q(have_prev_row_reg_n_0),
        .R(1'b0));
  FDRE \left_pixel_reg[2] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(s_axis_tdata[0]),
        .Q(\left_pixel_reg_n_0_[2] ),
        .R(p_0_in));
  FDRE \left_pixel_reg[3] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(s_axis_tdata[1]),
        .Q(\left_pixel_reg_n_0_[3] ),
        .R(p_0_in));
  FDRE \left_pixel_reg[4] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(s_axis_tdata[2]),
        .Q(\left_pixel_reg_n_0_[4] ),
        .R(p_0_in));
  FDRE \left_pixel_reg[5] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(s_axis_tdata[3]),
        .Q(\left_pixel_reg_n_0_[5] ),
        .R(p_0_in));
  FDRE \left_pixel_reg[6] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(s_axis_tdata[4]),
        .Q(\left_pixel_reg_n_0_[6] ),
        .R(p_0_in));
  FDRE \left_pixel_reg[7] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(s_axis_tdata[5]),
        .Q(\left_pixel_reg_n_0_[7] ),
        .R(p_0_in));
  FDRE \left_pixel_reg[8] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(s_axis_tdata[6]),
        .Q(\left_pixel_reg_n_0_[8] ),
        .R(p_0_in));
  FDRE \left_pixel_reg[9] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(s_axis_tdata[7]),
        .Q(\left_pixel_reg_n_0_[9] ),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'hF888)) 
    \m_axis_tdata[0]_i_1 
       (.I0(s_axis_tdata[0]),
        .I1(\m_axis_tdata[7]_i_2_n_0 ),
        .I2(\left_pixel_reg_n_0_[2] ),
        .I3(\m_axis_tdata[7]_i_3_n_0 ),
        .O(p_3_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[10]_i_1 
       (.I0(s_axis_tdata[2]),
        .I1(\m_axis_tdata[15]_i_2_n_0 ),
        .I2(\m_axis_tdata[10]_i_2_n_0 ),
        .O(p_3_out[10]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[10]_i_2 
       (.I0(\m_axis_tdata[15]_i_5_n_0 ),
        .I1(up_left_pixel[4]),
        .I2(\m_axis_tdata[15]_i_6_n_0 ),
        .I3(up[4]),
        .I4(\left_pixel_reg_n_0_[4] ),
        .I5(\m_axis_tdata[15]_i_7_n_0 ),
        .O(\m_axis_tdata[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[11]_i_1 
       (.I0(s_axis_tdata[3]),
        .I1(\m_axis_tdata[15]_i_2_n_0 ),
        .I2(\m_axis_tdata[11]_i_2_n_0 ),
        .O(p_3_out[11]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[11]_i_2 
       (.I0(\m_axis_tdata[15]_i_5_n_0 ),
        .I1(up_left_pixel[5]),
        .I2(\m_axis_tdata[15]_i_6_n_0 ),
        .I3(up[5]),
        .I4(\left_pixel_reg_n_0_[5] ),
        .I5(\m_axis_tdata[15]_i_7_n_0 ),
        .O(\m_axis_tdata[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[12]_i_1 
       (.I0(s_axis_tdata[4]),
        .I1(\m_axis_tdata[15]_i_2_n_0 ),
        .I2(\m_axis_tdata[12]_i_2_n_0 ),
        .O(p_3_out[12]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[12]_i_2 
       (.I0(\m_axis_tdata[15]_i_5_n_0 ),
        .I1(up_left_pixel[6]),
        .I2(\m_axis_tdata[15]_i_6_n_0 ),
        .I3(up[6]),
        .I4(\left_pixel_reg_n_0_[6] ),
        .I5(\m_axis_tdata[15]_i_7_n_0 ),
        .O(\m_axis_tdata[12]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[13]_i_1 
       (.I0(s_axis_tdata[5]),
        .I1(\m_axis_tdata[15]_i_2_n_0 ),
        .I2(\m_axis_tdata[13]_i_2_n_0 ),
        .O(p_3_out[13]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[13]_i_2 
       (.I0(\m_axis_tdata[15]_i_5_n_0 ),
        .I1(up_left_pixel[7]),
        .I2(\m_axis_tdata[15]_i_6_n_0 ),
        .I3(up[7]),
        .I4(\left_pixel_reg_n_0_[7] ),
        .I5(\m_axis_tdata[15]_i_7_n_0 ),
        .O(\m_axis_tdata[13]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[14]_i_1 
       (.I0(s_axis_tdata[6]),
        .I1(\m_axis_tdata[15]_i_2_n_0 ),
        .I2(\m_axis_tdata[14]_i_2_n_0 ),
        .O(p_3_out[14]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[14]_i_2 
       (.I0(\m_axis_tdata[15]_i_5_n_0 ),
        .I1(up_left_pixel[8]),
        .I2(\m_axis_tdata[15]_i_6_n_0 ),
        .I3(up[8]),
        .I4(\left_pixel_reg_n_0_[8] ),
        .I5(\m_axis_tdata[15]_i_7_n_0 ),
        .O(\m_axis_tdata[14]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[15]_i_1 
       (.I0(s_axis_tdata[7]),
        .I1(\m_axis_tdata[15]_i_2_n_0 ),
        .I2(\m_axis_tdata[15]_i_3_n_0 ),
        .O(p_3_out[15]));
  LUT6 #(
    .INIT(64'hFFFFFFFF11D1DDD1)) 
    \m_axis_tdata[15]_i_2 
       (.I0(have_prev_row_reg_n_0),
        .I1(\m_axis_tdata[23]_i_7_n_0 ),
        .I2(\m_axis_tdata[15]_i_4_n_0 ),
        .I3(x[0]),
        .I4(bayer_phase[0]),
        .I5(s_axis_tuser),
        .O(\m_axis_tdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[15]_i_3 
       (.I0(\m_axis_tdata[15]_i_5_n_0 ),
        .I1(up_left_pixel[9]),
        .I2(\m_axis_tdata[15]_i_6_n_0 ),
        .I3(up[9]),
        .I4(\left_pixel_reg_n_0_[9] ),
        .I5(\m_axis_tdata[15]_i_7_n_0 ),
        .O(\m_axis_tdata[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAAB)) 
    \m_axis_tdata[15]_i_4 
       (.I0(bayer_phase[0]),
        .I1(x[4]),
        .I2(x[3]),
        .I3(x[6]),
        .I4(x[5]),
        .I5(\m_axis_tdata[23]_i_11_n_0 ),
        .O(\m_axis_tdata[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0082008200820080)) 
    \m_axis_tdata[15]_i_5 
       (.I0(\m_axis_tdata[15]_i_8_n_0 ),
        .I1(bayer_phase[0]),
        .I2(x[0]),
        .I3(s_axis_tuser),
        .I4(\m_axis_tdata[23]_i_11_n_0 ),
        .I5(\m_axis_tdata[23]_i_13_n_0 ),
        .O(\m_axis_tdata[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h020802080208020A)) 
    \m_axis_tdata[15]_i_6 
       (.I0(\m_axis_tdata[15]_i_8_n_0 ),
        .I1(x[0]),
        .I2(s_axis_tuser),
        .I3(bayer_phase[0]),
        .I4(\m_axis_tdata[23]_i_11_n_0 ),
        .I5(\m_axis_tdata[23]_i_13_n_0 ),
        .O(\m_axis_tdata[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0909090800000000)) 
    \m_axis_tdata[15]_i_7 
       (.I0(bayer_phase[0]),
        .I1(x[0]),
        .I2(s_axis_tuser),
        .I3(\m_axis_tdata[23]_i_11_n_0 ),
        .I4(\m_axis_tdata[23]_i_13_n_0 ),
        .I5(\m_axis_tdata[23]_i_7_n_0 ),
        .O(\m_axis_tdata[15]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h82)) 
    \m_axis_tdata[15]_i_8 
       (.I0(have_prev_row_reg_n_0),
        .I1(y_odd),
        .I2(bayer_phase[1]),
        .O(\m_axis_tdata[15]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[16]_i_1 
       (.I0(s_axis_tdata[0]),
        .I1(\m_axis_tdata[23]_i_4_n_0 ),
        .I2(\m_axis_tdata[16]_i_2_n_0 ),
        .O(p_3_out[16]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[16]_i_2 
       (.I0(\m_axis_tdata[23]_i_8_n_0 ),
        .I1(up_left_pixel[2]),
        .I2(\m_axis_tdata[23]_i_9_n_0 ),
        .I3(up[2]),
        .I4(\left_pixel_reg_n_0_[2] ),
        .I5(\m_axis_tdata[23]_i_10_n_0 ),
        .O(\m_axis_tdata[16]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[17]_i_1 
       (.I0(s_axis_tdata[1]),
        .I1(\m_axis_tdata[23]_i_4_n_0 ),
        .I2(\m_axis_tdata[17]_i_2_n_0 ),
        .O(p_3_out[17]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[17]_i_2 
       (.I0(\m_axis_tdata[23]_i_8_n_0 ),
        .I1(up_left_pixel[3]),
        .I2(\m_axis_tdata[23]_i_9_n_0 ),
        .I3(up[3]),
        .I4(\left_pixel_reg_n_0_[3] ),
        .I5(\m_axis_tdata[23]_i_10_n_0 ),
        .O(\m_axis_tdata[17]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[18]_i_1 
       (.I0(s_axis_tdata[2]),
        .I1(\m_axis_tdata[23]_i_4_n_0 ),
        .I2(\m_axis_tdata[18]_i_2_n_0 ),
        .O(p_3_out[18]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[18]_i_2 
       (.I0(\m_axis_tdata[23]_i_8_n_0 ),
        .I1(up_left_pixel[4]),
        .I2(\m_axis_tdata[23]_i_9_n_0 ),
        .I3(up[4]),
        .I4(\left_pixel_reg_n_0_[4] ),
        .I5(\m_axis_tdata[23]_i_10_n_0 ),
        .O(\m_axis_tdata[18]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[19]_i_1 
       (.I0(s_axis_tdata[3]),
        .I1(\m_axis_tdata[23]_i_4_n_0 ),
        .I2(\m_axis_tdata[19]_i_2_n_0 ),
        .O(p_3_out[19]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[19]_i_2 
       (.I0(\m_axis_tdata[23]_i_8_n_0 ),
        .I1(up_left_pixel[5]),
        .I2(\m_axis_tdata[23]_i_9_n_0 ),
        .I3(up[5]),
        .I4(\left_pixel_reg_n_0_[5] ),
        .I5(\m_axis_tdata[23]_i_10_n_0 ),
        .O(\m_axis_tdata[19]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \m_axis_tdata[1]_i_1 
       (.I0(s_axis_tdata[1]),
        .I1(\m_axis_tdata[7]_i_2_n_0 ),
        .I2(\left_pixel_reg_n_0_[3] ),
        .I3(\m_axis_tdata[7]_i_3_n_0 ),
        .O(p_3_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[20]_i_1 
       (.I0(s_axis_tdata[4]),
        .I1(\m_axis_tdata[23]_i_4_n_0 ),
        .I2(\m_axis_tdata[20]_i_2_n_0 ),
        .O(p_3_out[20]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[20]_i_2 
       (.I0(\m_axis_tdata[23]_i_8_n_0 ),
        .I1(up_left_pixel[6]),
        .I2(\m_axis_tdata[23]_i_9_n_0 ),
        .I3(up[6]),
        .I4(\left_pixel_reg_n_0_[6] ),
        .I5(\m_axis_tdata[23]_i_10_n_0 ),
        .O(\m_axis_tdata[20]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[21]_i_1 
       (.I0(s_axis_tdata[5]),
        .I1(\m_axis_tdata[23]_i_4_n_0 ),
        .I2(\m_axis_tdata[21]_i_2_n_0 ),
        .O(p_3_out[21]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[21]_i_2 
       (.I0(\m_axis_tdata[23]_i_8_n_0 ),
        .I1(up_left_pixel[7]),
        .I2(\m_axis_tdata[23]_i_9_n_0 ),
        .I3(up[7]),
        .I4(\left_pixel_reg_n_0_[7] ),
        .I5(\m_axis_tdata[23]_i_10_n_0 ),
        .O(\m_axis_tdata[21]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[22]_i_1 
       (.I0(s_axis_tdata[6]),
        .I1(\m_axis_tdata[23]_i_4_n_0 ),
        .I2(\m_axis_tdata[22]_i_2_n_0 ),
        .O(p_3_out[22]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[22]_i_2 
       (.I0(\m_axis_tdata[23]_i_8_n_0 ),
        .I1(up_left_pixel[8]),
        .I2(\m_axis_tdata[23]_i_9_n_0 ),
        .I3(up[8]),
        .I4(\left_pixel_reg_n_0_[8] ),
        .I5(\m_axis_tdata[23]_i_10_n_0 ),
        .O(\m_axis_tdata[22]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \m_axis_tdata[23]_i_1 
       (.I0(aresetn),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'h0000000012121202)) 
    \m_axis_tdata[23]_i_10 
       (.I0(x[0]),
        .I1(s_axis_tuser),
        .I2(bayer_phase[0]),
        .I3(\m_axis_tdata[23]_i_11_n_0 ),
        .I4(\m_axis_tdata[23]_i_13_n_0 ),
        .I5(\m_axis_tdata[23]_i_7_n_0 ),
        .O(\m_axis_tdata[23]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \m_axis_tdata[23]_i_11 
       (.I0(x[9]),
        .I1(x[10]),
        .I2(x[7]),
        .I3(x[8]),
        .I4(x[2]),
        .I5(x[1]),
        .O(\m_axis_tdata[23]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \m_axis_tdata[23]_i_12 
       (.I0(y_odd),
        .I1(bayer_phase[1]),
        .I2(have_prev_row_reg_n_0),
        .O(\m_axis_tdata[23]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \m_axis_tdata[23]_i_13 
       (.I0(x[4]),
        .I1(x[3]),
        .I2(x[6]),
        .I3(x[5]),
        .O(\m_axis_tdata[23]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \m_axis_tdata[23]_i_2 
       (.I0(m_axis_tvalid_reg_0),
        .I1(m_axis_tready),
        .I2(s_axis_tvalid),
        .O(\m_axis_tdata[23]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[23]_i_3 
       (.I0(s_axis_tdata[7]),
        .I1(\m_axis_tdata[23]_i_4_n_0 ),
        .I2(\m_axis_tdata[23]_i_5_n_0 ),
        .O(p_3_out[23]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00E2FFE2)) 
    \m_axis_tdata[23]_i_4 
       (.I0(\m_axis_tdata[23]_i_6_n_0 ),
        .I1(x[0]),
        .I2(bayer_phase[0]),
        .I3(\m_axis_tdata[23]_i_7_n_0 ),
        .I4(have_prev_row_reg_n_0),
        .I5(s_axis_tuser),
        .O(\m_axis_tdata[23]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[23]_i_5 
       (.I0(\m_axis_tdata[23]_i_8_n_0 ),
        .I1(up_left_pixel[9]),
        .I2(\m_axis_tdata[23]_i_9_n_0 ),
        .I3(up[9]),
        .I4(\left_pixel_reg_n_0_[9] ),
        .I5(\m_axis_tdata[23]_i_10_n_0 ),
        .O(\m_axis_tdata[23]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    \m_axis_tdata[23]_i_6 
       (.I0(x[4]),
        .I1(x[3]),
        .I2(x[6]),
        .I3(x[5]),
        .I4(\m_axis_tdata[23]_i_11_n_0 ),
        .I5(bayer_phase[0]),
        .O(\m_axis_tdata[23]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \m_axis_tdata[23]_i_7 
       (.I0(bayer_phase[1]),
        .I1(y_odd),
        .O(\m_axis_tdata[23]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0208020802080008)) 
    \m_axis_tdata[23]_i_8 
       (.I0(\m_axis_tdata[23]_i_12_n_0 ),
        .I1(x[0]),
        .I2(s_axis_tuser),
        .I3(bayer_phase[0]),
        .I4(\m_axis_tdata[23]_i_11_n_0 ),
        .I5(\m_axis_tdata[23]_i_13_n_0 ),
        .O(\m_axis_tdata[23]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h008200820082008A)) 
    \m_axis_tdata[23]_i_9 
       (.I0(\m_axis_tdata[23]_i_12_n_0 ),
        .I1(bayer_phase[0]),
        .I2(x[0]),
        .I3(s_axis_tuser),
        .I4(\m_axis_tdata[23]_i_11_n_0 ),
        .I5(\m_axis_tdata[23]_i_13_n_0 ),
        .O(\m_axis_tdata[23]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hF888)) 
    \m_axis_tdata[2]_i_1 
       (.I0(s_axis_tdata[2]),
        .I1(\m_axis_tdata[7]_i_2_n_0 ),
        .I2(\left_pixel_reg_n_0_[4] ),
        .I3(\m_axis_tdata[7]_i_3_n_0 ),
        .O(p_3_out[2]));
  LUT4 #(
    .INIT(16'hF888)) 
    \m_axis_tdata[3]_i_1 
       (.I0(s_axis_tdata[3]),
        .I1(\m_axis_tdata[7]_i_2_n_0 ),
        .I2(\left_pixel_reg_n_0_[5] ),
        .I3(\m_axis_tdata[7]_i_3_n_0 ),
        .O(p_3_out[3]));
  LUT4 #(
    .INIT(16'hF888)) 
    \m_axis_tdata[4]_i_1 
       (.I0(s_axis_tdata[4]),
        .I1(\m_axis_tdata[7]_i_2_n_0 ),
        .I2(\left_pixel_reg_n_0_[6] ),
        .I3(\m_axis_tdata[7]_i_3_n_0 ),
        .O(p_3_out[4]));
  LUT4 #(
    .INIT(16'hF888)) 
    \m_axis_tdata[5]_i_1 
       (.I0(s_axis_tdata[5]),
        .I1(\m_axis_tdata[7]_i_2_n_0 ),
        .I2(\left_pixel_reg_n_0_[7] ),
        .I3(\m_axis_tdata[7]_i_3_n_0 ),
        .O(p_3_out[5]));
  LUT4 #(
    .INIT(16'hF888)) 
    \m_axis_tdata[6]_i_1 
       (.I0(s_axis_tdata[6]),
        .I1(\m_axis_tdata[7]_i_2_n_0 ),
        .I2(\left_pixel_reg_n_0_[8] ),
        .I3(\m_axis_tdata[7]_i_3_n_0 ),
        .O(p_3_out[6]));
  LUT4 #(
    .INIT(16'hF888)) 
    \m_axis_tdata[7]_i_1 
       (.I0(s_axis_tdata[7]),
        .I1(\m_axis_tdata[7]_i_2_n_0 ),
        .I2(\left_pixel_reg_n_0_[9] ),
        .I3(\m_axis_tdata[7]_i_3_n_0 ),
        .O(p_3_out[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFF696996FF)) 
    \m_axis_tdata[7]_i_2 
       (.I0(y_odd),
        .I1(bayer_phase[1]),
        .I2(bayer_phase[0]),
        .I3(\m_axis_tdata[7]_i_4_n_0 ),
        .I4(x[0]),
        .I5(s_axis_tuser),
        .O(\m_axis_tdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000C33C00002882)) 
    \m_axis_tdata[7]_i_3 
       (.I0(\m_axis_tdata[7]_i_4_n_0 ),
        .I1(y_odd),
        .I2(bayer_phase[1]),
        .I3(bayer_phase[0]),
        .I4(s_axis_tuser),
        .I5(x[0]),
        .O(\m_axis_tdata[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \m_axis_tdata[7]_i_4 
       (.I0(\m_axis_tdata[23]_i_11_n_0 ),
        .I1(x[5]),
        .I2(x[6]),
        .I3(x[3]),
        .I4(x[4]),
        .O(\m_axis_tdata[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[8]_i_1 
       (.I0(s_axis_tdata[0]),
        .I1(\m_axis_tdata[15]_i_2_n_0 ),
        .I2(\m_axis_tdata[8]_i_2_n_0 ),
        .O(p_3_out[8]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[8]_i_2 
       (.I0(\m_axis_tdata[15]_i_5_n_0 ),
        .I1(up_left_pixel[2]),
        .I2(\m_axis_tdata[15]_i_6_n_0 ),
        .I3(up[2]),
        .I4(\left_pixel_reg_n_0_[2] ),
        .I5(\m_axis_tdata[15]_i_7_n_0 ),
        .O(\m_axis_tdata[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \m_axis_tdata[9]_i_1 
       (.I0(s_axis_tdata[1]),
        .I1(\m_axis_tdata[15]_i_2_n_0 ),
        .I2(\m_axis_tdata[9]_i_2_n_0 ),
        .O(p_3_out[9]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \m_axis_tdata[9]_i_2 
       (.I0(\m_axis_tdata[15]_i_5_n_0 ),
        .I1(up_left_pixel[3]),
        .I2(\m_axis_tdata[15]_i_6_n_0 ),
        .I3(up[3]),
        .I4(\left_pixel_reg_n_0_[3] ),
        .I5(\m_axis_tdata[15]_i_7_n_0 ),
        .O(\m_axis_tdata[9]_i_2_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[0] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[0]),
        .Q(m_axis_tdata[0]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[10] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[10]),
        .Q(m_axis_tdata[10]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[11] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[11]),
        .Q(m_axis_tdata[11]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[12] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[12]),
        .Q(m_axis_tdata[12]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[13] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[13]),
        .Q(m_axis_tdata[13]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[14] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[14]),
        .Q(m_axis_tdata[14]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[15] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[15]),
        .Q(m_axis_tdata[15]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[16] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[16]),
        .Q(m_axis_tdata[16]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[17] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[17]),
        .Q(m_axis_tdata[17]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[18] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[18]),
        .Q(m_axis_tdata[18]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[19] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[19]),
        .Q(m_axis_tdata[19]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[1] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[1]),
        .Q(m_axis_tdata[1]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[20] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[20]),
        .Q(m_axis_tdata[20]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[21] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[21]),
        .Q(m_axis_tdata[21]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[22] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[22]),
        .Q(m_axis_tdata[22]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[23] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[23]),
        .Q(m_axis_tdata[23]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[2] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[2]),
        .Q(m_axis_tdata[2]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[3] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[3]),
        .Q(m_axis_tdata[3]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[4] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[4]),
        .Q(m_axis_tdata[4]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[5] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[5]),
        .Q(m_axis_tdata[5]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[6] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[6]),
        .Q(m_axis_tdata[6]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[7] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[7]),
        .Q(m_axis_tdata[7]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[8] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[8]),
        .Q(m_axis_tdata[8]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) 
  FDRE \m_axis_tdata_reg[9] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_3_out[9]),
        .Q(m_axis_tdata[9]),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) 
  FDRE m_axis_tlast_reg
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(s_axis_tlast),
        .Q(m_axis_tlast),
        .R(p_0_in));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER" *) 
  FDRE m_axis_tuser_reg
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(s_axis_tuser),
        .Q(m_axis_tuser),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hF200)) 
    m_axis_tvalid_i_1
       (.I0(m_axis_tvalid_reg_0),
        .I1(m_axis_tready),
        .I2(s_axis_tvalid),
        .I3(aresetn),
        .O(m_axis_tvalid_i_1_n_0));
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) 
  FDRE m_axis_tvalid_reg
       (.C(aclk),
        .CE(1'b1),
        .D(m_axis_tvalid_i_1_n_0),
        .Q(m_axis_tvalid_reg_0),
        .R(1'b0));
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1792" *) 
  (* ram_addr_end = "1919" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM128X1S prev_row_reg_0_127_0_0__1
       (.A0(prev_row_reg_0_255_2_2_i_9_n_0),
        .A1(prev_row_reg_0_255_2_2_i_8_n_0),
        .A2(prev_row_reg_0_255_2_2_i_7_n_0),
        .A3(prev_row_reg_0_255_2_2_i_6_n_0),
        .A4(prev_row_reg_0_255_2_2_i_5_n_0),
        .A5(prev_row_reg_0_255_2_2_i_4_n_0),
        .A6(prev_row_reg_0_255_2_2_i_3_n_0),
        .D(s_axis_tdata[0]),
        .O(prev_row_reg_0_127_0_0__1_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_127_0_0__1_i_1_n_0));
  LUT5 #(
    .INIT(32'h88080000)) 
    prev_row_reg_0_127_0_0__1_i_1
       (.I0(prev_row_reg_0_127_0_0__1_i_2_n_0),
        .I1(aresetn),
        .I2(m_axis_tvalid_reg_0),
        .I3(m_axis_tready),
        .I4(s_axis_tvalid),
        .O(prev_row_reg_0_127_0_0__1_i_1_n_0));
  LUT5 #(
    .INIT(32'h00400000)) 
    prev_row_reg_0_127_0_0__1_i_2
       (.I0(x[7]),
        .I1(x[10]),
        .I2(x[9]),
        .I3(s_axis_tuser),
        .I4(x[8]),
        .O(prev_row_reg_0_127_0_0__1_i_2_n_0));
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1792" *) 
  (* ram_addr_end = "1919" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM128X1S prev_row_reg_0_127_0_0__2
       (.A0(prev_row_reg_0_255_2_2_i_9_n_0),
        .A1(prev_row_reg_0_255_2_2_i_8_n_0),
        .A2(prev_row_reg_0_255_2_2_i_7_n_0),
        .A3(prev_row_reg_0_255_2_2_i_6_n_0),
        .A4(prev_row_reg_0_255_2_2_i_5_n_0),
        .A5(prev_row_reg_0_255_2_2_i_4_n_0),
        .A6(prev_row_reg_0_255_2_2_i_3_n_0),
        .D(s_axis_tdata[1]),
        .O(prev_row_reg_0_127_0_0__2_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_127_0_0__1_i_1_n_0));
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1792" *) 
  (* ram_addr_end = "1919" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
  (* ram_slice_end = "4" *) 
  RAM128X1S prev_row_reg_0_127_0_0__3
       (.A0(prev_row_reg_0_255_2_2_i_9_n_0),
        .A1(prev_row_reg_0_255_2_2_i_8_n_0),
        .A2(prev_row_reg_0_255_2_2_i_7_n_0),
        .A3(prev_row_reg_0_255_2_2_i_6_n_0),
        .A4(prev_row_reg_0_255_2_2_i_5_n_0),
        .A5(prev_row_reg_0_255_2_2_i_4_n_0),
        .A6(prev_row_reg_0_255_2_2_i_3_n_0),
        .D(s_axis_tdata[2]),
        .O(prev_row_reg_0_127_0_0__3_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_127_0_0__1_i_1_n_0));
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1792" *) 
  (* ram_addr_end = "1919" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "5" *) 
  (* ram_slice_end = "5" *) 
  RAM128X1S prev_row_reg_0_127_0_0__4
       (.A0(prev_row_reg_0_255_2_2_i_9_n_0),
        .A1(prev_row_reg_0_255_2_2_i_8_n_0),
        .A2(prev_row_reg_0_255_2_2_i_7_n_0),
        .A3(prev_row_reg_0_255_2_2_i_6_n_0),
        .A4(prev_row_reg_0_255_2_2_i_5_n_0),
        .A5(prev_row_reg_0_255_2_2_i_4_n_0),
        .A6(prev_row_reg_0_255_2_2_i_3_n_0),
        .D(s_axis_tdata[3]),
        .O(prev_row_reg_0_127_0_0__4_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_127_0_0__1_i_1_n_0));
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1792" *) 
  (* ram_addr_end = "1919" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM128X1S prev_row_reg_0_127_0_0__5
       (.A0(prev_row_reg_0_255_2_2_i_9_n_0),
        .A1(prev_row_reg_0_255_2_2_i_8_n_0),
        .A2(prev_row_reg_0_255_2_2_i_7_n_0),
        .A3(prev_row_reg_0_255_2_2_i_6_n_0),
        .A4(prev_row_reg_0_255_2_2_i_5_n_0),
        .A5(prev_row_reg_0_255_2_2_i_4_n_0),
        .A6(prev_row_reg_0_255_2_2_i_3_n_0),
        .D(s_axis_tdata[4]),
        .O(prev_row_reg_0_127_0_0__5_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_127_0_0__1_i_1_n_0));
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1792" *) 
  (* ram_addr_end = "1919" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM128X1S prev_row_reg_0_127_0_0__6
       (.A0(prev_row_reg_0_255_2_2_i_9_n_0),
        .A1(prev_row_reg_0_255_2_2_i_8_n_0),
        .A2(prev_row_reg_0_255_2_2_i_7_n_0),
        .A3(prev_row_reg_0_255_2_2_i_6_n_0),
        .A4(prev_row_reg_0_255_2_2_i_5_n_0),
        .A5(prev_row_reg_0_255_2_2_i_4_n_0),
        .A6(prev_row_reg_0_255_2_2_i_3_n_0),
        .D(s_axis_tdata[5]),
        .O(prev_row_reg_0_127_0_0__6_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_127_0_0__1_i_1_n_0));
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1792" *) 
  (* ram_addr_end = "1919" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "8" *) 
  (* ram_slice_end = "8" *) 
  RAM128X1S prev_row_reg_0_127_0_0__7
       (.A0(prev_row_reg_0_255_2_2_i_9_n_0),
        .A1(prev_row_reg_0_255_2_2_i_8_n_0),
        .A2(prev_row_reg_0_255_2_2_i_7_n_0),
        .A3(prev_row_reg_0_255_2_2_i_6_n_0),
        .A4(prev_row_reg_0_255_2_2_i_5_n_0),
        .A5(prev_row_reg_0_255_2_2_i_4_n_0),
        .A6(prev_row_reg_0_255_2_2_i_3_n_0),
        .D(s_axis_tdata[6]),
        .O(prev_row_reg_0_127_0_0__7_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_127_0_0__1_i_1_n_0));
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1792" *) 
  (* ram_addr_end = "1919" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "9" *) 
  RAM128X1S prev_row_reg_0_127_0_0__8
       (.A0(prev_row_reg_0_255_2_2_i_9_n_0),
        .A1(prev_row_reg_0_255_2_2_i_8_n_0),
        .A2(prev_row_reg_0_255_2_2_i_7_n_0),
        .A3(prev_row_reg_0_255_2_2_i_6_n_0),
        .A4(prev_row_reg_0_255_2_2_i_5_n_0),
        .A5(prev_row_reg_0_255_2_2_i_4_n_0),
        .A6(prev_row_reg_0_255_2_2_i_3_n_0),
        .D(s_axis_tdata[7]),
        .O(prev_row_reg_0_127_0_0__8_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_127_0_0__1_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM256X1S prev_row_reg_0_255_2_2
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[0]),
        .O(prev_row_reg_0_255_2_2_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_255_2_2_i_1_n_0));
  LUT6 #(
    .INIT(64'hCCCD000000000000)) 
    prev_row_reg_0_255_2_2_i_1
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(aresetn),
        .I5(\m_axis_tdata[23]_i_2_n_0 ),
        .O(prev_row_reg_0_255_2_2_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    prev_row_reg_0_255_2_2_i_2
       (.I0(x[7]),
        .I1(s_axis_tuser),
        .O(prev_row_reg_0_255_2_2_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    prev_row_reg_0_255_2_2_i_3
       (.I0(x[6]),
        .I1(s_axis_tuser),
        .O(prev_row_reg_0_255_2_2_i_3_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    prev_row_reg_0_255_2_2_i_4
       (.I0(x[5]),
        .I1(s_axis_tuser),
        .O(prev_row_reg_0_255_2_2_i_4_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    prev_row_reg_0_255_2_2_i_5
       (.I0(x[4]),
        .I1(s_axis_tuser),
        .O(prev_row_reg_0_255_2_2_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    prev_row_reg_0_255_2_2_i_6
       (.I0(x[3]),
        .I1(s_axis_tuser),
        .O(prev_row_reg_0_255_2_2_i_6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    prev_row_reg_0_255_2_2_i_7
       (.I0(x[2]),
        .I1(s_axis_tuser),
        .O(prev_row_reg_0_255_2_2_i_7_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    prev_row_reg_0_255_2_2_i_8
       (.I0(x[1]),
        .I1(s_axis_tuser),
        .O(prev_row_reg_0_255_2_2_i_8_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    prev_row_reg_0_255_2_2_i_9
       (.I0(x[0]),
        .I1(s_axis_tuser),
        .O(prev_row_reg_0_255_2_2_i_9_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM256X1S prev_row_reg_0_255_3_3
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[1]),
        .O(prev_row_reg_0_255_3_3_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_255_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
  (* ram_slice_end = "4" *) 
  RAM256X1S prev_row_reg_0_255_4_4
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[2]),
        .O(prev_row_reg_0_255_4_4_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_255_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "5" *) 
  (* ram_slice_end = "5" *) 
  RAM256X1S prev_row_reg_0_255_5_5
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[3]),
        .O(prev_row_reg_0_255_5_5_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_255_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM256X1S prev_row_reg_0_255_6_6
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[4]),
        .O(prev_row_reg_0_255_6_6_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_255_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM256X1S prev_row_reg_0_255_7_7
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[5]),
        .O(prev_row_reg_0_255_7_7_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_255_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "8" *) 
  (* ram_slice_end = "8" *) 
  RAM256X1S prev_row_reg_0_255_8_8
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[6]),
        .O(prev_row_reg_0_255_8_8_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_255_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "9" *) 
  RAM256X1S prev_row_reg_0_255_9_9
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[7]),
        .O(prev_row_reg_0_255_9_9_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_0_255_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1279" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM256X1S prev_row_reg_1024_1279_2_2
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[0]),
        .O(prev_row_reg_1024_1279_2_2_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1024_1279_2_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    prev_row_reg_1024_1279_2_2_i_1
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(aresetn),
        .I5(\m_axis_tdata[23]_i_2_n_0 ),
        .O(prev_row_reg_1024_1279_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1279" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM256X1S prev_row_reg_1024_1279_3_3
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[1]),
        .O(prev_row_reg_1024_1279_3_3_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1024_1279_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1279" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
  (* ram_slice_end = "4" *) 
  RAM256X1S prev_row_reg_1024_1279_4_4
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[2]),
        .O(prev_row_reg_1024_1279_4_4_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1024_1279_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1279" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "5" *) 
  (* ram_slice_end = "5" *) 
  RAM256X1S prev_row_reg_1024_1279_5_5
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[3]),
        .O(prev_row_reg_1024_1279_5_5_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1024_1279_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1279" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM256X1S prev_row_reg_1024_1279_6_6
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[4]),
        .O(prev_row_reg_1024_1279_6_6_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1024_1279_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1279" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM256X1S prev_row_reg_1024_1279_7_7
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[5]),
        .O(prev_row_reg_1024_1279_7_7_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1024_1279_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1279" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "8" *) 
  (* ram_slice_end = "8" *) 
  RAM256X1S prev_row_reg_1024_1279_8_8
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[6]),
        .O(prev_row_reg_1024_1279_8_8_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1024_1279_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "1279" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "9" *) 
  RAM256X1S prev_row_reg_1024_1279_9_9
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[7]),
        .O(prev_row_reg_1024_1279_9_9_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1024_1279_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1280" *) 
  (* ram_addr_end = "1535" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM256X1S prev_row_reg_1280_1535_2_2
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[0]),
        .O(prev_row_reg_1280_1535_2_2_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1280_1535_2_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    prev_row_reg_1280_1535_2_2_i_1
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(aresetn),
        .I5(\m_axis_tdata[23]_i_2_n_0 ),
        .O(prev_row_reg_1280_1535_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1280" *) 
  (* ram_addr_end = "1535" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM256X1S prev_row_reg_1280_1535_3_3
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[1]),
        .O(prev_row_reg_1280_1535_3_3_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1280_1535_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1280" *) 
  (* ram_addr_end = "1535" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
  (* ram_slice_end = "4" *) 
  RAM256X1S prev_row_reg_1280_1535_4_4
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[2]),
        .O(prev_row_reg_1280_1535_4_4_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1280_1535_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1280" *) 
  (* ram_addr_end = "1535" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "5" *) 
  (* ram_slice_end = "5" *) 
  RAM256X1S prev_row_reg_1280_1535_5_5
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[3]),
        .O(prev_row_reg_1280_1535_5_5_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1280_1535_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1280" *) 
  (* ram_addr_end = "1535" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM256X1S prev_row_reg_1280_1535_6_6
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[4]),
        .O(prev_row_reg_1280_1535_6_6_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1280_1535_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1280" *) 
  (* ram_addr_end = "1535" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM256X1S prev_row_reg_1280_1535_7_7
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[5]),
        .O(prev_row_reg_1280_1535_7_7_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1280_1535_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1280" *) 
  (* ram_addr_end = "1535" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "8" *) 
  (* ram_slice_end = "8" *) 
  RAM256X1S prev_row_reg_1280_1535_8_8
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[6]),
        .O(prev_row_reg_1280_1535_8_8_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1280_1535_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1280" *) 
  (* ram_addr_end = "1535" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "9" *) 
  RAM256X1S prev_row_reg_1280_1535_9_9
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[7]),
        .O(prev_row_reg_1280_1535_9_9_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1280_1535_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1536" *) 
  (* ram_addr_end = "1791" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM256X1S prev_row_reg_1536_1791_2_2
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[0]),
        .O(prev_row_reg_1536_1791_2_2_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1536_1791_2_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    prev_row_reg_1536_1791_2_2_i_1
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(aresetn),
        .I5(\m_axis_tdata[23]_i_2_n_0 ),
        .O(prev_row_reg_1536_1791_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1536" *) 
  (* ram_addr_end = "1791" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM256X1S prev_row_reg_1536_1791_3_3
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[1]),
        .O(prev_row_reg_1536_1791_3_3_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1536_1791_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1536" *) 
  (* ram_addr_end = "1791" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
  (* ram_slice_end = "4" *) 
  RAM256X1S prev_row_reg_1536_1791_4_4
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[2]),
        .O(prev_row_reg_1536_1791_4_4_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1536_1791_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1536" *) 
  (* ram_addr_end = "1791" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "5" *) 
  (* ram_slice_end = "5" *) 
  RAM256X1S prev_row_reg_1536_1791_5_5
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[3]),
        .O(prev_row_reg_1536_1791_5_5_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1536_1791_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1536" *) 
  (* ram_addr_end = "1791" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM256X1S prev_row_reg_1536_1791_6_6
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[4]),
        .O(prev_row_reg_1536_1791_6_6_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1536_1791_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1536" *) 
  (* ram_addr_end = "1791" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM256X1S prev_row_reg_1536_1791_7_7
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[5]),
        .O(prev_row_reg_1536_1791_7_7_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1536_1791_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1536" *) 
  (* ram_addr_end = "1791" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "8" *) 
  (* ram_slice_end = "8" *) 
  RAM256X1S prev_row_reg_1536_1791_8_8
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[6]),
        .O(prev_row_reg_1536_1791_8_8_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1536_1791_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "1536" *) 
  (* ram_addr_end = "1791" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "9" *) 
  RAM256X1S prev_row_reg_1536_1791_9_9
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[7]),
        .O(prev_row_reg_1536_1791_9_9_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_1536_1791_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM256X1S prev_row_reg_256_511_2_2
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[0]),
        .O(prev_row_reg_256_511_2_2_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_256_511_2_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    prev_row_reg_256_511_2_2_i_1
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(aresetn),
        .I5(\m_axis_tdata[23]_i_2_n_0 ),
        .O(prev_row_reg_256_511_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM256X1S prev_row_reg_256_511_3_3
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[1]),
        .O(prev_row_reg_256_511_3_3_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_256_511_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
  (* ram_slice_end = "4" *) 
  RAM256X1S prev_row_reg_256_511_4_4
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[2]),
        .O(prev_row_reg_256_511_4_4_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_256_511_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "5" *) 
  (* ram_slice_end = "5" *) 
  RAM256X1S prev_row_reg_256_511_5_5
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[3]),
        .O(prev_row_reg_256_511_5_5_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_256_511_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM256X1S prev_row_reg_256_511_6_6
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[4]),
        .O(prev_row_reg_256_511_6_6_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_256_511_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM256X1S prev_row_reg_256_511_7_7
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[5]),
        .O(prev_row_reg_256_511_7_7_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_256_511_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "8" *) 
  (* ram_slice_end = "8" *) 
  RAM256X1S prev_row_reg_256_511_8_8
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[6]),
        .O(prev_row_reg_256_511_8_8_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_256_511_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "256" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "9" *) 
  RAM256X1S prev_row_reg_256_511_9_9
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[7]),
        .O(prev_row_reg_256_511_9_9_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_256_511_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM256X1S prev_row_reg_512_767_2_2
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[0]),
        .O(prev_row_reg_512_767_2_2_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_512_767_2_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    prev_row_reg_512_767_2_2_i_1
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(aresetn),
        .I5(\m_axis_tdata[23]_i_2_n_0 ),
        .O(prev_row_reg_512_767_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM256X1S prev_row_reg_512_767_3_3
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[1]),
        .O(prev_row_reg_512_767_3_3_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_512_767_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
  (* ram_slice_end = "4" *) 
  RAM256X1S prev_row_reg_512_767_4_4
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[2]),
        .O(prev_row_reg_512_767_4_4_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_512_767_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "5" *) 
  (* ram_slice_end = "5" *) 
  RAM256X1S prev_row_reg_512_767_5_5
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[3]),
        .O(prev_row_reg_512_767_5_5_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_512_767_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM256X1S prev_row_reg_512_767_6_6
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[4]),
        .O(prev_row_reg_512_767_6_6_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_512_767_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM256X1S prev_row_reg_512_767_7_7
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[5]),
        .O(prev_row_reg_512_767_7_7_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_512_767_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "8" *) 
  (* ram_slice_end = "8" *) 
  RAM256X1S prev_row_reg_512_767_8_8
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[6]),
        .O(prev_row_reg_512_767_8_8_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_512_767_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "512" *) 
  (* ram_addr_end = "767" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "9" *) 
  RAM256X1S prev_row_reg_512_767_9_9
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[7]),
        .O(prev_row_reg_512_767_9_9_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_512_767_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM256X1S prev_row_reg_768_1023_2_2
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[0]),
        .O(prev_row_reg_768_1023_2_2_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_768_1023_2_2_i_1_n_0));
  LUT6 #(
    .INIT(64'h1000000000000000)) 
    prev_row_reg_768_1023_2_2_i_1
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(aresetn),
        .I5(\m_axis_tdata[23]_i_2_n_0 ),
        .O(prev_row_reg_768_1023_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM256X1S prev_row_reg_768_1023_3_3
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[1]),
        .O(prev_row_reg_768_1023_3_3_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_768_1023_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
  (* ram_slice_end = "4" *) 
  RAM256X1S prev_row_reg_768_1023_4_4
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[2]),
        .O(prev_row_reg_768_1023_4_4_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_768_1023_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "5" *) 
  (* ram_slice_end = "5" *) 
  RAM256X1S prev_row_reg_768_1023_5_5
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[3]),
        .O(prev_row_reg_768_1023_5_5_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_768_1023_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM256X1S prev_row_reg_768_1023_6_6
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[4]),
        .O(prev_row_reg_768_1023_6_6_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_768_1023_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM256X1S prev_row_reg_768_1023_7_7
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[5]),
        .O(prev_row_reg_768_1023_7_7_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_768_1023_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "8" *) 
  (* ram_slice_end = "8" *) 
  RAM256X1S prev_row_reg_768_1023_8_8
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[6]),
        .O(prev_row_reg_768_1023_8_8_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_768_1023_2_2_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-5 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "19200" *) 
  (* RTL_RAM_NAME = "design_1_axis_raw_to_gbr_0_13/inst/prev_row_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "768" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "9" *) 
  RAM256X1S prev_row_reg_768_1023_9_9
       (.A({prev_row_reg_0_255_2_2_i_2_n_0,prev_row_reg_0_255_2_2_i_3_n_0,prev_row_reg_0_255_2_2_i_4_n_0,prev_row_reg_0_255_2_2_i_5_n_0,prev_row_reg_0_255_2_2_i_6_n_0,prev_row_reg_0_255_2_2_i_7_n_0,prev_row_reg_0_255_2_2_i_8_n_0,prev_row_reg_0_255_2_2_i_9_n_0}),
        .D(s_axis_tdata[7]),
        .O(prev_row_reg_768_1023_9_9_n_0),
        .WCLK(aclk),
        .WE(prev_row_reg_768_1023_2_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hB)) 
    s_axis_tready_INST_0
       (.I0(m_axis_tready),
        .I1(m_axis_tvalid_reg_0),
        .O(s_axis_tready));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \up_left_pixel[2]_i_1 
       (.I0(\up_left_pixel[2]_i_2_n_0 ),
        .I1(\up_left_pixel[2]_i_3_n_0 ),
        .I2(\up_left_pixel[2]_i_4_n_0 ),
        .I3(\up_left_pixel[2]_i_5_n_0 ),
        .I4(\up_left_pixel[2]_i_6_n_0 ),
        .I5(\up_left_pixel[2]_i_7_n_0 ),
        .O(up[2]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[2]_i_2 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_1536_1791_2_2_n_0),
        .O(\up_left_pixel[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \up_left_pixel[2]_i_3 
       (.I0(x[8]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[10]),
        .I4(x[7]),
        .I5(prev_row_reg_0_127_0_0__1_n_0),
        .O(\up_left_pixel[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC0000CCCC0A0C)) 
    \up_left_pixel[2]_i_4 
       (.I0(prev_row_reg_256_511_2_2_n_0),
        .I1(prev_row_reg_0_255_2_2_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \up_left_pixel[2]_i_5 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_512_767_2_2_n_0),
        .O(\up_left_pixel[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \up_left_pixel[2]_i_6 
       (.I0(prev_row_reg_1024_1279_2_2_n_0),
        .I1(prev_row_reg_768_1023_2_2_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[2]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[2]_i_7 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(prev_row_reg_1280_1535_2_2_n_0),
        .O(\up_left_pixel[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \up_left_pixel[3]_i_1 
       (.I0(\up_left_pixel[3]_i_2_n_0 ),
        .I1(\up_left_pixel[3]_i_3_n_0 ),
        .I2(\up_left_pixel[3]_i_4_n_0 ),
        .I3(\up_left_pixel[3]_i_5_n_0 ),
        .I4(\up_left_pixel[3]_i_6_n_0 ),
        .I5(\up_left_pixel[3]_i_7_n_0 ),
        .O(up[3]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[3]_i_2 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_1536_1791_3_3_n_0),
        .O(\up_left_pixel[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \up_left_pixel[3]_i_3 
       (.I0(x[8]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[10]),
        .I4(x[7]),
        .I5(prev_row_reg_0_127_0_0__2_n_0),
        .O(\up_left_pixel[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC0000CCCC0A0C)) 
    \up_left_pixel[3]_i_4 
       (.I0(prev_row_reg_256_511_3_3_n_0),
        .I1(prev_row_reg_0_255_3_3_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \up_left_pixel[3]_i_5 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_512_767_3_3_n_0),
        .O(\up_left_pixel[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \up_left_pixel[3]_i_6 
       (.I0(prev_row_reg_1024_1279_3_3_n_0),
        .I1(prev_row_reg_768_1023_3_3_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[3]_i_7 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(prev_row_reg_1280_1535_3_3_n_0),
        .O(\up_left_pixel[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \up_left_pixel[4]_i_1 
       (.I0(\up_left_pixel[4]_i_2_n_0 ),
        .I1(\up_left_pixel[4]_i_3_n_0 ),
        .I2(\up_left_pixel[4]_i_4_n_0 ),
        .I3(\up_left_pixel[4]_i_5_n_0 ),
        .I4(\up_left_pixel[4]_i_6_n_0 ),
        .I5(\up_left_pixel[4]_i_7_n_0 ),
        .O(up[4]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[4]_i_2 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_1536_1791_4_4_n_0),
        .O(\up_left_pixel[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \up_left_pixel[4]_i_3 
       (.I0(x[8]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[10]),
        .I4(x[7]),
        .I5(prev_row_reg_0_127_0_0__3_n_0),
        .O(\up_left_pixel[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC0000CCCC0A0C)) 
    \up_left_pixel[4]_i_4 
       (.I0(prev_row_reg_256_511_4_4_n_0),
        .I1(prev_row_reg_0_255_4_4_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[4]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \up_left_pixel[4]_i_5 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_512_767_4_4_n_0),
        .O(\up_left_pixel[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \up_left_pixel[4]_i_6 
       (.I0(prev_row_reg_1024_1279_4_4_n_0),
        .I1(prev_row_reg_768_1023_4_4_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[4]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[4]_i_7 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(prev_row_reg_1280_1535_4_4_n_0),
        .O(\up_left_pixel[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \up_left_pixel[5]_i_1 
       (.I0(\up_left_pixel[5]_i_2_n_0 ),
        .I1(\up_left_pixel[5]_i_3_n_0 ),
        .I2(\up_left_pixel[5]_i_4_n_0 ),
        .I3(\up_left_pixel[5]_i_5_n_0 ),
        .I4(\up_left_pixel[5]_i_6_n_0 ),
        .I5(\up_left_pixel[5]_i_7_n_0 ),
        .O(up[5]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[5]_i_2 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_1536_1791_5_5_n_0),
        .O(\up_left_pixel[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \up_left_pixel[5]_i_3 
       (.I0(x[8]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[10]),
        .I4(x[7]),
        .I5(prev_row_reg_0_127_0_0__4_n_0),
        .O(\up_left_pixel[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC0000CCCC0A0C)) 
    \up_left_pixel[5]_i_4 
       (.I0(prev_row_reg_256_511_5_5_n_0),
        .I1(prev_row_reg_0_255_5_5_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[5]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \up_left_pixel[5]_i_5 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_512_767_5_5_n_0),
        .O(\up_left_pixel[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \up_left_pixel[5]_i_6 
       (.I0(prev_row_reg_1024_1279_5_5_n_0),
        .I1(prev_row_reg_768_1023_5_5_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[5]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[5]_i_7 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(prev_row_reg_1280_1535_5_5_n_0),
        .O(\up_left_pixel[5]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \up_left_pixel[6]_i_1 
       (.I0(\up_left_pixel[6]_i_2_n_0 ),
        .I1(\up_left_pixel[6]_i_3_n_0 ),
        .I2(\up_left_pixel[6]_i_4_n_0 ),
        .I3(\up_left_pixel[6]_i_5_n_0 ),
        .I4(\up_left_pixel[6]_i_6_n_0 ),
        .I5(\up_left_pixel[6]_i_7_n_0 ),
        .O(up[6]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[6]_i_2 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_1536_1791_6_6_n_0),
        .O(\up_left_pixel[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \up_left_pixel[6]_i_3 
       (.I0(x[8]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[10]),
        .I4(x[7]),
        .I5(prev_row_reg_0_127_0_0__5_n_0),
        .O(\up_left_pixel[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC0000CCCC0A0C)) 
    \up_left_pixel[6]_i_4 
       (.I0(prev_row_reg_256_511_6_6_n_0),
        .I1(prev_row_reg_0_255_6_6_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[6]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \up_left_pixel[6]_i_5 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_512_767_6_6_n_0),
        .O(\up_left_pixel[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \up_left_pixel[6]_i_6 
       (.I0(prev_row_reg_1024_1279_6_6_n_0),
        .I1(prev_row_reg_768_1023_6_6_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[6]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[6]_i_7 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(prev_row_reg_1280_1535_6_6_n_0),
        .O(\up_left_pixel[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \up_left_pixel[7]_i_1 
       (.I0(\up_left_pixel[7]_i_2_n_0 ),
        .I1(\up_left_pixel[7]_i_3_n_0 ),
        .I2(\up_left_pixel[7]_i_4_n_0 ),
        .I3(\up_left_pixel[7]_i_5_n_0 ),
        .I4(\up_left_pixel[7]_i_6_n_0 ),
        .I5(\up_left_pixel[7]_i_7_n_0 ),
        .O(up[7]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[7]_i_2 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_1536_1791_7_7_n_0),
        .O(\up_left_pixel[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \up_left_pixel[7]_i_3 
       (.I0(x[8]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[10]),
        .I4(x[7]),
        .I5(prev_row_reg_0_127_0_0__6_n_0),
        .O(\up_left_pixel[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC0000CCCC0A0C)) 
    \up_left_pixel[7]_i_4 
       (.I0(prev_row_reg_256_511_7_7_n_0),
        .I1(prev_row_reg_0_255_7_7_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[7]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \up_left_pixel[7]_i_5 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_512_767_7_7_n_0),
        .O(\up_left_pixel[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \up_left_pixel[7]_i_6 
       (.I0(prev_row_reg_1024_1279_7_7_n_0),
        .I1(prev_row_reg_768_1023_7_7_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[7]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[7]_i_7 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(prev_row_reg_1280_1535_7_7_n_0),
        .O(\up_left_pixel[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \up_left_pixel[8]_i_1 
       (.I0(\up_left_pixel[8]_i_2_n_0 ),
        .I1(\up_left_pixel[8]_i_3_n_0 ),
        .I2(\up_left_pixel[8]_i_4_n_0 ),
        .I3(\up_left_pixel[8]_i_5_n_0 ),
        .I4(\up_left_pixel[8]_i_6_n_0 ),
        .I5(\up_left_pixel[8]_i_7_n_0 ),
        .O(up[8]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[8]_i_2 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_1536_1791_8_8_n_0),
        .O(\up_left_pixel[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \up_left_pixel[8]_i_3 
       (.I0(x[8]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[10]),
        .I4(x[7]),
        .I5(prev_row_reg_0_127_0_0__7_n_0),
        .O(\up_left_pixel[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC0000CCCC0A0C)) 
    \up_left_pixel[8]_i_4 
       (.I0(prev_row_reg_256_511_8_8_n_0),
        .I1(prev_row_reg_0_255_8_8_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[8]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \up_left_pixel[8]_i_5 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_512_767_8_8_n_0),
        .O(\up_left_pixel[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \up_left_pixel[8]_i_6 
       (.I0(prev_row_reg_1024_1279_8_8_n_0),
        .I1(prev_row_reg_768_1023_8_8_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[8]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[8]_i_7 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(prev_row_reg_1280_1535_8_8_n_0),
        .O(\up_left_pixel[8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \up_left_pixel[9]_i_1 
       (.I0(\up_left_pixel[9]_i_2_n_0 ),
        .I1(\up_left_pixel[9]_i_3_n_0 ),
        .I2(\up_left_pixel[9]_i_4_n_0 ),
        .I3(\up_left_pixel[9]_i_5_n_0 ),
        .I4(\up_left_pixel[9]_i_6_n_0 ),
        .I5(\up_left_pixel[9]_i_7_n_0 ),
        .O(up[9]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[9]_i_2 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_1536_1791_9_9_n_0),
        .O(\up_left_pixel[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    \up_left_pixel[9]_i_3 
       (.I0(x[8]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[10]),
        .I4(x[7]),
        .I5(prev_row_reg_0_127_0_0__8_n_0),
        .O(\up_left_pixel[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC0000CCCC0A0C)) 
    \up_left_pixel[9]_i_4 
       (.I0(prev_row_reg_256_511_9_9_n_0),
        .I1(prev_row_reg_0_255_9_9_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[9]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \up_left_pixel[9]_i_5 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[9]),
        .I3(x[8]),
        .I4(prev_row_reg_512_767_9_9_n_0),
        .O(\up_left_pixel[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000A0000C000)) 
    \up_left_pixel[9]_i_6 
       (.I0(prev_row_reg_1024_1279_9_9_n_0),
        .I1(prev_row_reg_768_1023_9_9_n_0),
        .I2(x[9]),
        .I3(x[8]),
        .I4(s_axis_tuser),
        .I5(x[10]),
        .O(\up_left_pixel[9]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \up_left_pixel[9]_i_7 
       (.I0(x[10]),
        .I1(s_axis_tuser),
        .I2(x[8]),
        .I3(x[9]),
        .I4(prev_row_reg_1280_1535_9_9_n_0),
        .O(\up_left_pixel[9]_i_7_n_0 ));
  FDRE \up_left_pixel_reg[2] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(up[2]),
        .Q(up_left_pixel[2]),
        .R(p_0_in));
  FDRE \up_left_pixel_reg[3] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(up[3]),
        .Q(up_left_pixel[3]),
        .R(p_0_in));
  FDRE \up_left_pixel_reg[4] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(up[4]),
        .Q(up_left_pixel[4]),
        .R(p_0_in));
  FDRE \up_left_pixel_reg[5] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(up[5]),
        .Q(up_left_pixel[5]),
        .R(p_0_in));
  FDRE \up_left_pixel_reg[6] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(up[6]),
        .Q(up_left_pixel[6]),
        .R(p_0_in));
  FDRE \up_left_pixel_reg[7] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(up[7]),
        .Q(up_left_pixel[7]),
        .R(p_0_in));
  FDRE \up_left_pixel_reg[8] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(up[8]),
        .Q(up_left_pixel[8]),
        .R(p_0_in));
  FDRE \up_left_pixel_reg[9] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(up[9]),
        .Q(up_left_pixel[9]),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \x[0]_i_1 
       (.I0(s_axis_tuser),
        .I1(x[0]),
        .O(site_color3));
  LUT5 #(
    .INIT(32'hA200FFFF)) 
    \x[10]_i_1 
       (.I0(s_axis_tlast),
        .I1(m_axis_tvalid_reg_0),
        .I2(m_axis_tready),
        .I3(s_axis_tvalid),
        .I4(aresetn),
        .O(\x[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00C600CC)) 
    \x[10]_i_2 
       (.I0(x[9]),
        .I1(x[10]),
        .I2(\x[10]_i_3_n_0 ),
        .I3(s_axis_tuser),
        .I4(x[0]),
        .O(p_2_in[10]));
  LUT3 #(
    .INIT(8'hDF)) 
    \x[10]_i_3 
       (.I0(x[7]),
        .I1(\x[9]_i_2_n_0 ),
        .I2(x[8]),
        .O(\x[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \x[1]_i_1 
       (.I0(x[1]),
        .I1(x[0]),
        .I2(s_axis_tuser),
        .O(p_2_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h006C)) 
    \x[2]_i_1 
       (.I0(x[1]),
        .I1(x[2]),
        .I2(x[0]),
        .I3(s_axis_tuser),
        .O(p_2_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h000078F0)) 
    \x[3]_i_1 
       (.I0(x[2]),
        .I1(x[1]),
        .I2(x[3]),
        .I3(x[0]),
        .I4(s_axis_tuser),
        .O(p_2_in[3]));
  LUT6 #(
    .INIT(64'h000000007F80FF00)) 
    \x[4]_i_1 
       (.I0(x[3]),
        .I1(x[1]),
        .I2(x[2]),
        .I3(x[4]),
        .I4(x[0]),
        .I5(s_axis_tuser),
        .O(p_2_in[4]));
  LUT4 #(
    .INIT(16'h009C)) 
    \x[5]_i_1 
       (.I0(\x[5]_i_2_n_0 ),
        .I1(x[5]),
        .I2(x[0]),
        .I3(s_axis_tuser),
        .O(p_2_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \x[5]_i_2 
       (.I0(x[3]),
        .I1(x[1]),
        .I2(x[2]),
        .I3(x[4]),
        .O(\x[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h009C)) 
    \x[6]_i_1 
       (.I0(\x[6]_i_2_n_0 ),
        .I1(x[6]),
        .I2(x[0]),
        .I3(s_axis_tuser),
        .O(p_2_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \x[6]_i_2 
       (.I0(x[4]),
        .I1(x[2]),
        .I2(x[1]),
        .I3(x[3]),
        .I4(x[5]),
        .O(\x[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h009C)) 
    \x[7]_i_1 
       (.I0(\x[9]_i_2_n_0 ),
        .I1(x[7]),
        .I2(x[0]),
        .I3(s_axis_tuser),
        .O(p_2_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0000D2F0)) 
    \x[8]_i_1 
       (.I0(x[7]),
        .I1(\x[9]_i_2_n_0 ),
        .I2(x[8]),
        .I3(x[0]),
        .I4(s_axis_tuser),
        .O(p_2_in[8]));
  LUT6 #(
    .INIT(64'h0000DFFF00002000)) 
    \x[9]_i_1 
       (.I0(x[7]),
        .I1(\x[9]_i_2_n_0 ),
        .I2(x[8]),
        .I3(x[0]),
        .I4(s_axis_tuser),
        .I5(x[9]),
        .O(p_2_in[9]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \x[9]_i_2 
       (.I0(x[5]),
        .I1(x[3]),
        .I2(x[1]),
        .I3(x[2]),
        .I4(x[4]),
        .I5(x[6]),
        .O(\x[9]_i_2_n_0 ));
  FDRE \x_reg[0] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(site_color3),
        .Q(x[0]),
        .R(\x[10]_i_1_n_0 ));
  FDRE \x_reg[10] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_2_in[10]),
        .Q(x[10]),
        .R(\x[10]_i_1_n_0 ));
  FDRE \x_reg[1] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_2_in[1]),
        .Q(x[1]),
        .R(\x[10]_i_1_n_0 ));
  FDRE \x_reg[2] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_2_in[2]),
        .Q(x[2]),
        .R(\x[10]_i_1_n_0 ));
  FDRE \x_reg[3] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_2_in[3]),
        .Q(x[3]),
        .R(\x[10]_i_1_n_0 ));
  FDRE \x_reg[4] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_2_in[4]),
        .Q(x[4]),
        .R(\x[10]_i_1_n_0 ));
  FDRE \x_reg[5] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_2_in[5]),
        .Q(x[5]),
        .R(\x[10]_i_1_n_0 ));
  FDRE \x_reg[6] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_2_in[6]),
        .Q(x[6]),
        .R(\x[10]_i_1_n_0 ));
  FDRE \x_reg[7] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_2_in[7]),
        .Q(x[7]),
        .R(\x[10]_i_1_n_0 ));
  FDRE \x_reg[8] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_2_in[8]),
        .Q(x[8]),
        .R(\x[10]_i_1_n_0 ));
  FDRE \x_reg[9] 
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(p_2_in[9]),
        .Q(x[9]),
        .R(\x[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    y_odd_i_1
       (.I0(s_axis_tuser),
        .I1(y_odd),
        .I2(s_axis_tlast),
        .O(y_odd_i_1_n_0));
  FDRE y_odd_reg
       (.C(aclk),
        .CE(\m_axis_tdata[23]_i_2_n_0 ),
        .D(y_odd_i_1_n_0),
        .Q(y_odd),
        .R(p_0_in));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
