set moduleName DebayerRatBorBatR_Pipeline_VITIS_LOOP_633_2
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 20
set C_modelName {DebayerRatBorBatR_Pipeline_VITIS_LOOP_633_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ p_0_2_0_0_09091530_lcssa1567_i int 10 regular  }
	{ p_0_1_0_0_09081528_lcssa1565_i int 10 regular  }
	{ p_0_0_0_0_09071526_lcssa1563_i int 10 regular  }
	{ p_0_0_0938_115131525_lcssa1561_i int 10 regular  }
	{ p_0_0_0939_115111523_lcssa1559_i int 10 regular  }
	{ p_0_0_0940_115091521_lcssa1557_i int 10 regular  }
	{ p_0_2_0_0_09151518_lcssa1555_i int 10 regular  }
	{ p_0_1_0_0_09141516_lcssa1553_i int 10 regular  }
	{ p_0_0_0_0_09131514_lcssa1551_i int 10 regular  }
	{ p_0_0_0938_21453_lcssa1485_i int 10 regular  }
	{ p_0_0_0939_21450_lcssa1483_i int 10 regular  }
	{ p_0_0_0940_21447_lcssa1481_i int 10 regular  }
	{ p_0_0_09381423_lcssa1473_i int 10 regular  }
	{ p_0_0_09391420_lcssa1471_i int 10 regular  }
	{ p_0_0_09401417_lcssa1469_i int 10 regular  }
	{ xor_ln772 int 1 regular  }
	{ trunc_ln int 15 regular  }
	{ y int 11 regular  }
	{ height_val4_load int 11 regular  }
	{ loopWidth int 11 regular  }
	{ empty int 1 regular  }
	{ xor_ln772_1 int 15 regular  }
	{ width_val8_load int 11 regular  }
	{ imgG int 30 regular {fifo 0 volatile }  }
	{ imgRB int 30 regular {fifo 1 volatile }  }
	{ p_0_2_0_0_09091531_i_out int 10 regular {pointer 1}  }
	{ p_0_1_0_0_09081529_i_out int 10 regular {pointer 1}  }
	{ p_0_0_0_0_09071527_i_out int 10 regular {pointer 1}  }
	{ p_0_0_0938_115131524_i_out int 10 regular {pointer 1}  }
	{ p_0_0_0939_115111522_i_out int 10 regular {pointer 1}  }
	{ p_0_0_0940_115091520_i_out int 10 regular {pointer 1}  }
	{ p_0_2_0_0_09151519_i_out int 10 regular {pointer 1}  }
	{ p_0_1_0_0_09141517_i_out int 10 regular {pointer 1}  }
	{ p_0_0_0_0_09131515_i_out int 10 regular {pointer 1}  }
	{ p_0_0_0938_21452_i_out int 10 regular {pointer 1}  }
	{ p_0_0_0939_21449_i_out int 10 regular {pointer 1}  }
	{ p_0_0_0940_21446_i_out int 10 regular {pointer 1}  }
	{ p_0_0_09381422_i_out int 10 regular {pointer 1}  }
	{ p_0_0_09391419_i_out int 10 regular {pointer 1}  }
	{ p_0_0_09401416_i_out int 10 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "p_0_2_0_0_09091530_lcssa1567_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_1_0_0_09081528_lcssa1565_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0_0_09071526_lcssa1563_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0938_115131525_lcssa1561_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0939_115111523_lcssa1559_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0940_115091521_lcssa1557_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_2_0_0_09151518_lcssa1555_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_1_0_0_09141516_lcssa1553_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0_0_09131514_lcssa1551_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0938_21453_lcssa1485_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0939_21450_lcssa1483_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0940_21447_lcssa1481_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_09381423_lcssa1473_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_09391420_lcssa1471_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_09401417_lcssa1469_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "xor_ln772", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "y", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "height_val4_load", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "loopWidth", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "xor_ln772_1", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "width_val8_load", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "imgG", "interface" : "fifo", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "imgRB", "interface" : "fifo", "bitwidth" : 30, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_2_0_0_09091531_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_1_0_0_09081529_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0_0_09071527_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0938_115131524_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0939_115111522_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0940_115091520_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_2_0_0_09151519_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_1_0_0_09141517_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0_0_09131515_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0938_21452_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0939_21449_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0940_21446_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_09381422_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_09391419_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_09401416_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 69
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ imgG_dout sc_in sc_lv 30 signal 23 } 
	{ imgG_empty_n sc_in sc_logic 1 signal 23 } 
	{ imgG_read sc_out sc_logic 1 signal 23 } 
	{ imgG_num_data_valid sc_in sc_lv 3 signal 23 } 
	{ imgG_fifo_cap sc_in sc_lv 3 signal 23 } 
	{ imgRB_din sc_out sc_lv 30 signal 24 } 
	{ imgRB_full_n sc_in sc_logic 1 signal 24 } 
	{ imgRB_write sc_out sc_logic 1 signal 24 } 
	{ imgRB_num_data_valid sc_in sc_lv 32 signal 24 } 
	{ imgRB_fifo_cap sc_in sc_lv 32 signal 24 } 
	{ p_0_2_0_0_09091530_lcssa1567_i sc_in sc_lv 10 signal 0 } 
	{ p_0_1_0_0_09081528_lcssa1565_i sc_in sc_lv 10 signal 1 } 
	{ p_0_0_0_0_09071526_lcssa1563_i sc_in sc_lv 10 signal 2 } 
	{ p_0_0_0938_115131525_lcssa1561_i sc_in sc_lv 10 signal 3 } 
	{ p_0_0_0939_115111523_lcssa1559_i sc_in sc_lv 10 signal 4 } 
	{ p_0_0_0940_115091521_lcssa1557_i sc_in sc_lv 10 signal 5 } 
	{ p_0_2_0_0_09151518_lcssa1555_i sc_in sc_lv 10 signal 6 } 
	{ p_0_1_0_0_09141516_lcssa1553_i sc_in sc_lv 10 signal 7 } 
	{ p_0_0_0_0_09131514_lcssa1551_i sc_in sc_lv 10 signal 8 } 
	{ p_0_0_0938_21453_lcssa1485_i sc_in sc_lv 10 signal 9 } 
	{ p_0_0_0939_21450_lcssa1483_i sc_in sc_lv 10 signal 10 } 
	{ p_0_0_0940_21447_lcssa1481_i sc_in sc_lv 10 signal 11 } 
	{ p_0_0_09381423_lcssa1473_i sc_in sc_lv 10 signal 12 } 
	{ p_0_0_09391420_lcssa1471_i sc_in sc_lv 10 signal 13 } 
	{ p_0_0_09401417_lcssa1469_i sc_in sc_lv 10 signal 14 } 
	{ xor_ln772 sc_in sc_lv 1 signal 15 } 
	{ trunc_ln sc_in sc_lv 15 signal 16 } 
	{ y sc_in sc_lv 11 signal 17 } 
	{ height_val4_load sc_in sc_lv 11 signal 18 } 
	{ loopWidth sc_in sc_lv 11 signal 19 } 
	{ empty sc_in sc_lv 1 signal 20 } 
	{ xor_ln772_1 sc_in sc_lv 15 signal 21 } 
	{ width_val8_load sc_in sc_lv 11 signal 22 } 
	{ p_0_2_0_0_09091531_i_out sc_out sc_lv 10 signal 25 } 
	{ p_0_2_0_0_09091531_i_out_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ p_0_1_0_0_09081529_i_out sc_out sc_lv 10 signal 26 } 
	{ p_0_1_0_0_09081529_i_out_ap_vld sc_out sc_logic 1 outvld 26 } 
	{ p_0_0_0_0_09071527_i_out sc_out sc_lv 10 signal 27 } 
	{ p_0_0_0_0_09071527_i_out_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ p_0_0_0938_115131524_i_out sc_out sc_lv 10 signal 28 } 
	{ p_0_0_0938_115131524_i_out_ap_vld sc_out sc_logic 1 outvld 28 } 
	{ p_0_0_0939_115111522_i_out sc_out sc_lv 10 signal 29 } 
	{ p_0_0_0939_115111522_i_out_ap_vld sc_out sc_logic 1 outvld 29 } 
	{ p_0_0_0940_115091520_i_out sc_out sc_lv 10 signal 30 } 
	{ p_0_0_0940_115091520_i_out_ap_vld sc_out sc_logic 1 outvld 30 } 
	{ p_0_2_0_0_09151519_i_out sc_out sc_lv 10 signal 31 } 
	{ p_0_2_0_0_09151519_i_out_ap_vld sc_out sc_logic 1 outvld 31 } 
	{ p_0_1_0_0_09141517_i_out sc_out sc_lv 10 signal 32 } 
	{ p_0_1_0_0_09141517_i_out_ap_vld sc_out sc_logic 1 outvld 32 } 
	{ p_0_0_0_0_09131515_i_out sc_out sc_lv 10 signal 33 } 
	{ p_0_0_0_0_09131515_i_out_ap_vld sc_out sc_logic 1 outvld 33 } 
	{ p_0_0_0938_21452_i_out sc_out sc_lv 10 signal 34 } 
	{ p_0_0_0938_21452_i_out_ap_vld sc_out sc_logic 1 outvld 34 } 
	{ p_0_0_0939_21449_i_out sc_out sc_lv 10 signal 35 } 
	{ p_0_0_0939_21449_i_out_ap_vld sc_out sc_logic 1 outvld 35 } 
	{ p_0_0_0940_21446_i_out sc_out sc_lv 10 signal 36 } 
	{ p_0_0_0940_21446_i_out_ap_vld sc_out sc_logic 1 outvld 36 } 
	{ p_0_0_09381422_i_out sc_out sc_lv 10 signal 37 } 
	{ p_0_0_09381422_i_out_ap_vld sc_out sc_logic 1 outvld 37 } 
	{ p_0_0_09391419_i_out sc_out sc_lv 10 signal 38 } 
	{ p_0_0_09391419_i_out_ap_vld sc_out sc_logic 1 outvld 38 } 
	{ p_0_0_09401416_i_out sc_out sc_lv 10 signal 39 } 
	{ p_0_0_09401416_i_out_ap_vld sc_out sc_logic 1 outvld 39 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "imgG_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "imgG", "role": "dout" }} , 
 	{ "name": "imgG_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgG", "role": "empty_n" }} , 
 	{ "name": "imgG_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgG", "role": "read" }} , 
 	{ "name": "imgG_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "imgG", "role": "num_data_valid" }} , 
 	{ "name": "imgG_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "imgG", "role": "fifo_cap" }} , 
 	{ "name": "imgRB_din", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "imgRB", "role": "din" }} , 
 	{ "name": "imgRB_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgRB", "role": "full_n" }} , 
 	{ "name": "imgRB_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgRB", "role": "write" }} , 
 	{ "name": "imgRB_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imgRB", "role": "num_data_valid" }} , 
 	{ "name": "imgRB_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imgRB", "role": "fifo_cap" }} , 
 	{ "name": "p_0_2_0_0_09091530_lcssa1567_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_2_0_0_09091530_lcssa1567_i", "role": "default" }} , 
 	{ "name": "p_0_1_0_0_09081528_lcssa1565_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_1_0_0_09081528_lcssa1565_i", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_09071526_lcssa1563_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0_0_09071526_lcssa1563_i", "role": "default" }} , 
 	{ "name": "p_0_0_0938_115131525_lcssa1561_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0938_115131525_lcssa1561_i", "role": "default" }} , 
 	{ "name": "p_0_0_0939_115111523_lcssa1559_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0939_115111523_lcssa1559_i", "role": "default" }} , 
 	{ "name": "p_0_0_0940_115091521_lcssa1557_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0940_115091521_lcssa1557_i", "role": "default" }} , 
 	{ "name": "p_0_2_0_0_09151518_lcssa1555_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_2_0_0_09151518_lcssa1555_i", "role": "default" }} , 
 	{ "name": "p_0_1_0_0_09141516_lcssa1553_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_1_0_0_09141516_lcssa1553_i", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_09131514_lcssa1551_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0_0_09131514_lcssa1551_i", "role": "default" }} , 
 	{ "name": "p_0_0_0938_21453_lcssa1485_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0938_21453_lcssa1485_i", "role": "default" }} , 
 	{ "name": "p_0_0_0939_21450_lcssa1483_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0939_21450_lcssa1483_i", "role": "default" }} , 
 	{ "name": "p_0_0_0940_21447_lcssa1481_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0940_21447_lcssa1481_i", "role": "default" }} , 
 	{ "name": "p_0_0_09381423_lcssa1473_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_09381423_lcssa1473_i", "role": "default" }} , 
 	{ "name": "p_0_0_09391420_lcssa1471_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_09391420_lcssa1471_i", "role": "default" }} , 
 	{ "name": "p_0_0_09401417_lcssa1469_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_09401417_lcssa1469_i", "role": "default" }} , 
 	{ "name": "xor_ln772", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "xor_ln772", "role": "default" }} , 
 	{ "name": "trunc_ln", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "trunc_ln", "role": "default" }} , 
 	{ "name": "y", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "y", "role": "default" }} , 
 	{ "name": "height_val4_load", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "height_val4_load", "role": "default" }} , 
 	{ "name": "loopWidth", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "loopWidth", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "xor_ln772_1", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "xor_ln772_1", "role": "default" }} , 
 	{ "name": "width_val8_load", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "width_val8_load", "role": "default" }} , 
 	{ "name": "p_0_2_0_0_09091531_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_2_0_0_09091531_i_out", "role": "default" }} , 
 	{ "name": "p_0_2_0_0_09091531_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_2_0_0_09091531_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_1_0_0_09081529_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_1_0_0_09081529_i_out", "role": "default" }} , 
 	{ "name": "p_0_1_0_0_09081529_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_1_0_0_09081529_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0_0_09071527_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0_0_09071527_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_09071527_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0_0_09071527_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0938_115131524_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0938_115131524_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0938_115131524_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0938_115131524_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0939_115111522_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0939_115111522_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0939_115111522_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0939_115111522_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0940_115091520_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0940_115091520_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0940_115091520_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0940_115091520_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_2_0_0_09151519_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_2_0_0_09151519_i_out", "role": "default" }} , 
 	{ "name": "p_0_2_0_0_09151519_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_2_0_0_09151519_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_1_0_0_09141517_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_1_0_0_09141517_i_out", "role": "default" }} , 
 	{ "name": "p_0_1_0_0_09141517_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_1_0_0_09141517_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0_0_09131515_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0_0_09131515_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_09131515_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0_0_09131515_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0938_21452_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0938_21452_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0938_21452_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0938_21452_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0939_21449_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0939_21449_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0939_21449_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0939_21449_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0940_21446_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0940_21446_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0940_21446_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0940_21446_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_09381422_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_09381422_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_09381422_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_09381422_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_09391419_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_09391419_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_09391419_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_09391419_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_09401416_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_09401416_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_09401416_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_09401416_i_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	DebayerRatBorBatR_Pipeline_VITIS_LOOP_633_2 {
		p_0_2_0_0_09091530_lcssa1567_i {Type I LastRead 0 FirstWrite -1}
		p_0_1_0_0_09081528_lcssa1565_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0_09071526_lcssa1563_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0938_115131525_lcssa1561_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0939_115111523_lcssa1559_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0940_115091521_lcssa1557_i {Type I LastRead 0 FirstWrite -1}
		p_0_2_0_0_09151518_lcssa1555_i {Type I LastRead 0 FirstWrite -1}
		p_0_1_0_0_09141516_lcssa1553_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0_09131514_lcssa1551_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0938_21453_lcssa1485_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0939_21450_lcssa1483_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0940_21447_lcssa1481_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_09381423_lcssa1473_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_09391420_lcssa1471_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_09401417_lcssa1469_i {Type I LastRead 0 FirstWrite -1}
		xor_ln772 {Type I LastRead 0 FirstWrite -1}
		trunc_ln {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		height_val4_load {Type I LastRead 0 FirstWrite -1}
		loopWidth {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		xor_ln772_1 {Type I LastRead 0 FirstWrite -1}
		width_val8_load {Type I LastRead 0 FirstWrite -1}
		imgG {Type I LastRead 1 FirstWrite -1}
		imgRB {Type O LastRead -1 FirstWrite 6}
		p_0_2_0_0_09091531_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_1_0_0_09081529_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_0_0_0_09071527_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_0_0938_115131524_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_0_0939_115111522_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_0_0940_115091520_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_2_0_0_09151519_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_1_0_0_09141517_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_0_0_0_09131515_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_0_0938_21452_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_0_0939_21449_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_0_0940_21446_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_0_09381422_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_0_09391419_i_out {Type O LastRead -1 FirstWrite 5}
		p_0_0_09401416_i_out {Type O LastRead -1 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "8", "Max" : "1928"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "1922"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p_0_2_0_0_09091530_lcssa1567_i { ap_none {  { p_0_2_0_0_09091530_lcssa1567_i in_data 0 10 } } }
	p_0_1_0_0_09081528_lcssa1565_i { ap_none {  { p_0_1_0_0_09081528_lcssa1565_i in_data 0 10 } } }
	p_0_0_0_0_09071526_lcssa1563_i { ap_none {  { p_0_0_0_0_09071526_lcssa1563_i in_data 0 10 } } }
	p_0_0_0938_115131525_lcssa1561_i { ap_none {  { p_0_0_0938_115131525_lcssa1561_i in_data 0 10 } } }
	p_0_0_0939_115111523_lcssa1559_i { ap_none {  { p_0_0_0939_115111523_lcssa1559_i in_data 0 10 } } }
	p_0_0_0940_115091521_lcssa1557_i { ap_none {  { p_0_0_0940_115091521_lcssa1557_i in_data 0 10 } } }
	p_0_2_0_0_09151518_lcssa1555_i { ap_none {  { p_0_2_0_0_09151518_lcssa1555_i in_data 0 10 } } }
	p_0_1_0_0_09141516_lcssa1553_i { ap_none {  { p_0_1_0_0_09141516_lcssa1553_i in_data 0 10 } } }
	p_0_0_0_0_09131514_lcssa1551_i { ap_none {  { p_0_0_0_0_09131514_lcssa1551_i in_data 0 10 } } }
	p_0_0_0938_21453_lcssa1485_i { ap_none {  { p_0_0_0938_21453_lcssa1485_i in_data 0 10 } } }
	p_0_0_0939_21450_lcssa1483_i { ap_none {  { p_0_0_0939_21450_lcssa1483_i in_data 0 10 } } }
	p_0_0_0940_21447_lcssa1481_i { ap_none {  { p_0_0_0940_21447_lcssa1481_i in_data 0 10 } } }
	p_0_0_09381423_lcssa1473_i { ap_none {  { p_0_0_09381423_lcssa1473_i in_data 0 10 } } }
	p_0_0_09391420_lcssa1471_i { ap_none {  { p_0_0_09391420_lcssa1471_i in_data 0 10 } } }
	p_0_0_09401417_lcssa1469_i { ap_none {  { p_0_0_09401417_lcssa1469_i in_data 0 10 } } }
	xor_ln772 { ap_none {  { xor_ln772 in_data 0 1 } } }
	trunc_ln { ap_none {  { trunc_ln in_data 0 15 } } }
	y { ap_none {  { y in_data 0 11 } } }
	height_val4_load { ap_none {  { height_val4_load in_data 0 11 } } }
	loopWidth { ap_none {  { loopWidth in_data 0 11 } } }
	empty { ap_none {  { empty in_data 0 1 } } }
	xor_ln772_1 { ap_none {  { xor_ln772_1 in_data 0 15 } } }
	width_val8_load { ap_none {  { width_val8_load in_data 0 11 } } }
	imgG { ap_fifo {  { imgG_dout fifo_data_out 0 30 }  { imgG_empty_n fifo_status_empty 0 1 }  { imgG_read fifo_data_in 1 1 }  { imgG_num_data_valid fifo_update 0 3 }  { imgG_fifo_cap fifo_data 0 3 } } }
	imgRB { ap_fifo {  { imgRB_din fifo_data_out 1 30 }  { imgRB_full_n fifo_status_empty 0 1 }  { imgRB_write fifo_data_in 1 1 }  { imgRB_num_data_valid fifo_update 0 32 }  { imgRB_fifo_cap fifo_data 0 32 } } }
	p_0_2_0_0_09091531_i_out { ap_vld {  { p_0_2_0_0_09091531_i_out out_data 1 10 }  { p_0_2_0_0_09091531_i_out_ap_vld out_vld 1 1 } } }
	p_0_1_0_0_09081529_i_out { ap_vld {  { p_0_1_0_0_09081529_i_out out_data 1 10 }  { p_0_1_0_0_09081529_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0_0_09071527_i_out { ap_vld {  { p_0_0_0_0_09071527_i_out out_data 1 10 }  { p_0_0_0_0_09071527_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0938_115131524_i_out { ap_vld {  { p_0_0_0938_115131524_i_out out_data 1 10 }  { p_0_0_0938_115131524_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0939_115111522_i_out { ap_vld {  { p_0_0_0939_115111522_i_out out_data 1 10 }  { p_0_0_0939_115111522_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0940_115091520_i_out { ap_vld {  { p_0_0_0940_115091520_i_out out_data 1 10 }  { p_0_0_0940_115091520_i_out_ap_vld out_vld 1 1 } } }
	p_0_2_0_0_09151519_i_out { ap_vld {  { p_0_2_0_0_09151519_i_out out_data 1 10 }  { p_0_2_0_0_09151519_i_out_ap_vld out_vld 1 1 } } }
	p_0_1_0_0_09141517_i_out { ap_vld {  { p_0_1_0_0_09141517_i_out out_data 1 10 }  { p_0_1_0_0_09141517_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0_0_09131515_i_out { ap_vld {  { p_0_0_0_0_09131515_i_out out_data 1 10 }  { p_0_0_0_0_09131515_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0938_21452_i_out { ap_vld {  { p_0_0_0938_21452_i_out out_data 1 10 }  { p_0_0_0938_21452_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0939_21449_i_out { ap_vld {  { p_0_0_0939_21449_i_out out_data 1 10 }  { p_0_0_0939_21449_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0940_21446_i_out { ap_vld {  { p_0_0_0940_21446_i_out out_data 1 10 }  { p_0_0_0940_21446_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_09381422_i_out { ap_vld {  { p_0_0_09381422_i_out out_data 1 10 }  { p_0_0_09381422_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_09391419_i_out { ap_vld {  { p_0_0_09391419_i_out out_data 1 10 }  { p_0_0_09391419_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_09401416_i_out { ap_vld {  { p_0_0_09401416_i_out out_data 1 10 }  { p_0_0_09401416_i_out_ap_vld out_vld 1 1 } } }
}
