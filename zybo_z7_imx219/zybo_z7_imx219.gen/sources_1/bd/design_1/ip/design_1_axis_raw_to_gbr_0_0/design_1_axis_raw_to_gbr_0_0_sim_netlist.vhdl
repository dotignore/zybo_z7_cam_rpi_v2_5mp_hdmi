-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Sep 21 19:17:56 2026
-- Host        : DESKTOP-6M954OF running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/github/zybo_z7_cam_rpi_v2_5mp_hdmi/zybo_z7_imx219/zybo_z7_imx219.gen/sources_1/bd/design_1/ip/design_1_axis_raw_to_gbr_0_0/design_1_axis_raw_to_gbr_0_0_sim_netlist.vhdl
-- Design      : design_1_axis_raw_to_gbr_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axis_raw_to_gbr_0_0_axis_raw_to_gbr is
  port (
    m_axis_tvalid_reg_0 : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_tuser : out STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tuser : in STD_LOGIC;
    aclk : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    aresetn : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tlast : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_axis_raw_to_gbr_0_0_axis_raw_to_gbr : entity is "axis_raw_to_gbr";
end design_1_axis_raw_to_gbr_0_0_axis_raw_to_gbr;

architecture STRUCTURE of design_1_axis_raw_to_gbr_0_0_axis_raw_to_gbr is
  signal col : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal have_prev_row_i_1_n_0 : STD_LOGIC;
  signal have_prev_row_reg_n_0 : STD_LOGIC;
  signal left_pixel : STD_LOGIC_VECTOR ( 9 downto 2 );
  signal \m_axis_tdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[10]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[11]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[11]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[12]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[13]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[13]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[14]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[15]_i_10_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[15]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[15]_i_4_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[15]_i_5_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[15]_i_6_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[15]_i_7_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[15]_i_8_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[15]_i_9_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[16]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[17]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[17]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[18]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[18]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[19]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[20]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[20]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[21]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[21]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[22]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[22]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[23]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[23]_i_4_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[23]_i_5_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[23]_i_6_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[23]_i_7_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[7]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[7]_i_4_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[8]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[8]_i_3_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[9]_i_2_n_0\ : STD_LOGIC;
  signal \m_axis_tdata[9]_i_3_n_0\ : STD_LOGIC;
  signal m_axis_tvalid_i_1_n_0 : STD_LOGIC;
  signal \^m_axis_tvalid_reg_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_out : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal p_2_in : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \prev_row_reg_0_127_0_0__1_i_1_n_0\ : STD_LOGIC;
  signal \prev_row_reg_0_127_0_0__1_i_2_n_0\ : STD_LOGIC;
  signal \prev_row_reg_0_127_0_0__1_n_0\ : STD_LOGIC;
  signal \prev_row_reg_0_127_0_0__2_n_0\ : STD_LOGIC;
  signal \prev_row_reg_0_127_0_0__3_n_0\ : STD_LOGIC;
  signal \prev_row_reg_0_127_0_0__4_n_0\ : STD_LOGIC;
  signal \prev_row_reg_0_127_0_0__5_n_0\ : STD_LOGIC;
  signal \prev_row_reg_0_127_0_0__6_n_0\ : STD_LOGIC;
  signal \prev_row_reg_0_127_0_0__7_n_0\ : STD_LOGIC;
  signal \prev_row_reg_0_127_0_0__8_n_0\ : STD_LOGIC;
  signal prev_row_reg_0_255_2_2_i_1_n_0 : STD_LOGIC;
  signal prev_row_reg_0_255_2_2_n_0 : STD_LOGIC;
  signal prev_row_reg_0_255_3_3_n_0 : STD_LOGIC;
  signal prev_row_reg_0_255_4_4_n_0 : STD_LOGIC;
  signal prev_row_reg_0_255_5_5_n_0 : STD_LOGIC;
  signal prev_row_reg_0_255_6_6_n_0 : STD_LOGIC;
  signal prev_row_reg_0_255_7_7_n_0 : STD_LOGIC;
  signal prev_row_reg_0_255_8_8_n_0 : STD_LOGIC;
  signal prev_row_reg_0_255_9_9_n_0 : STD_LOGIC;
  signal prev_row_reg_1024_1279_2_2_i_1_n_0 : STD_LOGIC;
  signal prev_row_reg_1024_1279_2_2_n_0 : STD_LOGIC;
  signal prev_row_reg_1024_1279_3_3_n_0 : STD_LOGIC;
  signal prev_row_reg_1024_1279_4_4_n_0 : STD_LOGIC;
  signal prev_row_reg_1024_1279_5_5_n_0 : STD_LOGIC;
  signal prev_row_reg_1024_1279_6_6_n_0 : STD_LOGIC;
  signal prev_row_reg_1024_1279_7_7_n_0 : STD_LOGIC;
  signal prev_row_reg_1024_1279_8_8_n_0 : STD_LOGIC;
  signal prev_row_reg_1024_1279_9_9_n_0 : STD_LOGIC;
  signal prev_row_reg_1280_1535_2_2_i_1_n_0 : STD_LOGIC;
  signal prev_row_reg_1280_1535_2_2_n_0 : STD_LOGIC;
  signal prev_row_reg_1280_1535_3_3_n_0 : STD_LOGIC;
  signal prev_row_reg_1280_1535_4_4_n_0 : STD_LOGIC;
  signal prev_row_reg_1280_1535_5_5_n_0 : STD_LOGIC;
  signal prev_row_reg_1280_1535_6_6_n_0 : STD_LOGIC;
  signal prev_row_reg_1280_1535_7_7_n_0 : STD_LOGIC;
  signal prev_row_reg_1280_1535_8_8_n_0 : STD_LOGIC;
  signal prev_row_reg_1280_1535_9_9_n_0 : STD_LOGIC;
  signal prev_row_reg_1536_1791_2_2_i_1_n_0 : STD_LOGIC;
  signal prev_row_reg_1536_1791_2_2_n_0 : STD_LOGIC;
  signal prev_row_reg_1536_1791_3_3_n_0 : STD_LOGIC;
  signal prev_row_reg_1536_1791_4_4_n_0 : STD_LOGIC;
  signal prev_row_reg_1536_1791_5_5_n_0 : STD_LOGIC;
  signal prev_row_reg_1536_1791_6_6_n_0 : STD_LOGIC;
  signal prev_row_reg_1536_1791_7_7_n_0 : STD_LOGIC;
  signal prev_row_reg_1536_1791_8_8_n_0 : STD_LOGIC;
  signal prev_row_reg_1536_1791_9_9_n_0 : STD_LOGIC;
  signal prev_row_reg_256_511_2_2_i_1_n_0 : STD_LOGIC;
  signal prev_row_reg_256_511_2_2_n_0 : STD_LOGIC;
  signal prev_row_reg_256_511_3_3_n_0 : STD_LOGIC;
  signal prev_row_reg_256_511_4_4_n_0 : STD_LOGIC;
  signal prev_row_reg_256_511_5_5_n_0 : STD_LOGIC;
  signal prev_row_reg_256_511_6_6_n_0 : STD_LOGIC;
  signal prev_row_reg_256_511_7_7_n_0 : STD_LOGIC;
  signal prev_row_reg_256_511_8_8_n_0 : STD_LOGIC;
  signal prev_row_reg_256_511_9_9_n_0 : STD_LOGIC;
  signal prev_row_reg_512_767_2_2_i_1_n_0 : STD_LOGIC;
  signal prev_row_reg_512_767_2_2_n_0 : STD_LOGIC;
  signal prev_row_reg_512_767_3_3_n_0 : STD_LOGIC;
  signal prev_row_reg_512_767_4_4_n_0 : STD_LOGIC;
  signal prev_row_reg_512_767_5_5_n_0 : STD_LOGIC;
  signal prev_row_reg_512_767_6_6_n_0 : STD_LOGIC;
  signal prev_row_reg_512_767_7_7_n_0 : STD_LOGIC;
  signal prev_row_reg_512_767_8_8_n_0 : STD_LOGIC;
  signal prev_row_reg_512_767_9_9_n_0 : STD_LOGIC;
  signal prev_row_reg_768_1023_2_2_i_1_n_0 : STD_LOGIC;
  signal prev_row_reg_768_1023_2_2_n_0 : STD_LOGIC;
  signal prev_row_reg_768_1023_3_3_n_0 : STD_LOGIC;
  signal prev_row_reg_768_1023_4_4_n_0 : STD_LOGIC;
  signal prev_row_reg_768_1023_5_5_n_0 : STD_LOGIC;
  signal prev_row_reg_768_1023_6_6_n_0 : STD_LOGIC;
  signal prev_row_reg_768_1023_7_7_n_0 : STD_LOGIC;
  signal prev_row_reg_768_1023_8_8_n_0 : STD_LOGIC;
  signal prev_row_reg_768_1023_9_9_n_0 : STD_LOGIC;
  signal up : STD_LOGIC_VECTOR ( 9 downto 2 );
  signal up_left_pixel : STD_LOGIC_VECTOR ( 9 downto 2 );
  signal \up_left_pixel[2]_i_2_n_0\ : STD_LOGIC;
  signal \up_left_pixel[2]_i_3_n_0\ : STD_LOGIC;
  signal \up_left_pixel[2]_i_4_n_0\ : STD_LOGIC;
  signal \up_left_pixel[2]_i_5_n_0\ : STD_LOGIC;
  signal \up_left_pixel[2]_i_6_n_0\ : STD_LOGIC;
  signal \up_left_pixel[2]_i_7_n_0\ : STD_LOGIC;
  signal \up_left_pixel[3]_i_2_n_0\ : STD_LOGIC;
  signal \up_left_pixel[3]_i_3_n_0\ : STD_LOGIC;
  signal \up_left_pixel[3]_i_4_n_0\ : STD_LOGIC;
  signal \up_left_pixel[3]_i_5_n_0\ : STD_LOGIC;
  signal \up_left_pixel[3]_i_6_n_0\ : STD_LOGIC;
  signal \up_left_pixel[3]_i_7_n_0\ : STD_LOGIC;
  signal \up_left_pixel[4]_i_2_n_0\ : STD_LOGIC;
  signal \up_left_pixel[4]_i_3_n_0\ : STD_LOGIC;
  signal \up_left_pixel[4]_i_4_n_0\ : STD_LOGIC;
  signal \up_left_pixel[4]_i_5_n_0\ : STD_LOGIC;
  signal \up_left_pixel[4]_i_6_n_0\ : STD_LOGIC;
  signal \up_left_pixel[4]_i_7_n_0\ : STD_LOGIC;
  signal \up_left_pixel[5]_i_2_n_0\ : STD_LOGIC;
  signal \up_left_pixel[5]_i_3_n_0\ : STD_LOGIC;
  signal \up_left_pixel[5]_i_4_n_0\ : STD_LOGIC;
  signal \up_left_pixel[5]_i_5_n_0\ : STD_LOGIC;
  signal \up_left_pixel[5]_i_6_n_0\ : STD_LOGIC;
  signal \up_left_pixel[5]_i_7_n_0\ : STD_LOGIC;
  signal \up_left_pixel[6]_i_2_n_0\ : STD_LOGIC;
  signal \up_left_pixel[6]_i_3_n_0\ : STD_LOGIC;
  signal \up_left_pixel[6]_i_4_n_0\ : STD_LOGIC;
  signal \up_left_pixel[6]_i_5_n_0\ : STD_LOGIC;
  signal \up_left_pixel[6]_i_6_n_0\ : STD_LOGIC;
  signal \up_left_pixel[6]_i_7_n_0\ : STD_LOGIC;
  signal \up_left_pixel[7]_i_2_n_0\ : STD_LOGIC;
  signal \up_left_pixel[7]_i_3_n_0\ : STD_LOGIC;
  signal \up_left_pixel[7]_i_4_n_0\ : STD_LOGIC;
  signal \up_left_pixel[7]_i_5_n_0\ : STD_LOGIC;
  signal \up_left_pixel[7]_i_6_n_0\ : STD_LOGIC;
  signal \up_left_pixel[7]_i_7_n_0\ : STD_LOGIC;
  signal \up_left_pixel[8]_i_2_n_0\ : STD_LOGIC;
  signal \up_left_pixel[8]_i_3_n_0\ : STD_LOGIC;
  signal \up_left_pixel[8]_i_4_n_0\ : STD_LOGIC;
  signal \up_left_pixel[8]_i_5_n_0\ : STD_LOGIC;
  signal \up_left_pixel[8]_i_6_n_0\ : STD_LOGIC;
  signal \up_left_pixel[8]_i_7_n_0\ : STD_LOGIC;
  signal \up_left_pixel[9]_i_2_n_0\ : STD_LOGIC;
  signal \up_left_pixel[9]_i_3_n_0\ : STD_LOGIC;
  signal \up_left_pixel[9]_i_4_n_0\ : STD_LOGIC;
  signal \up_left_pixel[9]_i_5_n_0\ : STD_LOGIC;
  signal \up_left_pixel[9]_i_6_n_0\ : STD_LOGIC;
  signal \up_left_pixel[9]_i_7_n_0\ : STD_LOGIC;
  signal x : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \x[10]_i_1_n_0\ : STD_LOGIC;
  signal \x[10]_i_3_n_0\ : STD_LOGIC;
  signal \x[1]_i_1_n_0\ : STD_LOGIC;
  signal \x[6]_i_2_n_0\ : STD_LOGIC;
  signal y_odd : STD_LOGIC;
  signal y_odd_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \m_axis_tdata[15]_i_8\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \m_axis_tdata[16]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \m_axis_tdata[16]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \m_axis_tdata[17]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \m_axis_tdata[17]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \m_axis_tdata[18]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \m_axis_tdata[18]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \m_axis_tdata[19]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \m_axis_tdata[19]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \m_axis_tdata[20]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \m_axis_tdata[20]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \m_axis_tdata[21]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \m_axis_tdata[21]_i_3\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \m_axis_tdata[22]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \m_axis_tdata[22]_i_3\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \m_axis_tdata[23]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \m_axis_tdata[23]_i_5\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \m_axis_tdata[23]_i_7\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \m_axis_tdata[7]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \m_axis_tdata[7]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \m_axis_tdata[7]_i_4\ : label is "soft_lutpair5";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[0]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[10]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[11]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[12]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[13]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[14]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[15]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[16]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[17]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[18]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[19]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[1]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[20]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[21]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[22]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[23]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[2]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[3]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[4]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[5]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[6]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[7]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[8]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of \m_axis_tdata_reg[9]\ : label is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of m_axis_tlast_reg : label is "xilinx.com:interface:axis:1.0 M_AXIS TLAST";
  attribute X_INTERFACE_INFO of m_axis_tuser_reg : label is "xilinx.com:interface:axis:1.0 M_AXIS TUSER";
  attribute SOFT_HLUTNM of m_axis_tvalid_i_1 : label is "soft_lutpair14";
  attribute X_INTERFACE_INFO of m_axis_tvalid_reg : label is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \prev_row_reg_0_127_0_0__1\ : label is 19200;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \prev_row_reg_0_127_0_0__1\ : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of \prev_row_reg_0_127_0_0__1\ : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of \prev_row_reg_0_127_0_0__1\ : label is "RAM_SP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of \prev_row_reg_0_127_0_0__1\ : label is 1792;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of \prev_row_reg_0_127_0_0__1\ : label is 1919;
  attribute ram_offset : integer;
  attribute ram_offset of \prev_row_reg_0_127_0_0__1\ : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of \prev_row_reg_0_127_0_0__1\ : label is 2;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of \prev_row_reg_0_127_0_0__1\ : label is 2;
  attribute RTL_RAM_BITS of \prev_row_reg_0_127_0_0__2\ : label is 19200;
  attribute RTL_RAM_NAME of \prev_row_reg_0_127_0_0__2\ : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of \prev_row_reg_0_127_0_0__2\ : label is "auto";
  attribute RTL_RAM_TYPE of \prev_row_reg_0_127_0_0__2\ : label is "RAM_SP";
  attribute ram_addr_begin of \prev_row_reg_0_127_0_0__2\ : label is 1792;
  attribute ram_addr_end of \prev_row_reg_0_127_0_0__2\ : label is 1919;
  attribute ram_offset of \prev_row_reg_0_127_0_0__2\ : label is 0;
  attribute ram_slice_begin of \prev_row_reg_0_127_0_0__2\ : label is 3;
  attribute ram_slice_end of \prev_row_reg_0_127_0_0__2\ : label is 3;
  attribute RTL_RAM_BITS of \prev_row_reg_0_127_0_0__3\ : label is 19200;
  attribute RTL_RAM_NAME of \prev_row_reg_0_127_0_0__3\ : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of \prev_row_reg_0_127_0_0__3\ : label is "auto";
  attribute RTL_RAM_TYPE of \prev_row_reg_0_127_0_0__3\ : label is "RAM_SP";
  attribute ram_addr_begin of \prev_row_reg_0_127_0_0__3\ : label is 1792;
  attribute ram_addr_end of \prev_row_reg_0_127_0_0__3\ : label is 1919;
  attribute ram_offset of \prev_row_reg_0_127_0_0__3\ : label is 0;
  attribute ram_slice_begin of \prev_row_reg_0_127_0_0__3\ : label is 4;
  attribute ram_slice_end of \prev_row_reg_0_127_0_0__3\ : label is 4;
  attribute RTL_RAM_BITS of \prev_row_reg_0_127_0_0__4\ : label is 19200;
  attribute RTL_RAM_NAME of \prev_row_reg_0_127_0_0__4\ : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of \prev_row_reg_0_127_0_0__4\ : label is "auto";
  attribute RTL_RAM_TYPE of \prev_row_reg_0_127_0_0__4\ : label is "RAM_SP";
  attribute ram_addr_begin of \prev_row_reg_0_127_0_0__4\ : label is 1792;
  attribute ram_addr_end of \prev_row_reg_0_127_0_0__4\ : label is 1919;
  attribute ram_offset of \prev_row_reg_0_127_0_0__4\ : label is 0;
  attribute ram_slice_begin of \prev_row_reg_0_127_0_0__4\ : label is 5;
  attribute ram_slice_end of \prev_row_reg_0_127_0_0__4\ : label is 5;
  attribute RTL_RAM_BITS of \prev_row_reg_0_127_0_0__5\ : label is 19200;
  attribute RTL_RAM_NAME of \prev_row_reg_0_127_0_0__5\ : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of \prev_row_reg_0_127_0_0__5\ : label is "auto";
  attribute RTL_RAM_TYPE of \prev_row_reg_0_127_0_0__5\ : label is "RAM_SP";
  attribute ram_addr_begin of \prev_row_reg_0_127_0_0__5\ : label is 1792;
  attribute ram_addr_end of \prev_row_reg_0_127_0_0__5\ : label is 1919;
  attribute ram_offset of \prev_row_reg_0_127_0_0__5\ : label is 0;
  attribute ram_slice_begin of \prev_row_reg_0_127_0_0__5\ : label is 6;
  attribute ram_slice_end of \prev_row_reg_0_127_0_0__5\ : label is 6;
  attribute RTL_RAM_BITS of \prev_row_reg_0_127_0_0__6\ : label is 19200;
  attribute RTL_RAM_NAME of \prev_row_reg_0_127_0_0__6\ : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of \prev_row_reg_0_127_0_0__6\ : label is "auto";
  attribute RTL_RAM_TYPE of \prev_row_reg_0_127_0_0__6\ : label is "RAM_SP";
  attribute ram_addr_begin of \prev_row_reg_0_127_0_0__6\ : label is 1792;
  attribute ram_addr_end of \prev_row_reg_0_127_0_0__6\ : label is 1919;
  attribute ram_offset of \prev_row_reg_0_127_0_0__6\ : label is 0;
  attribute ram_slice_begin of \prev_row_reg_0_127_0_0__6\ : label is 7;
  attribute ram_slice_end of \prev_row_reg_0_127_0_0__6\ : label is 7;
  attribute RTL_RAM_BITS of \prev_row_reg_0_127_0_0__7\ : label is 19200;
  attribute RTL_RAM_NAME of \prev_row_reg_0_127_0_0__7\ : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of \prev_row_reg_0_127_0_0__7\ : label is "auto";
  attribute RTL_RAM_TYPE of \prev_row_reg_0_127_0_0__7\ : label is "RAM_SP";
  attribute ram_addr_begin of \prev_row_reg_0_127_0_0__7\ : label is 1792;
  attribute ram_addr_end of \prev_row_reg_0_127_0_0__7\ : label is 1919;
  attribute ram_offset of \prev_row_reg_0_127_0_0__7\ : label is 0;
  attribute ram_slice_begin of \prev_row_reg_0_127_0_0__7\ : label is 8;
  attribute ram_slice_end of \prev_row_reg_0_127_0_0__7\ : label is 8;
  attribute RTL_RAM_BITS of \prev_row_reg_0_127_0_0__8\ : label is 19200;
  attribute RTL_RAM_NAME of \prev_row_reg_0_127_0_0__8\ : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of \prev_row_reg_0_127_0_0__8\ : label is "auto";
  attribute RTL_RAM_TYPE of \prev_row_reg_0_127_0_0__8\ : label is "RAM_SP";
  attribute ram_addr_begin of \prev_row_reg_0_127_0_0__8\ : label is 1792;
  attribute ram_addr_end of \prev_row_reg_0_127_0_0__8\ : label is 1919;
  attribute ram_offset of \prev_row_reg_0_127_0_0__8\ : label is 0;
  attribute ram_slice_begin of \prev_row_reg_0_127_0_0__8\ : label is 9;
  attribute ram_slice_end of \prev_row_reg_0_127_0_0__8\ : label is 9;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_0_255_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_0_255_2_2 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_0_255_2_2 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_0_255_2_2 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_0_255_2_2 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_0_255_2_2 : label is 0;
  attribute ram_addr_end of prev_row_reg_0_255_2_2 : label is 255;
  attribute ram_offset of prev_row_reg_0_255_2_2 : label is 0;
  attribute ram_slice_begin of prev_row_reg_0_255_2_2 : label is 2;
  attribute ram_slice_end of prev_row_reg_0_255_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_0_255_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_0_255_3_3 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_0_255_3_3 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_0_255_3_3 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_0_255_3_3 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_0_255_3_3 : label is 0;
  attribute ram_addr_end of prev_row_reg_0_255_3_3 : label is 255;
  attribute ram_offset of prev_row_reg_0_255_3_3 : label is 0;
  attribute ram_slice_begin of prev_row_reg_0_255_3_3 : label is 3;
  attribute ram_slice_end of prev_row_reg_0_255_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_0_255_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_0_255_4_4 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_0_255_4_4 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_0_255_4_4 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_0_255_4_4 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_0_255_4_4 : label is 0;
  attribute ram_addr_end of prev_row_reg_0_255_4_4 : label is 255;
  attribute ram_offset of prev_row_reg_0_255_4_4 : label is 0;
  attribute ram_slice_begin of prev_row_reg_0_255_4_4 : label is 4;
  attribute ram_slice_end of prev_row_reg_0_255_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_0_255_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_0_255_5_5 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_0_255_5_5 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_0_255_5_5 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_0_255_5_5 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_0_255_5_5 : label is 0;
  attribute ram_addr_end of prev_row_reg_0_255_5_5 : label is 255;
  attribute ram_offset of prev_row_reg_0_255_5_5 : label is 0;
  attribute ram_slice_begin of prev_row_reg_0_255_5_5 : label is 5;
  attribute ram_slice_end of prev_row_reg_0_255_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_0_255_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_0_255_6_6 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_0_255_6_6 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_0_255_6_6 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_0_255_6_6 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_0_255_6_6 : label is 0;
  attribute ram_addr_end of prev_row_reg_0_255_6_6 : label is 255;
  attribute ram_offset of prev_row_reg_0_255_6_6 : label is 0;
  attribute ram_slice_begin of prev_row_reg_0_255_6_6 : label is 6;
  attribute ram_slice_end of prev_row_reg_0_255_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_0_255_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_0_255_7_7 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_0_255_7_7 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_0_255_7_7 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_0_255_7_7 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_0_255_7_7 : label is 0;
  attribute ram_addr_end of prev_row_reg_0_255_7_7 : label is 255;
  attribute ram_offset of prev_row_reg_0_255_7_7 : label is 0;
  attribute ram_slice_begin of prev_row_reg_0_255_7_7 : label is 7;
  attribute ram_slice_end of prev_row_reg_0_255_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_0_255_8_8 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_0_255_8_8 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_0_255_8_8 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_0_255_8_8 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_0_255_8_8 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_0_255_8_8 : label is 0;
  attribute ram_addr_end of prev_row_reg_0_255_8_8 : label is 255;
  attribute ram_offset of prev_row_reg_0_255_8_8 : label is 0;
  attribute ram_slice_begin of prev_row_reg_0_255_8_8 : label is 8;
  attribute ram_slice_end of prev_row_reg_0_255_8_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_0_255_9_9 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_0_255_9_9 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_0_255_9_9 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_0_255_9_9 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_0_255_9_9 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_0_255_9_9 : label is 0;
  attribute ram_addr_end of prev_row_reg_0_255_9_9 : label is 255;
  attribute ram_offset of prev_row_reg_0_255_9_9 : label is 0;
  attribute ram_slice_begin of prev_row_reg_0_255_9_9 : label is 9;
  attribute ram_slice_end of prev_row_reg_0_255_9_9 : label is 9;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1024_1279_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1024_1279_2_2 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1024_1279_2_2 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1024_1279_2_2 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1024_1279_2_2 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1024_1279_2_2 : label is 1024;
  attribute ram_addr_end of prev_row_reg_1024_1279_2_2 : label is 1279;
  attribute ram_offset of prev_row_reg_1024_1279_2_2 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1024_1279_2_2 : label is 2;
  attribute ram_slice_end of prev_row_reg_1024_1279_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1024_1279_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1024_1279_3_3 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1024_1279_3_3 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1024_1279_3_3 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1024_1279_3_3 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1024_1279_3_3 : label is 1024;
  attribute ram_addr_end of prev_row_reg_1024_1279_3_3 : label is 1279;
  attribute ram_offset of prev_row_reg_1024_1279_3_3 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1024_1279_3_3 : label is 3;
  attribute ram_slice_end of prev_row_reg_1024_1279_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1024_1279_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1024_1279_4_4 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1024_1279_4_4 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1024_1279_4_4 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1024_1279_4_4 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1024_1279_4_4 : label is 1024;
  attribute ram_addr_end of prev_row_reg_1024_1279_4_4 : label is 1279;
  attribute ram_offset of prev_row_reg_1024_1279_4_4 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1024_1279_4_4 : label is 4;
  attribute ram_slice_end of prev_row_reg_1024_1279_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1024_1279_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1024_1279_5_5 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1024_1279_5_5 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1024_1279_5_5 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1024_1279_5_5 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1024_1279_5_5 : label is 1024;
  attribute ram_addr_end of prev_row_reg_1024_1279_5_5 : label is 1279;
  attribute ram_offset of prev_row_reg_1024_1279_5_5 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1024_1279_5_5 : label is 5;
  attribute ram_slice_end of prev_row_reg_1024_1279_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1024_1279_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1024_1279_6_6 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1024_1279_6_6 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1024_1279_6_6 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1024_1279_6_6 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1024_1279_6_6 : label is 1024;
  attribute ram_addr_end of prev_row_reg_1024_1279_6_6 : label is 1279;
  attribute ram_offset of prev_row_reg_1024_1279_6_6 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1024_1279_6_6 : label is 6;
  attribute ram_slice_end of prev_row_reg_1024_1279_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1024_1279_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1024_1279_7_7 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1024_1279_7_7 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1024_1279_7_7 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1024_1279_7_7 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1024_1279_7_7 : label is 1024;
  attribute ram_addr_end of prev_row_reg_1024_1279_7_7 : label is 1279;
  attribute ram_offset of prev_row_reg_1024_1279_7_7 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1024_1279_7_7 : label is 7;
  attribute ram_slice_end of prev_row_reg_1024_1279_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1024_1279_8_8 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1024_1279_8_8 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1024_1279_8_8 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1024_1279_8_8 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1024_1279_8_8 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1024_1279_8_8 : label is 1024;
  attribute ram_addr_end of prev_row_reg_1024_1279_8_8 : label is 1279;
  attribute ram_offset of prev_row_reg_1024_1279_8_8 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1024_1279_8_8 : label is 8;
  attribute ram_slice_end of prev_row_reg_1024_1279_8_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1024_1279_9_9 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1024_1279_9_9 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1024_1279_9_9 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1024_1279_9_9 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1024_1279_9_9 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1024_1279_9_9 : label is 1024;
  attribute ram_addr_end of prev_row_reg_1024_1279_9_9 : label is 1279;
  attribute ram_offset of prev_row_reg_1024_1279_9_9 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1024_1279_9_9 : label is 9;
  attribute ram_slice_end of prev_row_reg_1024_1279_9_9 : label is 9;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1280_1535_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1280_1535_2_2 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1280_1535_2_2 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1280_1535_2_2 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1280_1535_2_2 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1280_1535_2_2 : label is 1280;
  attribute ram_addr_end of prev_row_reg_1280_1535_2_2 : label is 1535;
  attribute ram_offset of prev_row_reg_1280_1535_2_2 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1280_1535_2_2 : label is 2;
  attribute ram_slice_end of prev_row_reg_1280_1535_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1280_1535_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1280_1535_3_3 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1280_1535_3_3 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1280_1535_3_3 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1280_1535_3_3 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1280_1535_3_3 : label is 1280;
  attribute ram_addr_end of prev_row_reg_1280_1535_3_3 : label is 1535;
  attribute ram_offset of prev_row_reg_1280_1535_3_3 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1280_1535_3_3 : label is 3;
  attribute ram_slice_end of prev_row_reg_1280_1535_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1280_1535_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1280_1535_4_4 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1280_1535_4_4 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1280_1535_4_4 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1280_1535_4_4 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1280_1535_4_4 : label is 1280;
  attribute ram_addr_end of prev_row_reg_1280_1535_4_4 : label is 1535;
  attribute ram_offset of prev_row_reg_1280_1535_4_4 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1280_1535_4_4 : label is 4;
  attribute ram_slice_end of prev_row_reg_1280_1535_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1280_1535_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1280_1535_5_5 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1280_1535_5_5 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1280_1535_5_5 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1280_1535_5_5 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1280_1535_5_5 : label is 1280;
  attribute ram_addr_end of prev_row_reg_1280_1535_5_5 : label is 1535;
  attribute ram_offset of prev_row_reg_1280_1535_5_5 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1280_1535_5_5 : label is 5;
  attribute ram_slice_end of prev_row_reg_1280_1535_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1280_1535_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1280_1535_6_6 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1280_1535_6_6 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1280_1535_6_6 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1280_1535_6_6 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1280_1535_6_6 : label is 1280;
  attribute ram_addr_end of prev_row_reg_1280_1535_6_6 : label is 1535;
  attribute ram_offset of prev_row_reg_1280_1535_6_6 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1280_1535_6_6 : label is 6;
  attribute ram_slice_end of prev_row_reg_1280_1535_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1280_1535_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1280_1535_7_7 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1280_1535_7_7 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1280_1535_7_7 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1280_1535_7_7 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1280_1535_7_7 : label is 1280;
  attribute ram_addr_end of prev_row_reg_1280_1535_7_7 : label is 1535;
  attribute ram_offset of prev_row_reg_1280_1535_7_7 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1280_1535_7_7 : label is 7;
  attribute ram_slice_end of prev_row_reg_1280_1535_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1280_1535_8_8 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1280_1535_8_8 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1280_1535_8_8 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1280_1535_8_8 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1280_1535_8_8 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1280_1535_8_8 : label is 1280;
  attribute ram_addr_end of prev_row_reg_1280_1535_8_8 : label is 1535;
  attribute ram_offset of prev_row_reg_1280_1535_8_8 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1280_1535_8_8 : label is 8;
  attribute ram_slice_end of prev_row_reg_1280_1535_8_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1280_1535_9_9 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1280_1535_9_9 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1280_1535_9_9 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1280_1535_9_9 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1280_1535_9_9 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1280_1535_9_9 : label is 1280;
  attribute ram_addr_end of prev_row_reg_1280_1535_9_9 : label is 1535;
  attribute ram_offset of prev_row_reg_1280_1535_9_9 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1280_1535_9_9 : label is 9;
  attribute ram_slice_end of prev_row_reg_1280_1535_9_9 : label is 9;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1536_1791_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1536_1791_2_2 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1536_1791_2_2 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1536_1791_2_2 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1536_1791_2_2 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1536_1791_2_2 : label is 1536;
  attribute ram_addr_end of prev_row_reg_1536_1791_2_2 : label is 1791;
  attribute ram_offset of prev_row_reg_1536_1791_2_2 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1536_1791_2_2 : label is 2;
  attribute ram_slice_end of prev_row_reg_1536_1791_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1536_1791_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1536_1791_3_3 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1536_1791_3_3 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1536_1791_3_3 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1536_1791_3_3 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1536_1791_3_3 : label is 1536;
  attribute ram_addr_end of prev_row_reg_1536_1791_3_3 : label is 1791;
  attribute ram_offset of prev_row_reg_1536_1791_3_3 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1536_1791_3_3 : label is 3;
  attribute ram_slice_end of prev_row_reg_1536_1791_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1536_1791_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1536_1791_4_4 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1536_1791_4_4 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1536_1791_4_4 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1536_1791_4_4 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1536_1791_4_4 : label is 1536;
  attribute ram_addr_end of prev_row_reg_1536_1791_4_4 : label is 1791;
  attribute ram_offset of prev_row_reg_1536_1791_4_4 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1536_1791_4_4 : label is 4;
  attribute ram_slice_end of prev_row_reg_1536_1791_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1536_1791_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1536_1791_5_5 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1536_1791_5_5 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1536_1791_5_5 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1536_1791_5_5 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1536_1791_5_5 : label is 1536;
  attribute ram_addr_end of prev_row_reg_1536_1791_5_5 : label is 1791;
  attribute ram_offset of prev_row_reg_1536_1791_5_5 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1536_1791_5_5 : label is 5;
  attribute ram_slice_end of prev_row_reg_1536_1791_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1536_1791_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1536_1791_6_6 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1536_1791_6_6 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1536_1791_6_6 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1536_1791_6_6 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1536_1791_6_6 : label is 1536;
  attribute ram_addr_end of prev_row_reg_1536_1791_6_6 : label is 1791;
  attribute ram_offset of prev_row_reg_1536_1791_6_6 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1536_1791_6_6 : label is 6;
  attribute ram_slice_end of prev_row_reg_1536_1791_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1536_1791_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1536_1791_7_7 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1536_1791_7_7 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1536_1791_7_7 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1536_1791_7_7 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1536_1791_7_7 : label is 1536;
  attribute ram_addr_end of prev_row_reg_1536_1791_7_7 : label is 1791;
  attribute ram_offset of prev_row_reg_1536_1791_7_7 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1536_1791_7_7 : label is 7;
  attribute ram_slice_end of prev_row_reg_1536_1791_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1536_1791_8_8 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1536_1791_8_8 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1536_1791_8_8 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1536_1791_8_8 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1536_1791_8_8 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1536_1791_8_8 : label is 1536;
  attribute ram_addr_end of prev_row_reg_1536_1791_8_8 : label is 1791;
  attribute ram_offset of prev_row_reg_1536_1791_8_8 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1536_1791_8_8 : label is 8;
  attribute ram_slice_end of prev_row_reg_1536_1791_8_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_1536_1791_9_9 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_1536_1791_9_9 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_1536_1791_9_9 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_1536_1791_9_9 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_1536_1791_9_9 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_1536_1791_9_9 : label is 1536;
  attribute ram_addr_end of prev_row_reg_1536_1791_9_9 : label is 1791;
  attribute ram_offset of prev_row_reg_1536_1791_9_9 : label is 0;
  attribute ram_slice_begin of prev_row_reg_1536_1791_9_9 : label is 9;
  attribute ram_slice_end of prev_row_reg_1536_1791_9_9 : label is 9;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_256_511_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_256_511_2_2 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_256_511_2_2 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_256_511_2_2 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_256_511_2_2 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_256_511_2_2 : label is 256;
  attribute ram_addr_end of prev_row_reg_256_511_2_2 : label is 511;
  attribute ram_offset of prev_row_reg_256_511_2_2 : label is 0;
  attribute ram_slice_begin of prev_row_reg_256_511_2_2 : label is 2;
  attribute ram_slice_end of prev_row_reg_256_511_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_256_511_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_256_511_3_3 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_256_511_3_3 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_256_511_3_3 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_256_511_3_3 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_256_511_3_3 : label is 256;
  attribute ram_addr_end of prev_row_reg_256_511_3_3 : label is 511;
  attribute ram_offset of prev_row_reg_256_511_3_3 : label is 0;
  attribute ram_slice_begin of prev_row_reg_256_511_3_3 : label is 3;
  attribute ram_slice_end of prev_row_reg_256_511_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_256_511_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_256_511_4_4 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_256_511_4_4 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_256_511_4_4 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_256_511_4_4 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_256_511_4_4 : label is 256;
  attribute ram_addr_end of prev_row_reg_256_511_4_4 : label is 511;
  attribute ram_offset of prev_row_reg_256_511_4_4 : label is 0;
  attribute ram_slice_begin of prev_row_reg_256_511_4_4 : label is 4;
  attribute ram_slice_end of prev_row_reg_256_511_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_256_511_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_256_511_5_5 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_256_511_5_5 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_256_511_5_5 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_256_511_5_5 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_256_511_5_5 : label is 256;
  attribute ram_addr_end of prev_row_reg_256_511_5_5 : label is 511;
  attribute ram_offset of prev_row_reg_256_511_5_5 : label is 0;
  attribute ram_slice_begin of prev_row_reg_256_511_5_5 : label is 5;
  attribute ram_slice_end of prev_row_reg_256_511_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_256_511_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_256_511_6_6 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_256_511_6_6 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_256_511_6_6 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_256_511_6_6 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_256_511_6_6 : label is 256;
  attribute ram_addr_end of prev_row_reg_256_511_6_6 : label is 511;
  attribute ram_offset of prev_row_reg_256_511_6_6 : label is 0;
  attribute ram_slice_begin of prev_row_reg_256_511_6_6 : label is 6;
  attribute ram_slice_end of prev_row_reg_256_511_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_256_511_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_256_511_7_7 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_256_511_7_7 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_256_511_7_7 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_256_511_7_7 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_256_511_7_7 : label is 256;
  attribute ram_addr_end of prev_row_reg_256_511_7_7 : label is 511;
  attribute ram_offset of prev_row_reg_256_511_7_7 : label is 0;
  attribute ram_slice_begin of prev_row_reg_256_511_7_7 : label is 7;
  attribute ram_slice_end of prev_row_reg_256_511_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_256_511_8_8 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_256_511_8_8 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_256_511_8_8 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_256_511_8_8 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_256_511_8_8 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_256_511_8_8 : label is 256;
  attribute ram_addr_end of prev_row_reg_256_511_8_8 : label is 511;
  attribute ram_offset of prev_row_reg_256_511_8_8 : label is 0;
  attribute ram_slice_begin of prev_row_reg_256_511_8_8 : label is 8;
  attribute ram_slice_end of prev_row_reg_256_511_8_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_256_511_9_9 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_256_511_9_9 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_256_511_9_9 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_256_511_9_9 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_256_511_9_9 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_256_511_9_9 : label is 256;
  attribute ram_addr_end of prev_row_reg_256_511_9_9 : label is 511;
  attribute ram_offset of prev_row_reg_256_511_9_9 : label is 0;
  attribute ram_slice_begin of prev_row_reg_256_511_9_9 : label is 9;
  attribute ram_slice_end of prev_row_reg_256_511_9_9 : label is 9;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_512_767_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_512_767_2_2 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_512_767_2_2 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_512_767_2_2 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_512_767_2_2 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_512_767_2_2 : label is 512;
  attribute ram_addr_end of prev_row_reg_512_767_2_2 : label is 767;
  attribute ram_offset of prev_row_reg_512_767_2_2 : label is 0;
  attribute ram_slice_begin of prev_row_reg_512_767_2_2 : label is 2;
  attribute ram_slice_end of prev_row_reg_512_767_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_512_767_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_512_767_3_3 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_512_767_3_3 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_512_767_3_3 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_512_767_3_3 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_512_767_3_3 : label is 512;
  attribute ram_addr_end of prev_row_reg_512_767_3_3 : label is 767;
  attribute ram_offset of prev_row_reg_512_767_3_3 : label is 0;
  attribute ram_slice_begin of prev_row_reg_512_767_3_3 : label is 3;
  attribute ram_slice_end of prev_row_reg_512_767_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_512_767_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_512_767_4_4 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_512_767_4_4 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_512_767_4_4 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_512_767_4_4 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_512_767_4_4 : label is 512;
  attribute ram_addr_end of prev_row_reg_512_767_4_4 : label is 767;
  attribute ram_offset of prev_row_reg_512_767_4_4 : label is 0;
  attribute ram_slice_begin of prev_row_reg_512_767_4_4 : label is 4;
  attribute ram_slice_end of prev_row_reg_512_767_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_512_767_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_512_767_5_5 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_512_767_5_5 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_512_767_5_5 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_512_767_5_5 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_512_767_5_5 : label is 512;
  attribute ram_addr_end of prev_row_reg_512_767_5_5 : label is 767;
  attribute ram_offset of prev_row_reg_512_767_5_5 : label is 0;
  attribute ram_slice_begin of prev_row_reg_512_767_5_5 : label is 5;
  attribute ram_slice_end of prev_row_reg_512_767_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_512_767_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_512_767_6_6 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_512_767_6_6 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_512_767_6_6 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_512_767_6_6 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_512_767_6_6 : label is 512;
  attribute ram_addr_end of prev_row_reg_512_767_6_6 : label is 767;
  attribute ram_offset of prev_row_reg_512_767_6_6 : label is 0;
  attribute ram_slice_begin of prev_row_reg_512_767_6_6 : label is 6;
  attribute ram_slice_end of prev_row_reg_512_767_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_512_767_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_512_767_7_7 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_512_767_7_7 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_512_767_7_7 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_512_767_7_7 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_512_767_7_7 : label is 512;
  attribute ram_addr_end of prev_row_reg_512_767_7_7 : label is 767;
  attribute ram_offset of prev_row_reg_512_767_7_7 : label is 0;
  attribute ram_slice_begin of prev_row_reg_512_767_7_7 : label is 7;
  attribute ram_slice_end of prev_row_reg_512_767_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_512_767_8_8 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_512_767_8_8 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_512_767_8_8 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_512_767_8_8 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_512_767_8_8 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_512_767_8_8 : label is 512;
  attribute ram_addr_end of prev_row_reg_512_767_8_8 : label is 767;
  attribute ram_offset of prev_row_reg_512_767_8_8 : label is 0;
  attribute ram_slice_begin of prev_row_reg_512_767_8_8 : label is 8;
  attribute ram_slice_end of prev_row_reg_512_767_8_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_512_767_9_9 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_512_767_9_9 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_512_767_9_9 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_512_767_9_9 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_512_767_9_9 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_512_767_9_9 : label is 512;
  attribute ram_addr_end of prev_row_reg_512_767_9_9 : label is 767;
  attribute ram_offset of prev_row_reg_512_767_9_9 : label is 0;
  attribute ram_slice_begin of prev_row_reg_512_767_9_9 : label is 9;
  attribute ram_slice_end of prev_row_reg_512_767_9_9 : label is 9;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_768_1023_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_768_1023_2_2 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_768_1023_2_2 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_768_1023_2_2 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_768_1023_2_2 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_768_1023_2_2 : label is 768;
  attribute ram_addr_end of prev_row_reg_768_1023_2_2 : label is 1023;
  attribute ram_offset of prev_row_reg_768_1023_2_2 : label is 0;
  attribute ram_slice_begin of prev_row_reg_768_1023_2_2 : label is 2;
  attribute ram_slice_end of prev_row_reg_768_1023_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_768_1023_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_768_1023_3_3 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_768_1023_3_3 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_768_1023_3_3 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_768_1023_3_3 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_768_1023_3_3 : label is 768;
  attribute ram_addr_end of prev_row_reg_768_1023_3_3 : label is 1023;
  attribute ram_offset of prev_row_reg_768_1023_3_3 : label is 0;
  attribute ram_slice_begin of prev_row_reg_768_1023_3_3 : label is 3;
  attribute ram_slice_end of prev_row_reg_768_1023_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_768_1023_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_768_1023_4_4 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_768_1023_4_4 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_768_1023_4_4 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_768_1023_4_4 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_768_1023_4_4 : label is 768;
  attribute ram_addr_end of prev_row_reg_768_1023_4_4 : label is 1023;
  attribute ram_offset of prev_row_reg_768_1023_4_4 : label is 0;
  attribute ram_slice_begin of prev_row_reg_768_1023_4_4 : label is 4;
  attribute ram_slice_end of prev_row_reg_768_1023_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_768_1023_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_768_1023_5_5 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_768_1023_5_5 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_768_1023_5_5 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_768_1023_5_5 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_768_1023_5_5 : label is 768;
  attribute ram_addr_end of prev_row_reg_768_1023_5_5 : label is 1023;
  attribute ram_offset of prev_row_reg_768_1023_5_5 : label is 0;
  attribute ram_slice_begin of prev_row_reg_768_1023_5_5 : label is 5;
  attribute ram_slice_end of prev_row_reg_768_1023_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_768_1023_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_768_1023_6_6 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_768_1023_6_6 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_768_1023_6_6 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_768_1023_6_6 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_768_1023_6_6 : label is 768;
  attribute ram_addr_end of prev_row_reg_768_1023_6_6 : label is 1023;
  attribute ram_offset of prev_row_reg_768_1023_6_6 : label is 0;
  attribute ram_slice_begin of prev_row_reg_768_1023_6_6 : label is 6;
  attribute ram_slice_end of prev_row_reg_768_1023_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_768_1023_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_768_1023_7_7 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_768_1023_7_7 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_768_1023_7_7 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_768_1023_7_7 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_768_1023_7_7 : label is 768;
  attribute ram_addr_end of prev_row_reg_768_1023_7_7 : label is 1023;
  attribute ram_offset of prev_row_reg_768_1023_7_7 : label is 0;
  attribute ram_slice_begin of prev_row_reg_768_1023_7_7 : label is 7;
  attribute ram_slice_end of prev_row_reg_768_1023_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_768_1023_8_8 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_768_1023_8_8 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_768_1023_8_8 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_768_1023_8_8 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_768_1023_8_8 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_768_1023_8_8 : label is 768;
  attribute ram_addr_end of prev_row_reg_768_1023_8_8 : label is 1023;
  attribute ram_offset of prev_row_reg_768_1023_8_8 : label is 0;
  attribute ram_slice_begin of prev_row_reg_768_1023_8_8 : label is 8;
  attribute ram_slice_end of prev_row_reg_768_1023_8_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of prev_row_reg_768_1023_9_9 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of prev_row_reg_768_1023_9_9 : label is 19200;
  attribute RTL_RAM_NAME of prev_row_reg_768_1023_9_9 : label is "design_1_axis_raw_to_gbr_0_0/inst/prev_row_reg";
  attribute RTL_RAM_STYLE of prev_row_reg_768_1023_9_9 : label is "auto";
  attribute RTL_RAM_TYPE of prev_row_reg_768_1023_9_9 : label is "RAM_SP";
  attribute ram_addr_begin of prev_row_reg_768_1023_9_9 : label is 768;
  attribute ram_addr_end of prev_row_reg_768_1023_9_9 : label is 1023;
  attribute ram_offset of prev_row_reg_768_1023_9_9 : label is 0;
  attribute ram_slice_begin of prev_row_reg_768_1023_9_9 : label is 9;
  attribute ram_slice_end of prev_row_reg_768_1023_9_9 : label is 9;
  attribute SOFT_HLUTNM of s_axis_tready_INST_0 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \x[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \x[10]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \x[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \x[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \x[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \x[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \x[7]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \x[8]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \x[9]_i_1\ : label is "soft_lutpair0";
begin
  m_axis_tvalid_reg_0 <= \^m_axis_tvalid_reg_0\;
have_prev_row_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EE2A0000"
    )
        port map (
      I0 => have_prev_row_reg_n_0,
      I1 => \m_axis_tdata[23]_i_2_n_0\,
      I2 => s_axis_tuser,
      I3 => s_axis_tlast,
      I4 => aresetn,
      O => have_prev_row_i_1_n_0
    );
have_prev_row_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => have_prev_row_i_1_n_0,
      Q => have_prev_row_reg_n_0,
      R => '0'
    );
\left_pixel_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => s_axis_tdata(0),
      Q => left_pixel(2),
      R => p_0_in
    );
\left_pixel_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => s_axis_tdata(1),
      Q => left_pixel(3),
      R => p_0_in
    );
\left_pixel_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => s_axis_tdata(2),
      Q => left_pixel(4),
      R => p_0_in
    );
\left_pixel_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => s_axis_tdata(3),
      Q => left_pixel(5),
      R => p_0_in
    );
