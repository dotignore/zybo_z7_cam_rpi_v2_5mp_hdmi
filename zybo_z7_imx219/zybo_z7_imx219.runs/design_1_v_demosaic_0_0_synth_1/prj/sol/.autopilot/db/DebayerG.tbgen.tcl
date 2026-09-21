set moduleName DebayerG
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
set C_modelName {DebayerG}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ imgBayer int 10 regular {fifo 0 volatile }  }
	{ imgG int 30 regular {fifo 1 volatile }  }
	{ height_val int 16 regular {ap_stable 0} }
	{ width_val int 16 regular {ap_stable 0} }
	{ bayerPhase_val int 16 regular {fifo 0}  }
	{ height_val4_c3 int 11 regular {fifo 1}  }
	{ width_val8_c4 int 11 regular {fifo 1}  }
	{ bayerPhase_val11_c5 int 16 regular {fifo 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "imgBayer", "interface" : "fifo", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "imgG", "interface" : "fifo", "bitwidth" : 30, "direction" : "WRITEONLY"} , 
 	{ "Name" : "height_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "width_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "bayerPhase_val", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "height_val4_c3", "interface" : "fifo", "bitwidth" : 11, "direction" : "WRITEONLY"} , 
 	{ "Name" : "width_val8_c4", "interface" : "fifo", "bitwidth" : 11, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bayerPhase_val11_c5", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 42
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
	{ imgBayer_dout sc_in sc_lv 10 signal 0 } 
	{ imgBayer_empty_n sc_in sc_logic 1 signal 0 } 
	{ imgBayer_read sc_out sc_logic 1 signal 0 } 
	{ imgBayer_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ imgBayer_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ imgG_din sc_out sc_lv 30 signal 1 } 
	{ imgG_full_n sc_in sc_logic 1 signal 1 } 
	{ imgG_write sc_out sc_logic 1 signal 1 } 
	{ imgG_num_data_valid sc_in sc_lv 32 signal 1 } 
	{ imgG_fifo_cap sc_in sc_lv 32 signal 1 } 
	{ height_val sc_in sc_lv 16 signal 2 } 
	{ width_val sc_in sc_lv 16 signal 3 } 
	{ bayerPhase_val_dout sc_in sc_lv 16 signal 4 } 
	{ bayerPhase_val_empty_n sc_in sc_logic 1 signal 4 } 
	{ bayerPhase_val_read sc_out sc_logic 1 signal 4 } 
	{ bayerPhase_val_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ bayerPhase_val_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ height_val4_c3_din sc_out sc_lv 11 signal 5 } 
	{ height_val4_c3_full_n sc_in sc_logic 1 signal 5 } 
	{ height_val4_c3_write sc_out sc_logic 1 signal 5 } 
	{ height_val4_c3_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ height_val4_c3_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ width_val8_c4_din sc_out sc_lv 11 signal 6 } 
	{ width_val8_c4_full_n sc_in sc_logic 1 signal 6 } 
	{ width_val8_c4_write sc_out sc_logic 1 signal 6 } 
	{ width_val8_c4_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ width_val8_c4_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ bayerPhase_val11_c5_din sc_out sc_lv 16 signal 7 } 
	{ bayerPhase_val11_c5_full_n sc_in sc_logic 1 signal 7 } 
	{ bayerPhase_val11_c5_write sc_out sc_logic 1 signal 7 } 
	{ bayerPhase_val11_c5_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ bayerPhase_val11_c5_fifo_cap sc_in sc_lv 3 signal 7 } 
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
 	{ "name": "imgBayer_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "imgBayer", "role": "dout" }} , 
 	{ "name": "imgBayer_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgBayer", "role": "empty_n" }} , 
 	{ "name": "imgBayer_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgBayer", "role": "read" }} , 
 	{ "name": "imgBayer_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "imgBayer", "role": "num_data_valid" }} , 
 	{ "name": "imgBayer_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "imgBayer", "role": "fifo_cap" }} , 
 	{ "name": "imgG_din", "direction": "out", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "imgG", "role": "din" }} , 
 	{ "name": "imgG_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgG", "role": "full_n" }} , 
 	{ "name": "imgG_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgG", "role": "write" }} , 
 	{ "name": "imgG_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imgG", "role": "num_data_valid" }} , 
 	{ "name": "imgG_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "imgG", "role": "fifo_cap" }} , 
 	{ "name": "height_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "height_val", "role": "default" }} , 
 	{ "name": "width_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "width_val", "role": "default" }} , 
 	{ "name": "bayerPhase_val_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "bayerPhase_val", "role": "dout" }} , 
 	{ "name": "bayerPhase_val_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bayerPhase_val", "role": "empty_n" }} , 
 	{ "name": "bayerPhase_val_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bayerPhase_val", "role": "read" }} , 
 	{ "name": "bayerPhase_val_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bayerPhase_val", "role": "num_data_valid" }} , 
 	{ "name": "bayerPhase_val_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bayerPhase_val", "role": "fifo_cap" }} , 
 	{ "name": "height_val4_c3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "height_val4_c3", "role": "din" }} , 
 	{ "name": "height_val4_c3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "height_val4_c3", "role": "full_n" }} , 
 	{ "name": "height_val4_c3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "height_val4_c3", "role": "write" }} , 
 	{ "name": "height_val4_c3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "height_val4_c3", "role": "num_data_valid" }} , 
 	{ "name": "height_val4_c3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "height_val4_c3", "role": "fifo_cap" }} , 
 	{ "name": "width_val8_c4_din", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "width_val8_c4", "role": "din" }} , 
 	{ "name": "width_val8_c4_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "width_val8_c4", "role": "full_n" }} , 
 	{ "name": "width_val8_c4_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "width_val8_c4", "role": "write" }} , 
 	{ "name": "width_val8_c4_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "width_val8_c4", "role": "num_data_valid" }} , 
 	{ "name": "width_val8_c4_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "width_val8_c4", "role": "fifo_cap" }} , 
 	{ "name": "bayerPhase_val11_c5_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "bayerPhase_val11_c5", "role": "din" }} , 
 	{ "name": "bayerPhase_val11_c5_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bayerPhase_val11_c5", "role": "full_n" }} , 
 	{ "name": "bayerPhase_val11_c5_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bayerPhase_val11_c5", "role": "write" }} , 
 	{ "name": "bayerPhase_val11_c5_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bayerPhase_val11_c5", "role": "num_data_valid" }} , 
 	{ "name": "bayerPhase_val11_c5_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "bayerPhase_val11_c5", "role": "fifo_cap" }}  ]}

set ArgLastReadFirstWriteLatency {
	DebayerG {
		imgBayer {Type I LastRead 1 FirstWrite -1}
		imgG {Type O LastRead -1 FirstWrite 14}
		height_val {Type I LastRead 0 FirstWrite -1}
		width_val {Type I LastRead 0 FirstWrite -1}
		bayerPhase_val {Type I LastRead 0 FirstWrite -1}
		height_val4_c3 {Type O LastRead -1 FirstWrite 0}
		width_val8_c4 {Type O LastRead -1 FirstWrite 0}
		bayerPhase_val11_c5 {Type O LastRead -1 FirstWrite 0}
		DIV1_TABLE {Type I LastRead -1 FirstWrite -1}
		DIV2_TABLE {Type I LastRead -1 FirstWrite -1}}
	DebayerG_Pipeline_VITIS_LOOP_318_4 {
		p_lcssa52315241 {Type I LastRead 0 FirstWrite -1}
		p_lcssa52305239 {Type I LastRead 0 FirstWrite -1}
		p_lcssa52295237 {Type I LastRead 0 FirstWrite -1}
		p_lcssa52285235 {Type I LastRead 0 FirstWrite -1}
		p_lcssa52275233 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50685110 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50675108 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50655106 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50645104 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50635102 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50615100 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50605098 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50595096 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50575094 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50565092 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50555090 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50535088 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50525086 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50515084 {Type I LastRead 0 FirstWrite -1}
		p_lcssa50495082 {Type I LastRead 0 FirstWrite -1}
		height_val {Type I LastRead 0 FirstWrite -1}
		y {Type I LastRead 0 FirstWrite -1}
		width_val {Type I LastRead 0 FirstWrite -1}
		empty_56 {Type I LastRead 0 FirstWrite -1}
		trunc_ln {Type I LastRead 0 FirstWrite -1}
		loopWidth {Type I LastRead 0 FirstWrite -1}
		imgG {Type O LastRead -1 FirstWrite 14}
		empty {Type I LastRead 0 FirstWrite -1}
		xor_ln439 {Type I LastRead 0 FirstWrite -1}
		out_y {Type I LastRead 0 FirstWrite -1}
		imgBayer {Type I LastRead 1 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 13}
		p_out1 {Type O LastRead -1 FirstWrite 13}
		p_out2 {Type O LastRead -1 FirstWrite 13}
		p_out3 {Type O LastRead -1 FirstWrite 13}
		p_out4 {Type O LastRead -1 FirstWrite 13}
		p_out5 {Type O LastRead -1 FirstWrite 13}
		p_out6 {Type O LastRead -1 FirstWrite 13}
		p_out7 {Type O LastRead -1 FirstWrite 13}
		p_out8 {Type O LastRead -1 FirstWrite 13}
		p_out9 {Type O LastRead -1 FirstWrite 13}
		p_out10 {Type O LastRead -1 FirstWrite 13}
		p_out11 {Type O LastRead -1 FirstWrite 13}
		p_out12 {Type O LastRead -1 FirstWrite 13}
		p_out13 {Type O LastRead -1 FirstWrite 13}
		p_out14 {Type O LastRead -1 FirstWrite 13}
		p_out15 {Type O LastRead -1 FirstWrite 13}
		p_out16 {Type O LastRead -1 FirstWrite 13}
		p_out17 {Type O LastRead -1 FirstWrite 13}
		p_out18 {Type O LastRead -1 FirstWrite 13}
		p_out19 {Type O LastRead -1 FirstWrite 13}
		DIV1_TABLE {Type I LastRead -1 FirstWrite -1}
		DIV2_TABLE {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "41", "Max" : "4296278036"}
	, {"Name" : "Interval", "Min" : "41", "Max" : "4296278036"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	imgBayer { ap_fifo {  { imgBayer_dout fifo_data_out 0 10 }  { imgBayer_empty_n fifo_status_empty 0 1 }  { imgBayer_read fifo_data_in 1 1 }  { imgBayer_num_data_valid fifo_update 0 3 }  { imgBayer_fifo_cap fifo_data 0 3 } } }
	imgG { ap_fifo {  { imgG_din fifo_data_out 1 30 }  { imgG_full_n fifo_status_empty 0 1 }  { imgG_write fifo_data_in 1 1 }  { imgG_num_data_valid fifo_update 0 32 }  { imgG_fifo_cap fifo_data 0 32 } } }
	height_val { ap_stable {  { height_val in_data 0 16 } } }
	width_val { ap_stable {  { width_val in_data 0 16 } } }
	bayerPhase_val { ap_fifo {  { bayerPhase_val_dout fifo_data_out 0 16 }  { bayerPhase_val_empty_n fifo_status_empty 0 1 }  { bayerPhase_val_read fifo_data_in 1 1 }  { bayerPhase_val_num_data_valid fifo_update 0 3 }  { bayerPhase_val_fifo_cap fifo_data 0 3 } } }
	height_val4_c3 { ap_fifo {  { height_val4_c3_din fifo_data_out 1 11 }  { height_val4_c3_full_n fifo_status_empty 0 1 }  { height_val4_c3_write fifo_data_in 1 1 }  { height_val4_c3_num_data_valid fifo_update 0 3 }  { height_val4_c3_fifo_cap fifo_data 0 3 } } }
	width_val8_c4 { ap_fifo {  { width_val8_c4_din fifo_data_out 1 11 }  { width_val8_c4_full_n fifo_status_empty 0 1 }  { width_val8_c4_write fifo_data_in 1 1 }  { width_val8_c4_num_data_valid fifo_update 0 3 }  { width_val8_c4_fifo_cap fifo_data 0 3 } } }
	bayerPhase_val11_c5 { ap_fifo {  { bayerPhase_val11_c5_din fifo_data_out 1 16 }  { bayerPhase_val11_c5_full_n fifo_status_empty 0 1 }  { bayerPhase_val11_c5_write fifo_data_in 1 1 }  { bayerPhase_val11_c5_num_data_valid fifo_update 0 3 }  { bayerPhase_val11_c5_fifo_cap fifo_data 0 3 } } }
}
