set moduleName ZipperRemoval
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
set C_modelName {ZipperRemoval}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ imgRgb int 30 regular {fifo 0 volatile }  }
	{ imgUnzip int 30 regular {fifo 1 volatile }  }
	{ height_val int 16 regular {ap_stable 0} }
	{ width_val int 16 regular {ap_stable 0} }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "imgRgb", "interface" : "fifo", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "imgUnzip", "interface" : "fifo", "bitwidth" : 30, "direction" : "WRITEONLY"} , 
 	{ "Name" : "height_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "width_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 22
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
	{ imgRgb_dout sc_in sc_lv 30 signal 0 } 
	{ imgRgb_empty_n sc_in sc_logic 1 signal 0 } 
	{ imgRgb_read sc_out sc_logic 1 signal 0 } 
	{ imgRgb_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ imgRgb_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ imgUnzip_din sc_out sc_lv 30 signal 1 } 
	{ imgUnzip_full_n sc_in sc_logic 1 signal 1 } 
	{ imgUnzip_write sc_out sc_logic 1 signal 1 } 
	{ imgUnzip_num_data_valid sc_in sc_lv 32 signal 1 } 
	{ imgUnzip_fifo_cap sc_in sc_lv 32 signal 1 } 
	{ height_val sc_in sc_lv 16 signal 2 } 
	{ width_val sc_in sc_lv 16 signal 3 } 
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
 	{ "name": "imgRgb_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "imgRgb", "role": "dout" }} , 
 	{ "name": "imgRgb_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgRgb", "role": "empty_n" }} , 
 	{ "name": "imgRgb_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgRgb", "role": "read" }} , 
 	{ "name": "imgRgb_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "imgRgb", "role": "num_data_valid" }} , 
 	{ "name": "imgRgb_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "imgRgb", "role": "fifo_cap" }} , 
 	{ "name": "imgUnzip_din", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "imgUnzip", "role": "din" }} , 
 	{ "name": "imgUnzip_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgUnzip", "role": "full_n" }} , 
 	{ "name": "imgUnzip_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgUnzip", "role": "write" }} , 
 	{ "name": "imgUnzip_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imgUnzip", "role": "num_data_valid" }} , 
 	{ "name": "imgUnzip_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imgUnzip", "role": "fifo_cap" }} , 
 	{ "name": "height_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "height_val", "role": "default" }} , 
 	{ "name": "width_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "width_val", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	ZipperRemoval {
		imgRgb {Type I LastRead 1 FirstWrite -1}
		imgUnzip {Type O LastRead -1 FirstWrite 3}
		height_val {Type I LastRead 0 FirstWrite -1}
		width_val {Type I LastRead 0 FirstWrite -1}}
	ZipperRemoval_Pipeline_VITIS_LOOP_1101_2 {
		p_0_0_0501703_lcssa716741 {Type I LastRead 0 FirstWrite -1}
		p_0_0_0502701_lcssa714739 {Type I LastRead 0 FirstWrite -1}
		p_0_0_0503705_lcssa712737 {Type I LastRead 0 FirstWrite -1}
		conv2_i_i_lcssa735 {Type I LastRead 0 FirstWrite -1}
		width_val {Type I LastRead 0 FirstWrite -1}
		loopWidth {Type I LastRead 0 FirstWrite -1}
		imgRgb {Type I LastRead 1 FirstWrite -1}
		imgUnzip {Type O LastRead -1 FirstWrite 3}
		p_0_0_0504_1715_out {Type O LastRead -1 FirstWrite 2}
		p_0_0_0505_1713_out {Type O LastRead -1 FirstWrite 2}
		p_0_0_0506_1711_out {Type O LastRead -1 FirstWrite 2}
		p_0_0_0504_1709_out {Type IO LastRead 2 FirstWrite 2}
		p_0_0_0505_1708_out {Type IO LastRead 2 FirstWrite 2}
		p_0_0_0506_1707_out {Type IO LastRead 2 FirstWrite 2}
		p_0_0_0507_1706_out {Type IO LastRead 3 FirstWrite 3}
		phi_ln1132_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "4295360506"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "4295360506"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	imgRgb { ap_fifo {  { imgRgb_dout fifo_data_out 0 30 }  { imgRgb_empty_n fifo_status_empty 0 1 }  { imgRgb_read fifo_data_in 1 1 }  { imgRgb_num_data_valid fifo_update 0 3 }  { imgRgb_fifo_cap fifo_data 0 3 } } }
	imgUnzip { ap_fifo {  { imgUnzip_din fifo_data_out 1 30 }  { imgUnzip_full_n fifo_status_empty 0 1 }  { imgUnzip_write fifo_data_in 1 1 }  { imgUnzip_num_data_valid fifo_update 0 32 }  { imgUnzip_fifo_cap fifo_data 0 32 } } }
	height_val { ap_none {  { height_val in_data 0 16 } } }
	width_val { ap_none {  { width_val in_data 0 16 } } }
}