\left_pixel_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => s_axis_tdata(4),
      Q => left_pixel(6),
      R => p_0_in
    );
\left_pixel_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => s_axis_tdata(5),
      Q => left_pixel(7),
      R => p_0_in
    );
\left_pixel_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => s_axis_tdata(6),
      Q => left_pixel(8),
      R => p_0_in
    );
\left_pixel_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => s_axis_tdata(7),
      Q => left_pixel(9),
      R => p_0_in
    );
\m_axis_tdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => up(2),
      I2 => \m_axis_tdata[7]_i_3_n_0\,
      I3 => left_pixel(2),
      I4 => s_axis_tdata(0),
      I5 => \m_axis_tdata[7]_i_4_n_0\,
      O => p_1_out(0)
    );
\m_axis_tdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(2),
      I1 => \m_axis_tdata[15]_i_2_n_0\,
      I2 => \m_axis_tdata[10]_i_2_n_0\,
      I3 => \m_axis_tdata[10]_i_3_n_0\,
      I4 => up(4),
      I5 => \m_axis_tdata[15]_i_5_n_0\,
      O => p_1_out(10)
    );
\m_axis_tdata[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[15]_i_8_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => left_pixel(4),
      O => \m_axis_tdata[10]_i_2_n_0\
    );
