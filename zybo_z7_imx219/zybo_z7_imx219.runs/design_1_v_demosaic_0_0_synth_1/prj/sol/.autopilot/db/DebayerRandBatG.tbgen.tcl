set moduleName DebayerRandBatG
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
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
set C_modelName {DebayerRandBatG}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ imgRB int 30 regular {fifo 0 volatile }  }
	{ imgRgb int 30 regular {fifo 1 volatile }  }
	{ height_val4 int 11 regular {fifo 0}  }
	{ width_val8 int 11 regular {fifo 0}  }
	{ bayerPhase_val11 int 16 regular {fifo 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "imgRB", "interface" : "fifo", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "imgRgb", "interface" : "fifo", "bitwidth" : 30, "direction" : "WRITEONLY"} , 
 	{ "Name" : "height_val4", "interface" : "fifo", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "width_val8", "interface" : "fifo", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "bayerPhase_val11", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ imgRB_dout sc_in sc_lv 30 signal 0 } 
	{ imgRB_empty_n sc_in sc_logic 1 signal 0 } 
	{ imgRB_read sc_out sc_logic 1 signal 0 } 
	{ imgRB_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ imgRB_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ imgRgb_din sc_out sc_lv 30 signal 1 } 
	{ imgRgb_full_n sc_in sc_logic 1 signal 1 } 
	{ imgRgb_write sc_out sc_logic 1 signal 1 } 
	{ imgRgb_num_data_valid sc_in sc_lv 32 signal 1 } 
	{ imgRgb_fifo_cap sc_in sc_lv 32 signal 1 } 
	{ height_val4_dout sc_in sc_lv 11 signal 2 } 
	{ height_val4_empty_n sc_in sc_logic 1 signal 2 } 
	{ height_val4_read sc_out sc_logic 1 signal 2 } 
	{ height_val4_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ height_val4_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ width_val8_dout sc_in sc_lv 11 signal 3 } 
	{ width_val8_empty_n sc_in sc_logic 1 signal 3 } 
	{ width_val8_read sc_out sc_logic 1 signal 3 } 
	{ width_val8_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ width_val8_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ bayerPhase_val11_dout sc_in sc_lv 16 signal 4 } 
	{ bayerPhase_val11_empty_n sc_in sc_logic 1 signal 4 } 
	{ bayerPhase_val11_read sc_out sc_logic 1 signal 4 } 
	{ bayerPhase_val11_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ bayerPhase_val11_fifo_cap sc_in sc_lv 3 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
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
 	{ "name": "height_val4_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "height_val4", "role": "dout" }} , 
 	{ "name": "height_val4_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "height_val4", "role": "empty_n" }} , 
 	{ "name": "height_val4_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "height_val4", "role": "read" }} , 
 	{ "name": "height_val4_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "height_val4", "role": "num_data_valid" }} , 
 	{ "name": "height_val4_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "height_val4", "role": "fifo_cap" }} , 
 	{ "name": "width_val8_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "width_val8", "role": "dout" }} , 
 	{ "name": "width_val8_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "width_val8", "role": "empty_n" }} , 
 	{ "name": "width_val8_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "width_val8", "role": "read" }} , 
 	{ "name": "width_val8_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "width_val8", "role": "num_data_valid" }} , 
 	{ "name": "width_val8_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "width_val8", "role": "fifo_cap" }} , 
 	{ "name": "bayerPhase_val11_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "bayerPhase_val11", "role": "dout" }} , 
 	{ "name": "bayerPhase_val11_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bayerPhase_val11", "role": "empty_n" }} , 
 	{ "name": "bayerPhase_val11_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bayerPhase_val11", "role": "read" }} , 
 	{ "name": "bayerPhase_val11_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bayerPhase_val11", "role": "num_data_valid" }} , 
 	{ "name": "bayerPhase_val11_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bayerPhase_val11", "role": "fifo_cap" }}  ]}

set ArgLastReadFirstWriteLatency {
	DebayerRandBatG {
		imgRB {Type I LastRead 1 FirstWrite -1}
		imgRgb {Type O LastRead -1 FirstWrite 4}
		height_val4 {Type I LastRead 0 FirstWrite -1}
		width_val8 {Type I LastRead 0 FirstWrite -1}
		bayerPhase_val11 {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "10", "Max" : "2085250"}
	, {"Name" : "Interval", "Min" : "10", "Max" : "2085250"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	imgRB { ap_fifo {  { imgRB_dout fifo_data_out 0 30 }  { imgRB_empty_n fifo_status_empty 0 1 }  { imgRB_read fifo_data_in 1 1 }  { imgRB_num_data_valid fifo_update 0 3 }  { imgRB_fifo_cap fifo_data 0 3 } } }
	imgRgb { ap_fifo {  { imgRgb_din fifo_data_out 1 30 }  { imgRgb_full_n fifo_status_empty 0 1 }  { imgRgb_write fifo_data_in 1 1 }  { imgRgb_num_data_valid fifo_update 0 32 }  { imgRgb_fifo_cap fifo_data 0 32 } } }
	height_val4 { ap_fifo {  { height_val4_dout fifo_data_out 0 11 }  { height_val4_empty_n fifo_status_empty 0 1 }  { height_val4_read fifo_data_in 1 1 }  { height_val4_num_data_valid fifo_update 0 3 }  { height_val4_fifo_cap fifo_data 0 3 } } }
	width_val8 { ap_fifo {  { width_val8_dout fifo_data_out 0 11 }  { width_val8_empty_n fifo_status_empty 0 1 }  { width_val8_read fifo_data_in 1 1 }  { width_val8_num_data_valid fifo_update 0 3 }  { width_val8_fifo_cap fifo_data 0 3 } } }
	bayerPhase_val11 { ap_fifo {  { bayerPhase_val11_dout fifo_data_out 0 16 }  { bayerPhase_val11_empty_n fifo_status_empty 0 1 }  { bayerPhase_val11_read fifo_data_in 1 1 }  { bayerPhase_val11_num_data_valid fifo_update 0 3 }  { bayerPhase_val11_fifo_cap fifo_data 0 3 } } }
}
