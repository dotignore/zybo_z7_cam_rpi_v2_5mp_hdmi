## Zybo Z7 Pcam  -  IMX219 / MIPI CSI-2 (2 lane, 912 Mbps)
## имена портов = design_1_wrapper.v

set_property INTERNAL_VREF 0.6 [get_iobanks 35]

## I2C камеры
set_property -dict {PACKAGE_PIN F20 IOSTANDARD LVCMOS33 PULLUP true} [get_ports IIC_0_0_scl_io]
set_property -dict {PACKAGE_PIN F19 IOSTANDARD LVCMOS33 PULLUP true} [get_ports IIC_0_0_sda_io]

## GPIO reset / enable
set_property -dict {PACKAGE_PIN G20 IOSTANDARD LVCMOS33 PULLUP true} [get_ports {GPIO_0_0_tri_io[0]}]

## MIPI D-PHY  Low-Power
set_property -dict {PACKAGE_PIN J19 IOSTANDARD HSUL_12} [get_ports mipi_phy_if_0_clk_lp_n]
set_property -dict {PACKAGE_PIN H20 IOSTANDARD HSUL_12} [get_ports mipi_phy_if_0_clk_lp_p]
set_property -dict {PACKAGE_PIN M18 IOSTANDARD HSUL_12} [get_ports {mipi_phy_if_0_data_lp_n[0]}]
set_property -dict {PACKAGE_PIN L19 IOSTANDARD HSUL_12} [get_ports {mipi_phy_if_0_data_lp_p[0]}]
set_property -dict {PACKAGE_PIN L20 IOSTANDARD HSUL_12} [get_ports {mipi_phy_if_0_data_lp_n[1]}]
set_property -dict {PACKAGE_PIN J20 IOSTANDARD HSUL_12} [get_ports {mipi_phy_if_0_data_lp_p[1]}]

## MIPI D-PHY  High-Speed
set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVDS_25} [get_ports mipi_phy_if_0_clk_hs_n]
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVDS_25} [get_ports mipi_phy_if_0_clk_hs_p]
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVDS_25} [get_ports {mipi_phy_if_0_data_hs_n[0]}]
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVDS_25} [get_ports {mipi_phy_if_0_data_hs_p[0]}]
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVDS_25} [get_ports {mipi_phy_if_0_data_hs_n[1]}]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVDS_25} [get_ports {mipi_phy_if_0_data_hs_p[1]}]

## HS clock @ 912 Mbps/lane → 456 MHz
create_clock -period 2.193 -name dphy_hs_clock_clk_p -waveform {0.000 1.096} \
  [get_ports mipi_phy_if_0_clk_hs_p]
  
## 24 MHz XVCLK для IMX219  (Pcam cam_clk)
set_property -dict {PACKAGE_PIN G19 IOSTANDARD LVCMOS33} [get_ports clk_out1_0]