\m_axis_tdata[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => up_left_pixel(4),
      O => \m_axis_tdata[10]_i_3_n_0\
    );
\m_axis_tdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(3),
      I1 => \m_axis_tdata[15]_i_2_n_0\,
      I2 => \m_axis_tdata[11]_i_2_n_0\,
      I3 => \m_axis_tdata[11]_i_3_n_0\,
      I4 => up(5),
      I5 => \m_axis_tdata[15]_i_5_n_0\,
      O => p_1_out(11)
    );
\m_axis_tdata[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[15]_i_8_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => left_pixel(5),
      O => \m_axis_tdata[11]_i_2_n_0\
    );
\m_axis_tdata[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => up_left_pixel(5),
      O => \m_axis_tdata[11]_i_3_n_0\
    );
\m_axis_tdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(4),
      I1 => \m_axis_tdata[15]_i_2_n_0\,
      I2 => \m_axis_tdata[12]_i_2_n_0\,
      I3 => \m_axis_tdata[12]_i_3_n_0\,
      I4 => up(6),
      I5 => \m_axis_tdata[15]_i_5_n_0\,
      O => p_1_out(12)
    );
\m_axis_tdata[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[15]_i_8_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => left_pixel(6),
      O => \m_axis_tdata[12]_i_2_n_0\
    );
