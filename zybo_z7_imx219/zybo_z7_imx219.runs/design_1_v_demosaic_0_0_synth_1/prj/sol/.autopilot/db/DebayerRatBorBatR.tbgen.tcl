set moduleName DebayerRatBorBatR
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
set C_modelName {DebayerRatBorBatR}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ imgG int 30 regular {fifo 0 volatile }  }
	{ imgRB int 30 regular {fifo 1 volatile }  }
	{ height_val4 int 11 regular {fifo 0}  }
	{ width_val8 int 11 regular {fifo 0}  }
	{ bayerPhase_val11 int 16 regular {fifo 0}  }
	{ height_val4_c int 11 regular {fifo 1}  }
	{ width_val8_c int 11 regular {fifo 1}  }
	{ bayerPhase_val11_c int 16 regular {fifo 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "imgG", "interface" : "fifo", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "imgRB", "interface" : "fifo", "bitwidth" : 30, "direction" : "WRITEONLY"} , 
 	{ "Name" : "height_val4", "interface" : "fifo", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "width_val8", "interface" : "fifo", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "bayerPhase_val11", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "height_val4_c", "interface" : "fifo", "bitwidth" : 11, "direction" : "WRITEONLY"} , 
 	{ "Name" : "width_val8_c", "interface" : "fifo", "bitwidth" : 11, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bayerPhase_val11_c", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 50
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ imgG_dout sc_in sc_lv 30 signal 0 } 
	{ imgG_empty_n sc_in sc_logic 1 signal 0 } 
	{ imgG_read sc_out sc_logic 1 signal 0 } 
	{ imgG_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ imgG_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ imgRB_din sc_out sc_lv 30 signal 1 } 
	{ imgRB_full_n sc_in sc_logic 1 signal 1 } 
	{ imgRB_write sc_out sc_logic 1 signal 1 } 
	{ imgRB_num_data_valid sc_in sc_lv 32 signal 1 } 
	{ imgRB_fifo_cap sc_in sc_lv 32 signal 1 } 
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
	{ height_val4_c_din sc_out sc_lv 11 signal 5 } 
	{ height_val4_c_full_n sc_in sc_logic 1 signal 5 } 
	{ height_val4_c_write sc_out sc_logic 1 signal 5 } 
	{ height_val4_c_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ height_val4_c_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ width_val8_c_din sc_out sc_lv 11 signal 6 } 
	{ width_val8_c_full_n sc_in sc_logic 1 signal 6 } 
	{ width_val8_c_write sc_out sc_logic 1 signal 6 } 
	{ width_val8_c_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ width_val8_c_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ bayerPhase_val11_c_din sc_out sc_lv 16 signal 7 } 
	{ bayerPhase_val11_c_full_n sc_in sc_logic 1 signal 7 } 
	{ bayerPhase_val11_c_write sc_out sc_logic 1 signal 7 } 
	{ bayerPhase_val11_c_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ bayerPhase_val11_c_fifo_cap sc_in sc_lv 3 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
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
 	{ "name": "bayerPhase_val11_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bayerPhase_val11", "role": "fifo_cap" }} , 
 	{ "name": "height_val4_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "height_val4_c", "role": "din" }} , 
 	{ "name": "height_val4_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "height_val4_c", "role": "full_n" }} , 
 	{ "name": "height_val4_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "height_val4_c", "role": "write" }} , 
 	{ "name": "height_val4_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "height_val4_c", "role": "num_data_valid" }} , 
 	{ "name": "height_val4_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "height_val4_c", "role": "fifo_cap" }} , 
 	{ "name": "width_val8_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "width_val8_c", "role": "din" }} , 
 	{ "name": "width_val8_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "width_val8_c", "role": "full_n" }} , 
 	{ "name": "width_val8_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "width_val8_c", "role": "write" }} , 
 	{ "name": "width_val8_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "width_val8_c", "role": "num_data_valid" }} , 
 	{ "name": "width_val8_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "width_val8_c", "role": "fifo_cap" }} , 
 	{ "name": "bayerPhase_val11_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "bayerPhase_val11_c", "role": "din" }} , 
 	{ "name": "bayerPhase_val11_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bayerPhase_val11_c", "role": "full_n" }} , 
 	{ "name": "bayerPhase_val11_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bayerPhase_val11_c", "role": "write" }} , 
 	{ "name": "bayerPhase_val11_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bayerPhase_val11_c", "role": "num_data_valid" }} , 
 	{ "name": "bayerPhase_val11_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bayerPhase_val11_c", "role": "fifo_cap" }}  ]}

set ArgLastReadFirstWriteLatency {
	DebayerRatBorBatR {
		imgG {Type I LastRead 1 FirstWrite -1}
		imgRB {Type O LastRead -1 FirstWrite 6}
		height_val4 {Type I LastRead 0 FirstWrite -1}
		width_val8 {Type I LastRead 0 FirstWrite -1}
		bayerPhase_val11 {Type I LastRead 0 FirstWrite -1}
		height_val4_c {Type O LastRead -1 FirstWrite 0}
		width_val8_c {Type O LastRead -1 FirstWrite 0}
		bayerPhase_val11_c {Type O LastRead -1 FirstWrite 0}}
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
	{"Name" : "Latency", "Min" : "12", "Max" : "2087412"}
	, {"Name" : "Interval", "Min" : "12", "Max" : "2087412"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	imgG { ap_fifo {  { imgG_dout fifo_data_out 0 30 }  { imgG_empty_n fifo_status_empty 0 1 }  { imgG_read fifo_data_in 1 1 }  { imgG_num_data_valid fifo_update 0 3 }  { imgG_fifo_cap fifo_data 0 3 } } }
	imgRB { ap_fifo {  { imgRB_din fifo_data_out 1 30 }  { imgRB_full_n fifo_status_empty 0 1 }  { imgRB_write fifo_data_in 1 1 }  { imgRB_num_data_valid fifo_update 0 32 }  { imgRB_fifo_cap fifo_data 0 32 } } }
	height_val4 { ap_fifo {  { height_val4_dout fifo_data_out 0 11 }  { height_val4_empty_n fifo_status_empty 0 1 }  { height_val4_read fifo_data_in 1 1 }  { height_val4_num_data_valid fifo_update 0 3 }  { height_val4_fifo_cap fifo_data 0 3 } } }
	width_val8 { ap_fifo {  { width_val8_dout fifo_data_out 0 11 }  { width_val8_empty_n fifo_status_empty 0 1 }  { width_val8_read fifo_data_in 1 1 }  { width_val8_num_data_valid fifo_update 0 3 }  { width_val8_fifo_cap fifo_data 0 3 } } }
	bayerPhase_val11 { ap_fifo {  { bayerPhase_val11_dout fifo_data_out 0 16 }  { bayerPhase_val11_empty_n fifo_status_empty 0 1 }  { bayerPhase_val11_read fifo_data_in 1 1 }  { bayerPhase_val11_num_data_valid fifo_update 0 3 }  { bayerPhase_val11_fifo_cap fifo_data 0 3 } } }
	height_val4_c { ap_fifo {  { height_val4_c_din fifo_data_out 1 11 }  { height_val4_c_full_n fifo_status_empty 0 1 }  { height_val4_c_write fifo_data_in 1 1 }  { height_val4_c_num_data_valid fifo_update 0 3 }  { height_val4_c_fifo_cap fifo_data 0 3 } } }
	width_val8_c { ap_fifo {  { width_val8_c_din fifo_data_out 1 11 }  { width_val8_c_full_n fifo_status_empty 0 1 }  { width_val8_c_write fifo_data_in 1 1 }  { width_val8_c_num_data_valid fifo_update 0 3 }  { width_val8_c_fifo_cap fifo_data 0 3 } } }
	bayerPhase_val11_c { ap_fifo {  { bayerPhase_val11_c_din fifo_data_out 1 16 }  { bayerPhase_val11_c_full_n fifo_status_empty 0 1 }  { bayerPhase_val11_c_write fifo_data_in 1 1 }  { bayerPhase_val11_c_num_data_valid fifo_update 0 3 }  { bayerPhase_val11_c_fifo_cap fifo_data 0 3 } } }
}
