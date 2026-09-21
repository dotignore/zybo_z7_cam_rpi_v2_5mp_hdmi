## Zybo Z7-20 HDMI Out (TMDS)
## Добавить в Vivado только ПОСЛЕ появления портов rgb2dvi в wrapper.
## Пины: vivado-boards-master/new/board_files/zybo-z7-20/A.0/part0_pins.xml

set_property -dict {PACKAGE_PIN H16 IOSTANDARD TMDS_33} [get_ports TMDS_Clk_p]
set_property -dict {PACKAGE_PIN H17 IOSTANDARD TMDS_33} [get_ports TMDS_Clk_n]
set_property -dict {PACKAGE_PIN D19 IOSTANDARD TMDS_33} [get_ports {TMDS_Data_p[0]}]
set_property -dict {PACKAGE_PIN D20 IOSTANDARD TMDS_33} [get_ports {TMDS_Data_n[0]}]
set_property -dict {PACKAGE_PIN C20 IOSTANDARD TMDS_33} [get_ports {TMDS_Data_p[1]}]
set_property -dict {PACKAGE_PIN B20 IOSTANDARD TMDS_33} [get_ports {TMDS_Data_n[1]}]
set_property -dict {PACKAGE_PIN B19 IOSTANDARD TMDS_33} [get_ports {TMDS_Data_p[2]}]
set_property -dict {PACKAGE_PIN A20 IOSTANDARD TMDS_33} [get_ports {TMDS_Data_n[2]}]