\m_axis_tdata[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => up_left_pixel(6),
      O => \m_axis_tdata[12]_i_3_n_0\
    );
\m_axis_tdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(5),
      I1 => \m_axis_tdata[15]_i_2_n_0\,
      I2 => \m_axis_tdata[13]_i_2_n_0\,
      I3 => \m_axis_tdata[13]_i_3_n_0\,
      I4 => up(7),
      I5 => \m_axis_tdata[15]_i_5_n_0\,
      O => p_1_out(13)
    );
\m_axis_tdata[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[15]_i_8_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => left_pixel(7),
      O => \m_axis_tdata[13]_i_2_n_0\
    );
\m_axis_tdata[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => up_left_pixel(7),
      O => \m_axis_tdata[13]_i_3_n_0\
    );
\m_axis_tdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(6),
      I1 => \m_axis_tdata[15]_i_2_n_0\,
      I2 => \m_axis_tdata[14]_i_2_n_0\,
      I3 => \m_axis_tdata[14]_i_3_n_0\,
      I4 => up(8),
      I5 => \m_axis_tdata[15]_i_5_n_0\,
      O => p_1_out(14)
    );
\m_axis_tdata[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[15]_i_8_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => left_pixel(8),
      O => \m_axis_tdata[14]_i_2_n_0\
    );
\m_axis_tdata[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => up_left_pixel(8),
      O => \m_axis_tdata[14]_i_3_n_0\
    );
\m_axis_tdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(7),
      I1 => \m_axis_tdata[15]_i_2_n_0\,
      I2 => \m_axis_tdata[15]_i_3_n_0\,
      I3 => \m_axis_tdata[15]_i_4_n_0\,
      I4 => up(9),
      I5 => \m_axis_tdata[15]_i_5_n_0\,
      O => p_1_out(15)
    );
