set moduleName DebayerRandBatG_Pipeline_VITIS_LOOP_881_2
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
set C_modelName {DebayerRandBatG_Pipeline_VITIS_LOOP_881_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ p_0_0_01177_217791809_lcssa1845_i int 10 regular  }
	{ p_0_0_01178_217771807_lcssa1843_i int 10 regular  }
	{ p_0_0_01179_217751805_lcssa1841_i int 10 regular  }
	{ p_0_2_0_0_011541802_lcssa1839_i int 10 regular  }
	{ p_0_1_0_0_011531800_lcssa1837_i int 10 regular  }
	{ p_0_0_0_0_011521798_lcssa1835_i int 10 regular  }
	{ p_0_0_0116417851797_lcssa1833_i int 10 regular  }
	{ p_0_0_0116517831795_lcssa1831_i int 10 regular  }
	{ p_0_0_0116617811793_lcssa1829_i int 10 regular  }
	{ p_0_2_0_0_011601709_lcssa1751_i int 10 regular  }
	{ p_0_1_0_0_011591706_lcssa1749_i int 10 regular  }
	{ p_0_0_0_0_011581703_lcssa1747_i int 10 regular  }
	{ y int 11 regular  }
	{ height_val4_load int 11 regular  }
	{ loopWidth int 11 regular  }
	{ empty int 1 regular  }
	{ xor_ln1014_1 int 15 regular  }
	{ width_val8_load int 11 regular  }
	{ imgRB int 30 regular {fifo 0 volatile }  }
	{ imgRgb int 30 regular {fifo 1 volatile }  }
	{ p_0_0_01177_217791808_i_out int 10 regular {pointer 1}  }
	{ p_0_0_01178_217771806_i_out int 10 regular {pointer 1}  }
	{ p_0_0_01179_217751804_i_out int 10 regular {pointer 1}  }
	{ right_2_out int 10 regular {pointer 1}  }
	{ right_1_out int 10 regular {pointer 1}  }
	{ right_out int 10 regular {pointer 1}  }
	{ p_0_0_0116417851796_i_out int 10 regular {pointer 1}  }
	{ p_0_0_0116517831794_i_out int 10 regular {pointer 1}  }
	{ p_0_0_0116617811792_i_out int 10 regular {pointer 1}  }
	{ p_0_2_0_0_011601711_i_out int 10 regular {pointer 1}  }
	{ p_0_1_0_0_011591708_i_out int 10 regular {pointer 1}  }
	{ p_0_0_0_0_011581705_i_out int 10 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "p_0_0_01177_217791809_lcssa1845_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_01178_217771807_lcssa1843_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_01179_217751805_lcssa1841_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_2_0_0_011541802_lcssa1839_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_1_0_0_011531800_lcssa1837_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0_0_011521798_lcssa1835_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0116417851797_lcssa1833_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0116517831795_lcssa1831_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0116617811793_lcssa1829_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_2_0_0_011601709_lcssa1751_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_1_0_0_011591706_lcssa1749_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0_0_011581703_lcssa1747_i", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "y", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "height_val4_load", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "loopWidth", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "xor_ln1014_1", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "width_val8_load", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "imgRB", "interface" : "fifo", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "imgRgb", "interface" : "fifo", "bitwidth" : 30, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_01177_217791808_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_01178_217771806_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_01179_217751804_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "right_2_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "right_1_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "right_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0116417851796_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0116517831794_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0116617811792_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_2_0_0_011601711_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_1_0_0_011591708_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0_0_011581705_i_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 58
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ imgRB_dout sc_in sc_lv 30 signal 18 } 
	{ imgRB_empty_n sc_in sc_logic 1 signal 18 } 
	{ imgRB_read sc_out sc_logic 1 signal 18 } 
	{ imgRB_num_data_valid sc_in sc_lv 3 signal 18 } 
	{ imgRB_fifo_cap sc_in sc_lv 3 signal 18 } 
	{ imgRgb_din sc_out sc_lv 30 signal 19 } 
	{ imgRgb_full_n sc_in sc_logic 1 signal 19 } 
	{ imgRgb_write sc_out sc_logic 1 signal 19 } 
	{ imgRgb_num_data_valid sc_in sc_lv 32 signal 19 } 
	{ imgRgb_fifo_cap sc_in sc_lv 32 signal 19 } 
	{ p_0_0_01177_217791809_lcssa1845_i sc_in sc_lv 10 signal 0 } 
	{ p_0_0_01178_217771807_lcssa1843_i sc_in sc_lv 10 signal 1 } 
	{ p_0_0_01179_217751805_lcssa1841_i sc_in sc_lv 10 signal 2 } 
	{ p_0_2_0_0_011541802_lcssa1839_i sc_in sc_lv 10 signal 3 } 
	{ p_0_1_0_0_011531800_lcssa1837_i sc_in sc_lv 10 signal 4 } 
	{ p_0_0_0_0_011521798_lcssa1835_i sc_in sc_lv 10 signal 5 } 
	{ p_0_0_0116417851797_lcssa1833_i sc_in sc_lv 10 signal 6 } 
	{ p_0_0_0116517831795_lcssa1831_i sc_in sc_lv 10 signal 7 } 
	{ p_0_0_0116617811793_lcssa1829_i sc_in sc_lv 10 signal 8 } 
	{ p_0_2_0_0_011601709_lcssa1751_i sc_in sc_lv 10 signal 9 } 
	{ p_0_1_0_0_011591706_lcssa1749_i sc_in sc_lv 10 signal 10 } 
	{ p_0_0_0_0_011581703_lcssa1747_i sc_in sc_lv 10 signal 11 } 
	{ y sc_in sc_lv 11 signal 12 } 
	{ height_val4_load sc_in sc_lv 11 signal 13 } 
	{ loopWidth sc_in sc_lv 11 signal 14 } 
	{ empty sc_in sc_lv 1 signal 15 } 
	{ xor_ln1014_1 sc_in sc_lv 15 signal 16 } 
	{ width_val8_load sc_in sc_lv 11 signal 17 } 
	{ p_0_0_01177_217791808_i_out sc_out sc_lv 10 signal 20 } 
	{ p_0_0_01177_217791808_i_out_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ p_0_0_01178_217771806_i_out sc_out sc_lv 10 signal 21 } 
	{ p_0_0_01178_217771806_i_out_ap_vld sc_out sc_logic 1 outvld 21 } 
	{ p_0_0_01179_217751804_i_out sc_out sc_lv 10 signal 22 } 
	{ p_0_0_01179_217751804_i_out_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ right_2_out sc_out sc_lv 10 signal 23 } 
	{ right_2_out_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ right_1_out sc_out sc_lv 10 signal 24 } 
	{ right_1_out_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ right_out sc_out sc_lv 10 signal 25 } 
	{ right_out_ap_vld sc_out sc_logic 1 outvld 25 } 
	{ p_0_0_0116417851796_i_out sc_out sc_lv 10 signal 26 } 
	{ p_0_0_0116417851796_i_out_ap_vld sc_out sc_logic 1 outvld 26 } 
	{ p_0_0_0116517831794_i_out sc_out sc_lv 10 signal 27 } 
	{ p_0_0_0116517831794_i_out_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ p_0_0_0116617811792_i_out sc_out sc_lv 10 signal 28 } 
	{ p_0_0_0116617811792_i_out_ap_vld sc_out sc_logic 1 outvld 28 } 
	{ p_0_2_0_0_011601711_i_out sc_out sc_lv 10 signal 29 } 
	{ p_0_2_0_0_011601711_i_out_ap_vld sc_out sc_logic 1 outvld 29 } 
	{ p_0_1_0_0_011591708_i_out sc_out sc_lv 10 signal 30 } 
	{ p_0_1_0_0_011591708_i_out_ap_vld sc_out sc_logic 1 outvld 30 } 
	{ p_0_0_0_0_011581705_i_out sc_out sc_lv 10 signal 31 } 
	{ p_0_0_0_0_011581705_i_out_ap_vld sc_out sc_logic 1 outvld 31 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "imgRB_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "imgRB", "role": "dout" }} , 
 	{ "name": "imgRB_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgRB", "role": "empty_n" }} , 
 	{ "name": "imgRB_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgRB", "role": "read" }} , 
 	{ "name": "imgRB_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "imgRB", "role": "num_data_valid" }} , 
 	{ "name": "imgRB_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "imgRB", "role": "fifo_cap" }} , 
 	{ "name": "imgRgb_din", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "imgRgb", "role": "din" }} , 
 	{ "name": "imgRgb_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgRgb", "role": "full_n" }} , 
 	{ "name": "imgRgb_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgRgb", "role": "write" }} , 
 	{ "name": "imgRgb_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imgRgb", "role": "num_data_valid" }} , 
 	{ "name": "imgRgb_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imgRgb", "role": "fifo_cap" }} , 
 	{ "name": "p_0_0_01177_217791809_lcssa1845_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_01177_217791809_lcssa1845_i", "role": "default" }} , 
 	{ "name": "p_0_0_01178_217771807_lcssa1843_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_01178_217771807_lcssa1843_i", "role": "default" }} , 
 	{ "name": "p_0_0_01179_217751805_lcssa1841_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_01179_217751805_lcssa1841_i", "role": "default" }} , 
 	{ "name": "p_0_2_0_0_011541802_lcssa1839_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_2_0_0_011541802_lcssa1839_i", "role": "default" }} , 
 	{ "name": "p_0_1_0_0_011531800_lcssa1837_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_1_0_0_011531800_lcssa1837_i", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_011521798_lcssa1835_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0_0_011521798_lcssa1835_i", "role": "default" }} , 
 	{ "name": "p_0_0_0116417851797_lcssa1833_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0116417851797_lcssa1833_i", "role": "default" }} , 
 	{ "name": "p_0_0_0116517831795_lcssa1831_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0116517831795_lcssa1831_i", "role": "default" }} , 
 	{ "name": "p_0_0_0116617811793_lcssa1829_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0116617811793_lcssa1829_i", "role": "default" }} , 
 	{ "name": "p_0_2_0_0_011601709_lcssa1751_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_2_0_0_011601709_lcssa1751_i", "role": "default" }} , 
 	{ "name": "p_0_1_0_0_011591706_lcssa1749_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_1_0_0_011591706_lcssa1749_i", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_011581703_lcssa1747_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0_0_011581703_lcssa1747_i", "role": "default" }} , 
 	{ "name": "y", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "y", "role": "default" }} , 
 	{ "name": "height_val4_load", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "height_val4_load", "role": "default" }} , 
 	{ "name": "loopWidth", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "loopWidth", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "xor_ln1014_1", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "xor_ln1014_1", "role": "default" }} , 
 	{ "name": "width_val8_load", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "width_val8_load", "role": "default" }} , 
 	{ "name": "p_0_0_01177_217791808_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_01177_217791808_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_01177_217791808_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_01177_217791808_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_01178_217771806_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_01178_217771806_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_01178_217771806_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_01178_217771806_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_01179_217751804_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_01179_217751804_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_01179_217751804_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_01179_217751804_i_out", "role": "ap_vld" }} , 
 	{ "name": "right_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "right_2_out", "role": "default" }} , 
 	{ "name": "right_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "right_2_out", "role": "ap_vld" }} , 
 	{ "name": "right_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "right_1_out", "role": "default" }} , 
 	{ "name": "right_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "right_1_out", "role": "ap_vld" }} , 
 	{ "name": "right_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "right_out", "role": "default" }} , 
 	{ "name": "right_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "right_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0116417851796_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0116417851796_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0116417851796_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0116417851796_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0116517831794_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0116517831794_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0116517831794_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0116517831794_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0116617811792_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0116617811792_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0116617811792_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0116617811792_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_2_0_0_011601711_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_2_0_0_011601711_i_out", "role": "default" }} , 
 	{ "name": "p_0_2_0_0_011601711_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_2_0_0_011601711_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_1_0_0_011591708_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_1_0_0_011591708_i_out", "role": "default" }} , 
 	{ "name": "p_0_1_0_0_011591708_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_1_0_0_011591708_i_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0_0_011581705_i_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0_0_011581705_i_out", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_011581705_i_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0_0_011581705_i_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	DebayerRandBatG_Pipeline_VITIS_LOOP_881_2 {
		p_0_0_01177_217791809_lcssa1845_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_01178_217771807_lcssa1843_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_01179_217751805_lcssa1841_i {Type I LastRead 0 FirstWrite -1}
		p_0_2_0_0_011541802_lcssa1839_i {Type I LastRead 0 FirstWrite -1}
		p_0_1_0_0_011531800_lcssa1837_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0_011521798_lcssa1835_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0116417851797_lcssa1833_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0116517831795_lcssa1831_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0116617811793_lcssa1829_i {Type I LastRead 0 FirstWrite -1}
		p_0_2_0_0_011601709_lcssa1751_i {Type I LastRead 0 FirstWrite -1}
		p_0_1_0_0_011591706_lcssa1749_i {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0_011581703_lcssa1747_i {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		height_val4_load {Type I LastRead 0 FirstWrite -1}
		loopWidth {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		xor_ln1014_1 {Type I LastRead 0 FirstWrite -1}
		width_val8_load {Type I LastRead 0 FirstWrite -1}
		imgRB {Type I LastRead 1 FirstWrite -1}
		imgRgb {Type O LastRead -1 FirstWrite 4}
		p_0_0_01177_217791808_i_out {Type O LastRead -1 FirstWrite 3}
		p_0_0_01178_217771806_i_out {Type O LastRead -1 FirstWrite 3}
		p_0_0_01179_217751804_i_out {Type O LastRead -1 FirstWrite 3}
		right_2_out {Type O LastRead -1 FirstWrite 3}
		right_1_out {Type O LastRead -1 FirstWrite 3}
		right_out {Type O LastRead -1 FirstWrite 3}
		p_0_0_0116417851796_i_out {Type O LastRead -1 FirstWrite 3}
		p_0_0_0116517831794_i_out {Type O LastRead -1 FirstWrite 3}
		p_0_0_0116617811792_i_out {Type O LastRead -1 FirstWrite 3}
		p_0_2_0_0_011601711_i_out {Type O LastRead -1 FirstWrite 3}
		p_0_1_0_0_011591708_i_out {Type O LastRead -1 FirstWrite 3}
		p_0_0_0_0_011581705_i_out {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "1926"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "1922"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p_0_0_01177_217791809_lcssa1845_i { ap_none {  { p_0_0_01177_217791809_lcssa1845_i in_data 0 10 } } }
	p_0_0_01178_217771807_lcssa1843_i { ap_none {  { p_0_0_01178_217771807_lcssa1843_i in_data 0 10 } } }
	p_0_0_01179_217751805_lcssa1841_i { ap_none {  { p_0_0_01179_217751805_lcssa1841_i in_data 0 10 } } }
	p_0_2_0_0_011541802_lcssa1839_i { ap_none {  { p_0_2_0_0_011541802_lcssa1839_i in_data 0 10 } } }
	p_0_1_0_0_011531800_lcssa1837_i { ap_none {  { p_0_1_0_0_011531800_lcssa1837_i in_data 0 10 } } }
	p_0_0_0_0_011521798_lcssa1835_i { ap_none {  { p_0_0_0_0_011521798_lcssa1835_i in_data 0 10 } } }
	p_0_0_0116417851797_lcssa1833_i { ap_none {  { p_0_0_0116417851797_lcssa1833_i in_data 0 10 } } }
	p_0_0_0116517831795_lcssa1831_i { ap_none {  { p_0_0_0116517831795_lcssa1831_i in_data 0 10 } } }
	p_0_0_0116617811793_lcssa1829_i { ap_none {  { p_0_0_0116617811793_lcssa1829_i in_data 0 10 } } }
	p_0_2_0_0_011601709_lcssa1751_i { ap_none {  { p_0_2_0_0_011601709_lcssa1751_i in_data 0 10 } } }
	p_0_1_0_0_011591706_lcssa1749_i { ap_none {  { p_0_1_0_0_011591706_lcssa1749_i in_data 0 10 } } }
	p_0_0_0_0_011581703_lcssa1747_i { ap_none {  { p_0_0_0_0_011581703_lcssa1747_i in_data 0 10 } } }
	y { ap_none {  { y in_data 0 11 } } }
	height_val4_load { ap_none {  { height_val4_load in_data 0 11 } } }
	loopWidth { ap_none {  { loopWidth in_data 0 11 } } }
	empty { ap_none {  { empty in_data 0 1 } } }
	xor_ln1014_1 { ap_none {  { xor_ln1014_1 in_data 0 15 } } }
	width_val8_load { ap_none {  { width_val8_load in_data 0 11 } } }
	imgRB { ap_fifo {  { imgRB_dout fifo_data_out 0 30 }  { imgRB_empty_n fifo_status_empty 0 1 }  { imgRB_read fifo_data_in 1 1 }  { imgRB_num_data_valid fifo_update 0 3 }  { imgRB_fifo_cap fifo_data 0 3 } } }
	imgRgb { ap_fifo {  { imgRgb_din fifo_data_out 1 30 }  { imgRgb_full_n fifo_status_empty 0 1 }  { imgRgb_write fifo_data_in 1 1 }  { imgRgb_num_data_valid fifo_update 0 32 }  { imgRgb_fifo_cap fifo_data 0 32 } } }
	p_0_0_01177_217791808_i_out { ap_vld {  { p_0_0_01177_217791808_i_out out_data 1 10 }  { p_0_0_01177_217791808_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_01178_217771806_i_out { ap_vld {  { p_0_0_01178_217771806_i_out out_data 1 10 }  { p_0_0_01178_217771806_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_01179_217751804_i_out { ap_vld {  { p_0_0_01179_217751804_i_out out_data 1 10 }  { p_0_0_01179_217751804_i_out_ap_vld out_vld 1 1 } } }
	right_2_out { ap_vld {  { right_2_out out_data 1 10 }  { right_2_out_ap_vld out_vld 1 1 } } }
	right_1_out { ap_vld {  { right_1_out out_data 1 10 }  { right_1_out_ap_vld out_vld 1 1 } } }
	right_out { ap_vld {  { right_out out_data 1 10 }  { right_out_ap_vld out_vld 1 1 } } }
	p_0_0_0116417851796_i_out { ap_vld {  { p_0_0_0116417851796_i_out out_data 1 10 }  { p_0_0_0116417851796_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0116517831794_i_out { ap_vld {  { p_0_0_0116517831794_i_out out_data 1 10 }  { p_0_0_0116517831794_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0116617811792_i_out { ap_vld {  { p_0_0_0116617811792_i_out out_data 1 10 }  { p_0_0_0116617811792_i_out_ap_vld out_vld 1 1 } } }
	p_0_2_0_0_011601711_i_out { ap_vld {  { p_0_2_0_0_011601711_i_out out_data 1 10 }  { p_0_2_0_0_011601711_i_out_ap_vld out_vld 1 1 } } }
	p_0_1_0_0_011591708_i_out { ap_vld {  { p_0_1_0_0_011591708_i_out out_data 1 10 }  { p_0_1_0_0_011591708_i_out_ap_vld out_vld 1 1 } } }
	p_0_0_0_0_011581705_i_out { ap_vld {  { p_0_0_0_0_011581705_i_out out_data 1 10 }  { p_0_0_0_0_011581705_i_out_ap_vld out_vld 1 1 } } }
}