\m_axis_tdata[15]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => x(5),
      I1 => x(6),
      O => \m_axis_tdata[15]_i_10_n_0\
    );
\m_axis_tdata[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00EAFFEA"
    )
        port map (
      I0 => x(0),
      I1 => \m_axis_tdata[15]_i_6_n_0\,
      I2 => \m_axis_tdata[15]_i_7_n_0\,
      I3 => y_odd,
      I4 => have_prev_row_reg_n_0,
      I5 => s_axis_tuser,
      O => \m_axis_tdata[15]_i_2_n_0\
    );
\m_axis_tdata[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[15]_i_8_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => left_pixel(9),
      O => \m_axis_tdata[15]_i_3_n_0\
    );
\m_axis_tdata[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => up_left_pixel(9),
      O => \m_axis_tdata[15]_i_4_n_0\
    );
\m_axis_tdata[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000088888000"
    )
        port map (
      I0 => y_odd,
      I1 => have_prev_row_reg_n_0,
      I2 => \m_axis_tdata[15]_i_7_n_0\,
      I3 => \m_axis_tdata[15]_i_6_n_0\,
      I4 => x(0),
      I5 => s_axis_tuser,
      O => \m_axis_tdata[15]_i_5_n_0\
    );
\m_axis_tdata[15]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => x(5),
      I1 => x(6),
      I2 => x(7),
      I3 => x(8),
      I4 => x(10),
      I5 => x(9),
      O => \m_axis_tdata[15]_i_6_n_0\
    );
\m_axis_tdata[15]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => x(2),
      I1 => x(1),
      I2 => x(4),
      I3 => x(3),
      O => \m_axis_tdata[15]_i_7_n_0\
    );
\m_axis_tdata[15]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => x(0),
      I2 => y_odd,
      O => \m_axis_tdata[15]_i_8_n_0\
    );
\m_axis_tdata[15]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => x(9),
      I1 => x(10),
      I2 => x(7),
      I3 => x(8),
      I4 => x(2),
      I5 => x(1),
      O => \m_axis_tdata[15]_i_9_n_0\
    );
\m_axis_tdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(0),
      I1 => \m_axis_tdata[23]_i_4_n_0\,
      I2 => \m_axis_tdata[16]_i_2_n_0\,
      I3 => \m_axis_tdata[16]_i_3_n_0\,
      I4 => up(2),
      I5 => \m_axis_tdata[23]_i_7_n_0\,
      O => p_1_out(16)
    );
\m_axis_tdata[16]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => x(0),
      I2 => y_odd,
      I3 => left_pixel(2),
      O => \m_axis_tdata[16]_i_2_n_0\
    );
\m_axis_tdata[16]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => have_prev_row_reg_n_0,
      I1 => x(0),
      I2 => s_axis_tuser,
      I3 => y_odd,
      I4 => up_left_pixel(2),
      O => \m_axis_tdata[16]_i_3_n_0\
    );
\m_axis_tdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(1),
      I1 => \m_axis_tdata[23]_i_4_n_0\,
      I2 => \m_axis_tdata[17]_i_2_n_0\,
      I3 => \m_axis_tdata[17]_i_3_n_0\,
      I4 => up(3),
      I5 => \m_axis_tdata[23]_i_7_n_0\,
      O => p_1_out(17)
    );
\m_axis_tdata[17]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => x(0),
      I2 => y_odd,
      I3 => left_pixel(3),
      O => \m_axis_tdata[17]_i_2_n_0\
    );
\m_axis_tdata[17]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => have_prev_row_reg_n_0,
      I1 => x(0),
      I2 => s_axis_tuser,
      I3 => y_odd,
      I4 => up_left_pixel(3),
      O => \m_axis_tdata[17]_i_3_n_0\
    );
\m_axis_tdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(2),
      I1 => \m_axis_tdata[23]_i_4_n_0\,
      I2 => \m_axis_tdata[18]_i_2_n_0\,
      I3 => \m_axis_tdata[18]_i_3_n_0\,
      I4 => up(4),
      I5 => \m_axis_tdata[23]_i_7_n_0\,
      O => p_1_out(18)
    );
\m_axis_tdata[18]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => x(0),
      I2 => y_odd,
      I3 => left_pixel(4),
      O => \m_axis_tdata[18]_i_2_n_0\
    );
\m_axis_tdata[18]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => have_prev_row_reg_n_0,
      I1 => x(0),
      I2 => s_axis_tuser,
      I3 => y_odd,
      I4 => up_left_pixel(4),
      O => \m_axis_tdata[18]_i_3_n_0\
    );
\m_axis_tdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(3),
      I1 => \m_axis_tdata[23]_i_4_n_0\,
      I2 => \m_axis_tdata[19]_i_2_n_0\,
      I3 => \m_axis_tdata[19]_i_3_n_0\,
      I4 => up(5),
      I5 => \m_axis_tdata[23]_i_7_n_0\,
      O => p_1_out(19)
    );
\m_axis_tdata[19]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => x(0),
      I2 => y_odd,
      I3 => left_pixel(5),
      O => \m_axis_tdata[19]_i_2_n_0\
    );
\m_axis_tdata[19]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => have_prev_row_reg_n_0,
      I1 => x(0),
      I2 => s_axis_tuser,
      I3 => y_odd,
      I4 => up_left_pixel(5),
      O => \m_axis_tdata[19]_i_3_n_0\
    );
\m_axis_tdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => up(3),
      I2 => \m_axis_tdata[7]_i_3_n_0\,
      I3 => left_pixel(3),
      I4 => s_axis_tdata(1),
      I5 => \m_axis_tdata[7]_i_4_n_0\,
      O => p_1_out(1)
    );
\m_axis_tdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(4),
      I1 => \m_axis_tdata[23]_i_4_n_0\,
      I2 => \m_axis_tdata[20]_i_2_n_0\,
      I3 => \m_axis_tdata[20]_i_3_n_0\,
      I4 => up(6),
      I5 => \m_axis_tdata[23]_i_7_n_0\,
      O => p_1_out(20)
    );
\m_axis_tdata[20]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => x(0),
      I2 => y_odd,
      I3 => left_pixel(6),
      O => \m_axis_tdata[20]_i_2_n_0\
    );
\m_axis_tdata[20]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => have_prev_row_reg_n_0,
      I1 => x(0),
      I2 => s_axis_tuser,
      I3 => y_odd,
      I4 => up_left_pixel(6),
      O => \m_axis_tdata[20]_i_3_n_0\
    );
\m_axis_tdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(5),
      I1 => \m_axis_tdata[23]_i_4_n_0\,
      I2 => \m_axis_tdata[21]_i_2_n_0\,
      I3 => \m_axis_tdata[21]_i_3_n_0\,
      I4 => up(7),
      I5 => \m_axis_tdata[23]_i_7_n_0\,
      O => p_1_out(21)
    );
\m_axis_tdata[21]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => x(0),
      I2 => y_odd,
      I3 => left_pixel(7),
      O => \m_axis_tdata[21]_i_2_n_0\
    );
\m_axis_tdata[21]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => have_prev_row_reg_n_0,
      I1 => x(0),
      I2 => s_axis_tuser,
      I3 => y_odd,
      I4 => up_left_pixel(7),
      O => \m_axis_tdata[21]_i_3_n_0\
    );
\m_axis_tdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(6),
      I1 => \m_axis_tdata[23]_i_4_n_0\,
      I2 => \m_axis_tdata[22]_i_2_n_0\,
      I3 => \m_axis_tdata[22]_i_3_n_0\,
      I4 => up(8),
      I5 => \m_axis_tdata[23]_i_7_n_0\,
      O => p_1_out(22)
    );
\m_axis_tdata[22]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => x(0),
      I2 => y_odd,
      I3 => left_pixel(8),
      O => \m_axis_tdata[22]_i_2_n_0\
    );
\m_axis_tdata[22]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => have_prev_row_reg_n_0,
      I1 => x(0),
      I2 => s_axis_tuser,
      I3 => y_odd,
      I4 => up_left_pixel(8),
      O => \m_axis_tdata[22]_i_3_n_0\
    );
\m_axis_tdata[23]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => p_0_in
    );
\m_axis_tdata[23]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D0"
    )
        port map (
      I0 => \^m_axis_tvalid_reg_0\,
      I1 => m_axis_tready,
      I2 => s_axis_tvalid,
      O => \m_axis_tdata[23]_i_2_n_0\
    );
\m_axis_tdata[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(7),
      I1 => \m_axis_tdata[23]_i_4_n_0\,
      I2 => \m_axis_tdata[23]_i_5_n_0\,
      I3 => \m_axis_tdata[23]_i_6_n_0\,
      I4 => up(9),
      I5 => \m_axis_tdata[23]_i_7_n_0\,
      O => p_1_out(23)
    );
\m_axis_tdata[23]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF1D"
    )
        port map (
      I0 => have_prev_row_reg_n_0,
      I1 => y_odd,
      I2 => x(0),
      I3 => s_axis_tuser,
      O => \m_axis_tdata[23]_i_4_n_0\
    );
\m_axis_tdata[23]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => x(0),
      I2 => y_odd,
      I3 => left_pixel(9),
      O => \m_axis_tdata[23]_i_5_n_0\
    );
\m_axis_tdata[23]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => have_prev_row_reg_n_0,
      I1 => x(0),
      I2 => s_axis_tuser,
      I3 => y_odd,
      I4 => up_left_pixel(9),
      O => \m_axis_tdata[23]_i_6_n_0\
    );
\m_axis_tdata[23]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => y_odd,
      I1 => x(0),
      I2 => s_axis_tuser,
      I3 => have_prev_row_reg_n_0,
      O => \m_axis_tdata[23]_i_7_n_0\
    );
\m_axis_tdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => up(4),
      I2 => \m_axis_tdata[7]_i_3_n_0\,
      I3 => left_pixel(4),
      I4 => s_axis_tdata(2),
      I5 => \m_axis_tdata[7]_i_4_n_0\,
      O => p_1_out(2)
    );
\m_axis_tdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => up(5),
      I2 => \m_axis_tdata[7]_i_3_n_0\,
      I3 => left_pixel(5),
      I4 => s_axis_tdata(3),
      I5 => \m_axis_tdata[7]_i_4_n_0\,
      O => p_1_out(3)
    );
\m_axis_tdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => up(6),
      I2 => \m_axis_tdata[7]_i_3_n_0\,
      I3 => left_pixel(6),
      I4 => s_axis_tdata(4),
      I5 => \m_axis_tdata[7]_i_4_n_0\,
      O => p_1_out(4)
    );
\m_axis_tdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => up(7),
      I2 => \m_axis_tdata[7]_i_3_n_0\,
      I3 => left_pixel(7),
      I4 => s_axis_tdata(5),
      I5 => \m_axis_tdata[7]_i_4_n_0\,
      O => p_1_out(5)
    );
\m_axis_tdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => up(8),
      I2 => \m_axis_tdata[7]_i_3_n_0\,
      I3 => left_pixel(8),
      I4 => s_axis_tdata(6),
      I5 => \m_axis_tdata[7]_i_4_n_0\,
      O => p_1_out(6)
    );
\m_axis_tdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => up(9),
      I2 => \m_axis_tdata[7]_i_3_n_0\,
      I3 => left_pixel(9),
      I4 => s_axis_tdata(7),
      I5 => \m_axis_tdata[7]_i_4_n_0\,
      O => p_1_out(7)
    );
\m_axis_tdata[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => x(0),
      I2 => have_prev_row_reg_n_0,
      I3 => y_odd,
      O => \m_axis_tdata[7]_i_2_n_0\
    );
\m_axis_tdata[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => x(0),
      I1 => s_axis_tuser,
      I2 => y_odd,
      O => \m_axis_tdata[7]_i_3_n_0\
    );
\m_axis_tdata[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFC7"
    )
        port map (
      I0 => have_prev_row_reg_n_0,
      I1 => y_odd,
      I2 => x(0),
      I3 => s_axis_tuser,
      O => \m_axis_tdata[7]_i_4_n_0\
    );
\m_axis_tdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(0),
      I1 => \m_axis_tdata[15]_i_2_n_0\,
      I2 => \m_axis_tdata[8]_i_2_n_0\,
      I3 => \m_axis_tdata[8]_i_3_n_0\,
      I4 => up(2),
      I5 => \m_axis_tdata[15]_i_5_n_0\,
      O => p_1_out(8)
    );
\m_axis_tdata[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[15]_i_8_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => left_pixel(2),
      O => \m_axis_tdata[8]_i_2_n_0\
    );
\m_axis_tdata[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => up_left_pixel(2),
      O => \m_axis_tdata[8]_i_3_n_0\
    );
\m_axis_tdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8FFF8FFF8"
    )
        port map (
      I0 => s_axis_tdata(1),
      I1 => \m_axis_tdata[15]_i_2_n_0\,
      I2 => \m_axis_tdata[9]_i_2_n_0\,
      I3 => \m_axis_tdata[9]_i_3_n_0\,
      I4 => up(3),
      I5 => \m_axis_tdata[15]_i_5_n_0\,
      O => p_1_out(9)
    );
\m_axis_tdata[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[15]_i_8_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => left_pixel(3),
      O => \m_axis_tdata[9]_i_2_n_0\
    );
\m_axis_tdata[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA800000000"
    )
        port map (
      I0 => \m_axis_tdata[7]_i_2_n_0\,
      I1 => \m_axis_tdata[15]_i_9_n_0\,
      I2 => \m_axis_tdata[15]_i_10_n_0\,
      I3 => x(3),
      I4 => x(4),
      I5 => up_left_pixel(3),
      O => \m_axis_tdata[9]_i_3_n_0\
    );
\m_axis_tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(0),
      Q => m_axis_tdata(0),
      R => p_0_in
    );
\m_axis_tdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(10),
      Q => m_axis_tdata(10),
      R => p_0_in
    );
\m_axis_tdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(11),
      Q => m_axis_tdata(11),
      R => p_0_in
    );
\m_axis_tdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(12),
      Q => m_axis_tdata(12),
      R => p_0_in
    );
\m_axis_tdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(13),
      Q => m_axis_tdata(13),
      R => p_0_in
    );
\m_axis_tdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(14),
      Q => m_axis_tdata(14),
      R => p_0_in
    );
\m_axis_tdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(15),
      Q => m_axis_tdata(15),
      R => p_0_in
    );
\m_axis_tdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(16),
      Q => m_axis_tdata(16),
      R => p_0_in
    );
\m_axis_tdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(17),
      Q => m_axis_tdata(17),
      R => p_0_in
    );
\m_axis_tdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(18),
      Q => m_axis_tdata(18),
      R => p_0_in
    );
\m_axis_tdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(19),
      Q => m_axis_tdata(19),
      R => p_0_in
    );
\m_axis_tdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(1),
      Q => m_axis_tdata(1),
      R => p_0_in
    );
\m_axis_tdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(20),
      Q => m_axis_tdata(20),
      R => p_0_in
    );
\m_axis_tdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(21),
      Q => m_axis_tdata(21),
      R => p_0_in
    );
\m_axis_tdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(22),
      Q => m_axis_tdata(22),
      R => p_0_in
    );
\m_axis_tdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(23),
      Q => m_axis_tdata(23),
      R => p_0_in
    );
\m_axis_tdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(2),
      Q => m_axis_tdata(2),
      R => p_0_in
    );
\m_axis_tdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(3),
      Q => m_axis_tdata(3),
      R => p_0_in
    );
\m_axis_tdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(4),
      Q => m_axis_tdata(4),
      R => p_0_in
    );
\m_axis_tdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(5),
      Q => m_axis_tdata(5),
      R => p_0_in
    );
\m_axis_tdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(6),
      Q => m_axis_tdata(6),
      R => p_0_in
    );
\m_axis_tdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(7),
      Q => m_axis_tdata(7),
      R => p_0_in
    );
\m_axis_tdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(8),
      Q => m_axis_tdata(8),
      R => p_0_in
    );
\m_axis_tdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_1_out(9),
      Q => m_axis_tdata(9),
      R => p_0_in
    );
m_axis_tlast_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => s_axis_tlast,
      Q => m_axis_tlast,
      R => p_0_in
    );
m_axis_tuser_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => s_axis_tuser,
      Q => m_axis_tuser,
      R => p_0_in
    );
m_axis_tvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F200"
    )
        port map (
      I0 => \^m_axis_tvalid_reg_0\,
      I1 => m_axis_tready,
      I2 => s_axis_tvalid,
      I3 => aresetn,
      O => m_axis_tvalid_i_1_n_0
    );
m_axis_tvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => m_axis_tvalid_i_1_n_0,
      Q => \^m_axis_tvalid_reg_0\,
      R => '0'
    );
\prev_row_reg_0_127_0_0__1\: unisim.vcomponents.RAM128X1S
     port map (
      A0 => col(0),
      A1 => col(1),
      A2 => col(2),
      A3 => col(3),
      A4 => col(4),
      A5 => col(5),
      A6 => col(6),
      D => s_axis_tdata(0),
      O => \prev_row_reg_0_127_0_0__1_n_0\,
      WCLK => aclk,
      WE => \prev_row_reg_0_127_0_0__1_i_1_n_0\
    );
\prev_row_reg_0_127_0_0__1_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88080000"
    )
        port map (
      I0 => \prev_row_reg_0_127_0_0__1_i_2_n_0\,
      I1 => aresetn,
      I2 => \^m_axis_tvalid_reg_0\,
      I3 => m_axis_tready,
      I4 => s_axis_tvalid,
      O => \prev_row_reg_0_127_0_0__1_i_1_n_0\
    );
\prev_row_reg_0_127_0_0__1_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => x(7),
      I1 => x(10),
      I2 => x(9),
      I3 => s_axis_tuser,
      I4 => x(8),
      O => \prev_row_reg_0_127_0_0__1_i_2_n_0\
    );
\prev_row_reg_0_127_0_0__2\: unisim.vcomponents.RAM128X1S
     port map (
      A0 => col(0),
      A1 => col(1),
      A2 => col(2),
      A3 => col(3),
      A4 => col(4),
      A5 => col(5),
      A6 => col(6),
      D => s_axis_tdata(1),
      O => \prev_row_reg_0_127_0_0__2_n_0\,
      WCLK => aclk,
      WE => \prev_row_reg_0_127_0_0__1_i_1_n_0\
    );
\prev_row_reg_0_127_0_0__3\: unisim.vcomponents.RAM128X1S
     port map (
      A0 => col(0),
      A1 => col(1),
      A2 => col(2),
      A3 => col(3),
      A4 => col(4),
      A5 => col(5),
      A6 => col(6),
      D => s_axis_tdata(2),
      O => \prev_row_reg_0_127_0_0__3_n_0\,
      WCLK => aclk,
      WE => \prev_row_reg_0_127_0_0__1_i_1_n_0\
    );
\prev_row_reg_0_127_0_0__4\: unisim.vcomponents.RAM128X1S
     port map (
      A0 => col(0),
      A1 => col(1),
      A2 => col(2),
      A3 => col(3),
      A4 => col(4),
      A5 => col(5),
      A6 => col(6),
      D => s_axis_tdata(3),
      O => \prev_row_reg_0_127_0_0__4_n_0\,
      WCLK => aclk,
      WE => \prev_row_reg_0_127_0_0__1_i_1_n_0\
    );
\prev_row_reg_0_127_0_0__5\: unisim.vcomponents.RAM128X1S
     port map (
      A0 => col(0),
      A1 => col(1),
      A2 => col(2),
      A3 => col(3),
      A4 => col(4),
      A5 => col(5),
      A6 => col(6),
      D => s_axis_tdata(4),
      O => \prev_row_reg_0_127_0_0__5_n_0\,
      WCLK => aclk,
      WE => \prev_row_reg_0_127_0_0__1_i_1_n_0\
    );
\prev_row_reg_0_127_0_0__6\: unisim.vcomponents.RAM128X1S
     port map (
      A0 => col(0),
      A1 => col(1),
      A2 => col(2),
      A3 => col(3),
      A4 => col(4),
      A5 => col(5),
      A6 => col(6),
      D => s_axis_tdata(5),
      O => \prev_row_reg_0_127_0_0__6_n_0\,
      WCLK => aclk,
      WE => \prev_row_reg_0_127_0_0__1_i_1_n_0\
    );
\prev_row_reg_0_127_0_0__7\: unisim.vcomponents.RAM128X1S
     port map (
      A0 => col(0),
      A1 => col(1),
      A2 => col(2),
      A3 => col(3),
      A4 => col(4),
      A5 => col(5),
      A6 => col(6),
      D => s_axis_tdata(6),
      O => \prev_row_reg_0_127_0_0__7_n_0\,
      WCLK => aclk,
      WE => \prev_row_reg_0_127_0_0__1_i_1_n_0\
    );
\prev_row_reg_0_127_0_0__8\: unisim.vcomponents.RAM128X1S
     port map (
      A0 => col(0),
      A1 => col(1),
      A2 => col(2),
      A3 => col(3),
      A4 => col(4),
      A5 => col(5),
      A6 => col(6),
      D => s_axis_tdata(7),
      O => \prev_row_reg_0_127_0_0__8_n_0\,
      WCLK => aclk,
      WE => \prev_row_reg_0_127_0_0__1_i_1_n_0\
    );
prev_row_reg_0_255_2_2: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(0),
      O => prev_row_reg_0_255_2_2_n_0,
      WCLK => aclk,
      WE => prev_row_reg_0_255_2_2_i_1_n_0
    );
prev_row_reg_0_255_2_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCD000000000000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => aresetn,
      I5 => \m_axis_tdata[23]_i_2_n_0\,
      O => prev_row_reg_0_255_2_2_i_1_n_0
    );
prev_row_reg_0_255_2_2_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => x(7),
      I1 => s_axis_tuser,
      O => col(7)
    );
prev_row_reg_0_255_2_2_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => x(6),
      I1 => s_axis_tuser,
      O => col(6)
    );
prev_row_reg_0_255_2_2_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => x(5),
      I1 => s_axis_tuser,
      O => col(5)
    );
prev_row_reg_0_255_2_2_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => x(4),
      I1 => s_axis_tuser,
      O => col(4)
    );
prev_row_reg_0_255_2_2_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => x(3),
      I1 => s_axis_tuser,
      O => col(3)
    );
prev_row_reg_0_255_2_2_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => x(2),
      I1 => s_axis_tuser,
      O => col(2)
    );
prev_row_reg_0_255_2_2_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => x(1),
      I1 => s_axis_tuser,
      O => col(1)
    );
prev_row_reg_0_255_2_2_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => x(0),
      I1 => s_axis_tuser,
      O => col(0)
    );
prev_row_reg_0_255_3_3: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(1),
      O => prev_row_reg_0_255_3_3_n_0,
      WCLK => aclk,
      WE => prev_row_reg_0_255_2_2_i_1_n_0
    );
prev_row_reg_0_255_4_4: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(2),
      O => prev_row_reg_0_255_4_4_n_0,
      WCLK => aclk,
      WE => prev_row_reg_0_255_2_2_i_1_n_0
    );
prev_row_reg_0_255_5_5: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(3),
      O => prev_row_reg_0_255_5_5_n_0,
      WCLK => aclk,
      WE => prev_row_reg_0_255_2_2_i_1_n_0
    );
prev_row_reg_0_255_6_6: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(4),
      O => prev_row_reg_0_255_6_6_n_0,
      WCLK => aclk,
      WE => prev_row_reg_0_255_2_2_i_1_n_0
    );
prev_row_reg_0_255_7_7: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(5),
      O => prev_row_reg_0_255_7_7_n_0,
      WCLK => aclk,
      WE => prev_row_reg_0_255_2_2_i_1_n_0
    );
prev_row_reg_0_255_8_8: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(6),
      O => prev_row_reg_0_255_8_8_n_0,
      WCLK => aclk,
      WE => prev_row_reg_0_255_2_2_i_1_n_0
    );
prev_row_reg_0_255_9_9: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(7),
      O => prev_row_reg_0_255_9_9_n_0,
      WCLK => aclk,
      WE => prev_row_reg_0_255_2_2_i_1_n_0
    );
prev_row_reg_1024_1279_2_2: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(0),
      O => prev_row_reg_1024_1279_2_2_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1024_1279_2_2_i_1_n_0
    );
prev_row_reg_1024_1279_2_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => aresetn,
      I5 => \m_axis_tdata[23]_i_2_n_0\,
      O => prev_row_reg_1024_1279_2_2_i_1_n_0
    );
prev_row_reg_1024_1279_3_3: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(1),
      O => prev_row_reg_1024_1279_3_3_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1024_1279_2_2_i_1_n_0
    );
prev_row_reg_1024_1279_4_4: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(2),
      O => prev_row_reg_1024_1279_4_4_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1024_1279_2_2_i_1_n_0
    );
prev_row_reg_1024_1279_5_5: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(3),
      O => prev_row_reg_1024_1279_5_5_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1024_1279_2_2_i_1_n_0
    );
prev_row_reg_1024_1279_6_6: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(4),
      O => prev_row_reg_1024_1279_6_6_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1024_1279_2_2_i_1_n_0
    );
prev_row_reg_1024_1279_7_7: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(5),
      O => prev_row_reg_1024_1279_7_7_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1024_1279_2_2_i_1_n_0
    );
prev_row_reg_1024_1279_8_8: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(6),
      O => prev_row_reg_1024_1279_8_8_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1024_1279_2_2_i_1_n_0
    );
prev_row_reg_1024_1279_9_9: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(7),
      O => prev_row_reg_1024_1279_9_9_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1024_1279_2_2_i_1_n_0
    );
prev_row_reg_1280_1535_2_2: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(0),
      O => prev_row_reg_1280_1535_2_2_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1280_1535_2_2_i_1_n_0
    );
prev_row_reg_1280_1535_2_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020000000000000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => aresetn,
      I5 => \m_axis_tdata[23]_i_2_n_0\,
      O => prev_row_reg_1280_1535_2_2_i_1_n_0
    );
prev_row_reg_1280_1535_3_3: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(1),
      O => prev_row_reg_1280_1535_3_3_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1280_1535_2_2_i_1_n_0
    );
prev_row_reg_1280_1535_4_4: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(2),
      O => prev_row_reg_1280_1535_4_4_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1280_1535_2_2_i_1_n_0
    );
prev_row_reg_1280_1535_5_5: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(3),
      O => prev_row_reg_1280_1535_5_5_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1280_1535_2_2_i_1_n_0
    );
prev_row_reg_1280_1535_6_6: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(4),
      O => prev_row_reg_1280_1535_6_6_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1280_1535_2_2_i_1_n_0
    );
prev_row_reg_1280_1535_7_7: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(5),
      O => prev_row_reg_1280_1535_7_7_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1280_1535_2_2_i_1_n_0
    );
prev_row_reg_1280_1535_8_8: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(6),
      O => prev_row_reg_1280_1535_8_8_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1280_1535_2_2_i_1_n_0
    );
prev_row_reg_1280_1535_9_9: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(7),
      O => prev_row_reg_1280_1535_9_9_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1280_1535_2_2_i_1_n_0
    );
prev_row_reg_1536_1791_2_2: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(0),
      O => prev_row_reg_1536_1791_2_2_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1536_1791_2_2_i_1_n_0
    );
prev_row_reg_1536_1791_2_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020000000000000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => aresetn,
      I5 => \m_axis_tdata[23]_i_2_n_0\,
      O => prev_row_reg_1536_1791_2_2_i_1_n_0
    );
prev_row_reg_1536_1791_3_3: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(1),
      O => prev_row_reg_1536_1791_3_3_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1536_1791_2_2_i_1_n_0
    );
prev_row_reg_1536_1791_4_4: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(2),
      O => prev_row_reg_1536_1791_4_4_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1536_1791_2_2_i_1_n_0
    );
prev_row_reg_1536_1791_5_5: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(3),
      O => prev_row_reg_1536_1791_5_5_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1536_1791_2_2_i_1_n_0
    );
prev_row_reg_1536_1791_6_6: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(4),
      O => prev_row_reg_1536_1791_6_6_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1536_1791_2_2_i_1_n_0
    );
prev_row_reg_1536_1791_7_7: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(5),
      O => prev_row_reg_1536_1791_7_7_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1536_1791_2_2_i_1_n_0
    );
prev_row_reg_1536_1791_8_8: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(6),
      O => prev_row_reg_1536_1791_8_8_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1536_1791_2_2_i_1_n_0
    );
prev_row_reg_1536_1791_9_9: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(7),
      O => prev_row_reg_1536_1791_9_9_n_0,
      WCLK => aclk,
      WE => prev_row_reg_1536_1791_2_2_i_1_n_0
    );
prev_row_reg_256_511_2_2: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(0),
      O => prev_row_reg_256_511_2_2_n_0,
      WCLK => aclk,
      WE => prev_row_reg_256_511_2_2_i_1_n_0
    );
prev_row_reg_256_511_2_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => aresetn,
      I5 => \m_axis_tdata[23]_i_2_n_0\,
      O => prev_row_reg_256_511_2_2_i_1_n_0
    );
prev_row_reg_256_511_3_3: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(1),
      O => prev_row_reg_256_511_3_3_n_0,
      WCLK => aclk,
      WE => prev_row_reg_256_511_2_2_i_1_n_0
    );
prev_row_reg_256_511_4_4: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(2),
      O => prev_row_reg_256_511_4_4_n_0,
      WCLK => aclk,
      WE => prev_row_reg_256_511_2_2_i_1_n_0
    );
prev_row_reg_256_511_5_5: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(3),
      O => prev_row_reg_256_511_5_5_n_0,
      WCLK => aclk,
      WE => prev_row_reg_256_511_2_2_i_1_n_0
    );
prev_row_reg_256_511_6_6: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(4),
      O => prev_row_reg_256_511_6_6_n_0,
      WCLK => aclk,
      WE => prev_row_reg_256_511_2_2_i_1_n_0
    );
prev_row_reg_256_511_7_7: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(5),
      O => prev_row_reg_256_511_7_7_n_0,
      WCLK => aclk,
      WE => prev_row_reg_256_511_2_2_i_1_n_0
    );
prev_row_reg_256_511_8_8: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(6),
      O => prev_row_reg_256_511_8_8_n_0,
      WCLK => aclk,
      WE => prev_row_reg_256_511_2_2_i_1_n_0
    );
prev_row_reg_256_511_9_9: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(7),
      O => prev_row_reg_256_511_9_9_n_0,
      WCLK => aclk,
      WE => prev_row_reg_256_511_2_2_i_1_n_0
    );
prev_row_reg_512_767_2_2: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(0),
      O => prev_row_reg_512_767_2_2_n_0,
      WCLK => aclk,
      WE => prev_row_reg_512_767_2_2_i_1_n_0
    );
prev_row_reg_512_767_2_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => aresetn,
      I5 => \m_axis_tdata[23]_i_2_n_0\,
      O => prev_row_reg_512_767_2_2_i_1_n_0
    );
prev_row_reg_512_767_3_3: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(1),
      O => prev_row_reg_512_767_3_3_n_0,
      WCLK => aclk,
      WE => prev_row_reg_512_767_2_2_i_1_n_0
    );
prev_row_reg_512_767_4_4: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(2),
      O => prev_row_reg_512_767_4_4_n_0,
      WCLK => aclk,
      WE => prev_row_reg_512_767_2_2_i_1_n_0
    );
prev_row_reg_512_767_5_5: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(3),
      O => prev_row_reg_512_767_5_5_n_0,
      WCLK => aclk,
      WE => prev_row_reg_512_767_2_2_i_1_n_0
    );
prev_row_reg_512_767_6_6: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(4),
      O => prev_row_reg_512_767_6_6_n_0,
      WCLK => aclk,
      WE => prev_row_reg_512_767_2_2_i_1_n_0
    );
prev_row_reg_512_767_7_7: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(5),
      O => prev_row_reg_512_767_7_7_n_0,
      WCLK => aclk,
      WE => prev_row_reg_512_767_2_2_i_1_n_0
    );
prev_row_reg_512_767_8_8: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(6),
      O => prev_row_reg_512_767_8_8_n_0,
      WCLK => aclk,
      WE => prev_row_reg_512_767_2_2_i_1_n_0
    );
prev_row_reg_512_767_9_9: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(7),
      O => prev_row_reg_512_767_9_9_n_0,
      WCLK => aclk,
      WE => prev_row_reg_512_767_2_2_i_1_n_0
    );
prev_row_reg_768_1023_2_2: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(0),
      O => prev_row_reg_768_1023_2_2_n_0,
      WCLK => aclk,
      WE => prev_row_reg_768_1023_2_2_i_1_n_0
    );
prev_row_reg_768_1023_2_2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000000000000000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => aresetn,
      I5 => \m_axis_tdata[23]_i_2_n_0\,
      O => prev_row_reg_768_1023_2_2_i_1_n_0
    );
prev_row_reg_768_1023_3_3: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(1),
      O => prev_row_reg_768_1023_3_3_n_0,
      WCLK => aclk,
      WE => prev_row_reg_768_1023_2_2_i_1_n_0
    );
prev_row_reg_768_1023_4_4: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(2),
      O => prev_row_reg_768_1023_4_4_n_0,
      WCLK => aclk,
      WE => prev_row_reg_768_1023_2_2_i_1_n_0
    );
prev_row_reg_768_1023_5_5: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(3),
      O => prev_row_reg_768_1023_5_5_n_0,
      WCLK => aclk,
      WE => prev_row_reg_768_1023_2_2_i_1_n_0
    );
prev_row_reg_768_1023_6_6: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(4),
      O => prev_row_reg_768_1023_6_6_n_0,
      WCLK => aclk,
      WE => prev_row_reg_768_1023_2_2_i_1_n_0
    );
prev_row_reg_768_1023_7_7: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(5),
      O => prev_row_reg_768_1023_7_7_n_0,
      WCLK => aclk,
      WE => prev_row_reg_768_1023_2_2_i_1_n_0
    );
prev_row_reg_768_1023_8_8: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(6),
      O => prev_row_reg_768_1023_8_8_n_0,
      WCLK => aclk,
      WE => prev_row_reg_768_1023_2_2_i_1_n_0
    );
prev_row_reg_768_1023_9_9: unisim.vcomponents.RAM256X1S
     port map (
      A(7 downto 0) => col(7 downto 0),
      D => s_axis_tdata(7),
      O => prev_row_reg_768_1023_9_9_n_0,
      WCLK => aclk,
      WE => prev_row_reg_768_1023_2_2_i_1_n_0
    );
s_axis_tready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => m_axis_tready,
      I1 => \^m_axis_tvalid_reg_0\,
      O => s_axis_tready
    );
\up_left_pixel[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \up_left_pixel[2]_i_2_n_0\,
      I1 => \up_left_pixel[2]_i_3_n_0\,
      I2 => \up_left_pixel[2]_i_4_n_0\,
      I3 => \up_left_pixel[2]_i_5_n_0\,
      I4 => \up_left_pixel[2]_i_6_n_0\,
      I5 => \up_left_pixel[2]_i_7_n_0\,
      O => up(2)
    );
\up_left_pixel[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_1536_1791_2_2_n_0,
      O => \up_left_pixel[2]_i_2_n_0\
    );
\up_left_pixel[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => x(8),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(10),
      I4 => x(7),
      I5 => \prev_row_reg_0_127_0_0__1_n_0\,
      O => \up_left_pixel[2]_i_3_n_0\
    );
\up_left_pixel[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC0000CCCC0A0C"
    )
        port map (
      I0 => prev_row_reg_256_511_2_2_n_0,
      I1 => prev_row_reg_0_255_2_2_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[2]_i_4_n_0\
    );
\up_left_pixel[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_512_767_2_2_n_0,
      O => \up_left_pixel[2]_i_5_n_0\
    );
\up_left_pixel[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => prev_row_reg_1024_1279_2_2_n_0,
      I1 => prev_row_reg_768_1023_2_2_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[2]_i_6_n_0\
    );
\up_left_pixel[2]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => prev_row_reg_1280_1535_2_2_n_0,
      O => \up_left_pixel[2]_i_7_n_0\
    );
\up_left_pixel[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \up_left_pixel[3]_i_2_n_0\,
      I1 => \up_left_pixel[3]_i_3_n_0\,
      I2 => \up_left_pixel[3]_i_4_n_0\,
      I3 => \up_left_pixel[3]_i_5_n_0\,
      I4 => \up_left_pixel[3]_i_6_n_0\,
      I5 => \up_left_pixel[3]_i_7_n_0\,
      O => up(3)
    );
\up_left_pixel[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_1536_1791_3_3_n_0,
      O => \up_left_pixel[3]_i_2_n_0\
    );
\up_left_pixel[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => x(8),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(10),
      I4 => x(7),
      I5 => \prev_row_reg_0_127_0_0__2_n_0\,
      O => \up_left_pixel[3]_i_3_n_0\
    );
\up_left_pixel[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC0000CCCC0A0C"
    )
        port map (
      I0 => prev_row_reg_256_511_3_3_n_0,
      I1 => prev_row_reg_0_255_3_3_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[3]_i_4_n_0\
    );
\up_left_pixel[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_512_767_3_3_n_0,
      O => \up_left_pixel[3]_i_5_n_0\
    );
\up_left_pixel[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => prev_row_reg_1024_1279_3_3_n_0,
      I1 => prev_row_reg_768_1023_3_3_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[3]_i_6_n_0\
    );
\up_left_pixel[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => prev_row_reg_1280_1535_3_3_n_0,
      O => \up_left_pixel[3]_i_7_n_0\
    );
\up_left_pixel[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \up_left_pixel[4]_i_2_n_0\,
      I1 => \up_left_pixel[4]_i_3_n_0\,
      I2 => \up_left_pixel[4]_i_4_n_0\,
      I3 => \up_left_pixel[4]_i_5_n_0\,
      I4 => \up_left_pixel[4]_i_6_n_0\,
      I5 => \up_left_pixel[4]_i_7_n_0\,
      O => up(4)
    );
\up_left_pixel[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_1536_1791_4_4_n_0,
      O => \up_left_pixel[4]_i_2_n_0\
    );
\up_left_pixel[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => x(8),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(10),
      I4 => x(7),
      I5 => \prev_row_reg_0_127_0_0__3_n_0\,
      O => \up_left_pixel[4]_i_3_n_0\
    );
\up_left_pixel[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC0000CCCC0A0C"
    )
        port map (
      I0 => prev_row_reg_256_511_4_4_n_0,
      I1 => prev_row_reg_0_255_4_4_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[4]_i_4_n_0\
    );
\up_left_pixel[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_512_767_4_4_n_0,
      O => \up_left_pixel[4]_i_5_n_0\
    );
\up_left_pixel[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => prev_row_reg_1024_1279_4_4_n_0,
      I1 => prev_row_reg_768_1023_4_4_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[4]_i_6_n_0\
    );
\up_left_pixel[4]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => prev_row_reg_1280_1535_4_4_n_0,
      O => \up_left_pixel[4]_i_7_n_0\
    );
\up_left_pixel[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \up_left_pixel[5]_i_2_n_0\,
      I1 => \up_left_pixel[5]_i_3_n_0\,
      I2 => \up_left_pixel[5]_i_4_n_0\,
      I3 => \up_left_pixel[5]_i_5_n_0\,
      I4 => \up_left_pixel[5]_i_6_n_0\,
      I5 => \up_left_pixel[5]_i_7_n_0\,
      O => up(5)
    );
\up_left_pixel[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_1536_1791_5_5_n_0,
      O => \up_left_pixel[5]_i_2_n_0\
    );
\up_left_pixel[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => x(8),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(10),
      I4 => x(7),
      I5 => \prev_row_reg_0_127_0_0__4_n_0\,
      O => \up_left_pixel[5]_i_3_n_0\
    );
\up_left_pixel[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC0000CCCC0A0C"
    )
        port map (
      I0 => prev_row_reg_256_511_5_5_n_0,
      I1 => prev_row_reg_0_255_5_5_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[5]_i_4_n_0\
    );
\up_left_pixel[5]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_512_767_5_5_n_0,
      O => \up_left_pixel[5]_i_5_n_0\
    );
\up_left_pixel[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => prev_row_reg_1024_1279_5_5_n_0,
      I1 => prev_row_reg_768_1023_5_5_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[5]_i_6_n_0\
    );
\up_left_pixel[5]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => prev_row_reg_1280_1535_5_5_n_0,
      O => \up_left_pixel[5]_i_7_n_0\
    );
\up_left_pixel[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \up_left_pixel[6]_i_2_n_0\,
      I1 => \up_left_pixel[6]_i_3_n_0\,
      I2 => \up_left_pixel[6]_i_4_n_0\,
      I3 => \up_left_pixel[6]_i_5_n_0\,
      I4 => \up_left_pixel[6]_i_6_n_0\,
      I5 => \up_left_pixel[6]_i_7_n_0\,
      O => up(6)
    );
\up_left_pixel[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_1536_1791_6_6_n_0,
      O => \up_left_pixel[6]_i_2_n_0\
    );
\up_left_pixel[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => x(8),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(10),
      I4 => x(7),
      I5 => \prev_row_reg_0_127_0_0__5_n_0\,
      O => \up_left_pixel[6]_i_3_n_0\
    );
\up_left_pixel[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC0000CCCC0A0C"
    )
        port map (
      I0 => prev_row_reg_256_511_6_6_n_0,
      I1 => prev_row_reg_0_255_6_6_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[6]_i_4_n_0\
    );
\up_left_pixel[6]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_512_767_6_6_n_0,
      O => \up_left_pixel[6]_i_5_n_0\
    );
\up_left_pixel[6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => prev_row_reg_1024_1279_6_6_n_0,
      I1 => prev_row_reg_768_1023_6_6_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[6]_i_6_n_0\
    );
\up_left_pixel[6]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => prev_row_reg_1280_1535_6_6_n_0,
      O => \up_left_pixel[6]_i_7_n_0\
    );
\up_left_pixel[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \up_left_pixel[7]_i_2_n_0\,
      I1 => \up_left_pixel[7]_i_3_n_0\,
      I2 => \up_left_pixel[7]_i_4_n_0\,
      I3 => \up_left_pixel[7]_i_5_n_0\,
      I4 => \up_left_pixel[7]_i_6_n_0\,
      I5 => \up_left_pixel[7]_i_7_n_0\,
      O => up(7)
    );
\up_left_pixel[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_1536_1791_7_7_n_0,
      O => \up_left_pixel[7]_i_2_n_0\
    );
\up_left_pixel[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => x(8),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(10),
      I4 => x(7),
      I5 => \prev_row_reg_0_127_0_0__6_n_0\,
      O => \up_left_pixel[7]_i_3_n_0\
    );
\up_left_pixel[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC0000CCCC0A0C"
    )
        port map (
      I0 => prev_row_reg_256_511_7_7_n_0,
      I1 => prev_row_reg_0_255_7_7_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[7]_i_4_n_0\
    );
\up_left_pixel[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_512_767_7_7_n_0,
      O => \up_left_pixel[7]_i_5_n_0\
    );
\up_left_pixel[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => prev_row_reg_1024_1279_7_7_n_0,
      I1 => prev_row_reg_768_1023_7_7_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[7]_i_6_n_0\
    );
\up_left_pixel[7]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => prev_row_reg_1280_1535_7_7_n_0,
      O => \up_left_pixel[7]_i_7_n_0\
    );
\up_left_pixel[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \up_left_pixel[8]_i_2_n_0\,
      I1 => \up_left_pixel[8]_i_3_n_0\,
      I2 => \up_left_pixel[8]_i_4_n_0\,
      I3 => \up_left_pixel[8]_i_5_n_0\,
      I4 => \up_left_pixel[8]_i_6_n_0\,
      I5 => \up_left_pixel[8]_i_7_n_0\,
      O => up(8)
    );
\up_left_pixel[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_1536_1791_8_8_n_0,
      O => \up_left_pixel[8]_i_2_n_0\
    );
\up_left_pixel[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => x(8),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(10),
      I4 => x(7),
      I5 => \prev_row_reg_0_127_0_0__7_n_0\,
      O => \up_left_pixel[8]_i_3_n_0\
    );
\up_left_pixel[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC0000CCCC0A0C"
    )
        port map (
      I0 => prev_row_reg_256_511_8_8_n_0,
      I1 => prev_row_reg_0_255_8_8_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[8]_i_4_n_0\
    );
\up_left_pixel[8]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_512_767_8_8_n_0,
      O => \up_left_pixel[8]_i_5_n_0\
    );
\up_left_pixel[8]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => prev_row_reg_1024_1279_8_8_n_0,
      I1 => prev_row_reg_768_1023_8_8_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[8]_i_6_n_0\
    );
\up_left_pixel[8]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => prev_row_reg_1280_1535_8_8_n_0,
      O => \up_left_pixel[8]_i_7_n_0\
    );
\up_left_pixel[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \up_left_pixel[9]_i_2_n_0\,
      I1 => \up_left_pixel[9]_i_3_n_0\,
      I2 => \up_left_pixel[9]_i_4_n_0\,
      I3 => \up_left_pixel[9]_i_5_n_0\,
      I4 => \up_left_pixel[9]_i_6_n_0\,
      I5 => \up_left_pixel[9]_i_7_n_0\,
      O => up(9)
    );
\up_left_pixel[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_1536_1791_9_9_n_0,
      O => \up_left_pixel[9]_i_2_n_0\
    );
\up_left_pixel[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => x(8),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(10),
      I4 => x(7),
      I5 => \prev_row_reg_0_127_0_0__8_n_0\,
      O => \up_left_pixel[9]_i_3_n_0\
    );
\up_left_pixel[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCC0000CCCC0A0C"
    )
        port map (
      I0 => prev_row_reg_256_511_9_9_n_0,
      I1 => prev_row_reg_0_255_9_9_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[9]_i_4_n_0\
    );
\up_left_pixel[9]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(9),
      I3 => x(8),
      I4 => prev_row_reg_512_767_9_9_n_0,
      O => \up_left_pixel[9]_i_5_n_0\
    );
\up_left_pixel[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000A0000C000"
    )
        port map (
      I0 => prev_row_reg_1024_1279_9_9_n_0,
      I1 => prev_row_reg_768_1023_9_9_n_0,
      I2 => x(9),
      I3 => x(8),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => \up_left_pixel[9]_i_6_n_0\
    );
\up_left_pixel[9]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => x(10),
      I1 => s_axis_tuser,
      I2 => x(8),
      I3 => x(9),
      I4 => prev_row_reg_1280_1535_9_9_n_0,
      O => \up_left_pixel[9]_i_7_n_0\
    );
\up_left_pixel_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => up(2),
      Q => up_left_pixel(2),
      R => p_0_in
    );
\up_left_pixel_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => up(3),
      Q => up_left_pixel(3),
      R => p_0_in
    );
\up_left_pixel_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => up(4),
      Q => up_left_pixel(4),
      R => p_0_in
    );
\up_left_pixel_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => up(5),
      Q => up_left_pixel(5),
      R => p_0_in
    );
\up_left_pixel_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => up(6),
      Q => up_left_pixel(6),
      R => p_0_in
    );
\up_left_pixel_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => up(7),
      Q => up_left_pixel(7),
      R => p_0_in
    );
\up_left_pixel_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => up(8),
      Q => up_left_pixel(8),
      R => p_0_in
    );
\up_left_pixel_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => up(9),
      Q => up_left_pixel(9),
      R => p_0_in
    );
\x[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => s_axis_tuser,
      I1 => x(0),
      O => p_2_in(0)
    );
\x[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A200FFFF"
    )
        port map (
      I0 => s_axis_tlast,
      I1 => \^m_axis_tvalid_reg_0\,
      I2 => m_axis_tready,
      I3 => s_axis_tvalid,
      I4 => aresetn,
      O => \x[10]_i_1_n_0\
    );
\x[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80007FFF80008000"
    )
        port map (
      I0 => \x[10]_i_3_n_0\,
      I1 => x(9),
      I2 => x(8),
      I3 => x(7),
      I4 => s_axis_tuser,
      I5 => x(10),
      O => p_2_in(10)
    );
\x[10]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => x(5),
      I1 => \x[6]_i_2_n_0\,
      I2 => x(6),
      O => \x[10]_i_3_n_0\
    );
\x[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"12"
    )
        port map (
      I0 => x(0),
      I1 => s_axis_tuser,
      I2 => x(1),
      O => \x[1]_i_1_n_0\
    );
\x[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0708"
    )
        port map (
      I0 => x(0),
      I1 => x(1),
      I2 => s_axis_tuser,
      I3 => x(2),
      O => p_2_in(2)
    );
\x[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"007F0080"
    )
        port map (
      I0 => x(2),
      I1 => x(1),
      I2 => x(0),
      I3 => s_axis_tuser,
      I4 => x(3),
      O => p_2_in(3)
    );
\x[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00007FFF00008000"
    )
        port map (
      I0 => x(3),
      I1 => x(0),
      I2 => x(1),
      I3 => x(2),
      I4 => s_axis_tuser,
      I5 => x(4),
      O => p_2_in(4)
    );
\x[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7FFFFF00800000"
    )
        port map (
      I0 => x(4),
      I1 => x(2),
      I2 => x(1),
      I3 => p_2_in(0),
      I4 => x(3),
      I5 => col(5),
      O => p_2_in(5)
    );
\x[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8788"
    )
        port map (
      I0 => x(5),
      I1 => \x[6]_i_2_n_0\,
      I2 => s_axis_tuser,
      I3 => x(6),
      O => p_2_in(6)
    );
\x[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => x(3),
      I1 => s_axis_tuser,
      I2 => x(0),
      I3 => x(1),
      I4 => x(2),
      I5 => x(4),
      O => \x[6]_i_2_n_0\
    );
\x[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \x[10]_i_3_n_0\,
      I1 => s_axis_tuser,
      I2 => x(7),
      O => p_2_in(7)
    );
\x[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8788"
    )
        port map (
      I0 => x(7),
      I1 => \x[10]_i_3_n_0\,
      I2 => s_axis_tuser,
      I3 => x(8),
      O => p_2_in(8)
    );
\x[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"807F8080"
    )
        port map (
      I0 => \x[10]_i_3_n_0\,
      I1 => x(7),
      I2 => x(8),
      I3 => s_axis_tuser,
      I4 => x(9),
      O => p_2_in(9)
    );
\x_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_2_in(0),
      Q => x(0),
      R => \x[10]_i_1_n_0\
    );
\x_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_2_in(10),
      Q => x(10),
      R => \x[10]_i_1_n_0\
    );
\x_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => \x[1]_i_1_n_0\,
      Q => x(1),
      R => \x[10]_i_1_n_0\
    );
\x_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_2_in(2),
      Q => x(2),
      R => \x[10]_i_1_n_0\
    );
\x_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_2_in(3),
      Q => x(3),
      R => \x[10]_i_1_n_0\
    );
\x_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_2_in(4),
      Q => x(4),
      R => \x[10]_i_1_n_0\
    );
\x_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_2_in(5),
      Q => x(5),
      R => \x[10]_i_1_n_0\
    );
\x_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_2_in(6),
      Q => x(6),
      R => \x[10]_i_1_n_0\
    );
\x_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_2_in(7),
      Q => x(7),
      R => \x[10]_i_1_n_0\
    );
\x_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_2_in(8),
      Q => x(8),
      R => \x[10]_i_1_n_0\
    );
\x_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => p_2_in(9),
      Q => x(9),
      R => \x[10]_i_1_n_0\
    );
y_odd_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => s_axis_tlast,
      I1 => s_axis_tuser,
      I2 => y_odd,
      O => y_odd_i_1_n_0
    );
y_odd_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \m_axis_tdata[23]_i_2_n_0\,
      D => y_odd_i_1_n_0,
      Q => y_odd,
      R => p_0_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axis_raw_to_gbr_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tuser : in STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tuser : out STD_LOGIC;
    m_axis_tlast : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_axis_raw_to_gbr_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_axis_raw_to_gbr_0_0 : entity is "design_1_axis_raw_to_gbr_0_0,axis_raw_to_gbr,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_axis_raw_to_gbr_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_axis_raw_to_gbr_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_axis_raw_to_gbr_0_0 : entity is "axis_raw_to_gbr,Vivado 2025.2";
end design_1_axis_raw_to_gbr_0_0;

architecture STRUCTURE of design_1_axis_raw_to_gbr_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS TLAST";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  attribute X_INTERFACE_INFO of m_axis_tuser : signal is "xilinx.com:interface:axis:1.0 M_AXIS TUSER";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  attribute X_INTERFACE_INFO of s_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S_AXIS TLAST";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  attribute X_INTERFACE_INFO of s_axis_tuser : signal is "xilinx.com:interface:axis:1.0 S_AXIS TUSER";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_MODE of m_axis_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axis_tdata : signal is "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
  attribute X_INTERFACE_MODE of s_axis_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_tdata : signal is "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK1, LAYERED_METADATA undef, INSERT_VIP 0";
begin
inst: entity work.design_1_axis_raw_to_gbr_0_0_axis_raw_to_gbr
     port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tdata(23 downto 0) => m_axis_tdata(23 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tuser => m_axis_tuser,
      m_axis_tvalid_reg_0 => m_axis_tvalid,
      s_axis_tdata(7 downto 0) => s_axis_tdata(9 downto 2),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tuser => s_axis_tuser,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
