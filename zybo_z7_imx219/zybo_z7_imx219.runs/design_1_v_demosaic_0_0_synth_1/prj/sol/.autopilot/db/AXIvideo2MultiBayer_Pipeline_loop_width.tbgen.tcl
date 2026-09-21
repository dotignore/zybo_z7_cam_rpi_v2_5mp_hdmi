set moduleName AXIvideo2MultiBayer_Pipeline_loop_width
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
set C_modelName {AXIvideo2MultiBayer_Pipeline_loop_width}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ p_4_0_0_0105270_lcssa297 int 1 regular  }
	{ p_0_0_0_097263_lcssa281 int 10 regular  }
	{ sof_3 int 1 regular  }
	{ cols int 11 regular  }
	{ imgBayer int 10 regular {fifo 1 volatile }  }
	{ s_axis_video_V_data_V int 10 regular {axi_s 0 volatile  { s_axis_video Data } }  }
	{ s_axis_video_V_keep_V int 2 regular {axi_s 0 volatile  { s_axis_video Keep } }  }
	{ s_axis_video_V_strb_V int 2 regular {axi_s 0 volatile  { s_axis_video Strb } }  }
	{ s_axis_video_V_user_V int 1 regular {axi_s 0 volatile  { s_axis_video User } }  }
	{ s_axis_video_V_last_V int 1 regular {axi_s 0 volatile  { s_axis_video Last } }  }
	{ s_axis_video_V_id_V int 1 regular {axi_s 0 volatile  { s_axis_video ID } }  }
	{ s_axis_video_V_dest_V int 1 regular {axi_s 0 volatile  { s_axis_video Dest } }  }
	{ p_4_0_0_0105271_out int 1 regular {pointer 1}  }
	{ p_0_0_0_097262_out int 10 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "p_4_0_0_0105270_lcssa297", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0_097263_lcssa281", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "sof_3", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cols", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "imgBayer", "interface" : "fifo", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_axis_video_V_data_V", "interface" : "axis", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_keep_V", "interface" : "axis", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_strb_V", "interface" : "axis", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_video_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "p_4_0_0_0105271_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0_097262_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_video_TVALID sc_in sc_logic 1 invld 5 } 
	{ imgBayer_din sc_out sc_lv 10 signal 4 } 
	{ imgBayer_full_n sc_in sc_logic 1 signal 4 } 
	{ imgBayer_write sc_out sc_logic 1 signal 4 } 
	{ imgBayer_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ imgBayer_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ p_4_0_0_0105270_lcssa297 sc_in sc_lv 1 signal 0 } 
	{ p_0_0_0_097263_lcssa281 sc_in sc_lv 10 signal 1 } 
	{ sof_3 sc_in sc_lv 1 signal 2 } 
	{ cols sc_in sc_lv 11 signal 3 } 
	{ s_axis_video_TDATA sc_in sc_lv 10 signal 5 } 
	{ s_axis_video_TREADY sc_out sc_logic 1 inacc 11 } 
	{ s_axis_video_TKEEP sc_in sc_lv 2 signal 6 } 
	{ s_axis_video_TSTRB sc_in sc_lv 2 signal 7 } 
	{ s_axis_video_TUSER sc_in sc_lv 1 signal 8 } 
	{ s_axis_video_TLAST sc_in sc_lv 1 signal 9 } 
	{ s_axis_video_TID sc_in sc_lv 1 signal 10 } 
	{ s_axis_video_TDEST sc_in sc_lv 1 signal 11 } 
	{ p_4_0_0_0105271_out sc_out sc_lv 1 signal 12 } 
	{ p_4_0_0_0105271_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ p_0_0_0_097262_out sc_out sc_lv 10 signal 13 } 
	{ p_0_0_0_097262_out_ap_vld sc_out sc_logic 1 outvld 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_video_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_video_V_data_V", "role": "default" }} , 
 	{ "name": "imgBayer_din", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "imgBayer", "role": "din" }} , 
 	{ "name": "imgBayer_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgBayer", "role": "full_n" }} , 
 	{ "name": "imgBayer_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgBayer", "role": "write" }} , 
 	{ "name": "imgBayer_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "imgBayer", "role": "num_data_valid" }} , 
 	{ "name": "imgBayer_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "imgBayer", "role": "fifo_cap" }} , 
 	{ "name": "p_4_0_0_0105270_lcssa297", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_4_0_0_0105270_lcssa297", "role": "default" }} , 
 	{ "name": "p_0_0_0_097263_lcssa281", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0_097263_lcssa281", "role": "default" }} , 
 	{ "name": "sof_3", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "sof_3", "role": "default" }} , 
 	{ "name": "cols", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "cols", "role": "default" }} , 
 	{ "name": "s_axis_video_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "s_axis_video_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "s_axis_video_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "s_axis_video_V_strb_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_user_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_id_V", "role": "default" }} , 
 	{ "name": "s_axis_video_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_video_V_dest_V", "role": "default" }} , 
 	{ "name": "p_4_0_0_0105271_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_4_0_0_0105271_out", "role": "default" }} , 
 	{ "name": "p_4_0_0_0105271_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_4_0_0_0105271_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0_097262_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0_097262_out", "role": "default" }} , 
 	{ "name": "p_0_0_0_097262_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0_097262_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	AXIvideo2MultiBayer_Pipeline_loop_width {
		p_4_0_0_0105270_lcssa297 {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_097263_lcssa281 {Type I LastRead 0 FirstWrite -1}
		sof_3 {Type I LastRead 0 FirstWrite -1}
		cols {Type I LastRead 0 FirstWrite -1}
		imgBayer {Type O LastRead -1 FirstWrite 2}
		s_axis_video_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_video_V_dest_V {Type I LastRead 1 FirstWrite -1}
		p_4_0_0_0105271_out {Type O LastRead -1 FirstWrite 1}
		p_0_0_0_097262_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "1923"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1921"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p_4_0_0_0105270_lcssa297 { ap_none {  { p_4_0_0_0105270_lcssa297 in_data 0 1 } } }
	p_0_0_0_097263_lcssa281 { ap_none {  { p_0_0_0_097263_lcssa281 in_data 0 10 } } }
	sof_3 { ap_none {  { sof_3 in_data 0 1 } } }
	cols { ap_none {  { cols in_data 0 11 } } }
	imgBayer { ap_fifo {  { imgBayer_din fifo_data_out 1 10 }  { imgBayer_full_n fifo_status_empty 0 1 }  { imgBayer_write fifo_data_in 1 1 }  { imgBayer_num_data_valid fifo_update 0 3 }  { imgBayer_fifo_cap fifo_data 0 3 } } }
	s_axis_video_V_data_V { axis {  { s_axis_video_TVALID in_vld 0 1 }  { s_axis_video_TDATA in_data 0 10 } } }
	s_axis_video_V_keep_V { axis {  { s_axis_video_TKEEP in_data 0 2 } } }
	s_axis_video_V_strb_V { axis {  { s_axis_video_TSTRB in_data 0 2 } } }
	s_axis_video_V_user_V { axis {  { s_axis_video_TUSER in_data 0 1 } } }
	s_axis_video_V_last_V { axis {  { s_axis_video_TLAST in_data 0 1 } } }
	s_axis_video_V_id_V { axis {  { s_axis_video_TID in_data 0 1 } } }
	s_axis_video_V_dest_V { axis {  { s_axis_video_TREADY in_acc 1 1 }  { s_axis_video_TDEST in_data 0 1 } } }
	p_4_0_0_0105271_out { ap_vld {  { p_4_0_0_0105271_out out_data 1 1 }  { p_4_0_0_0105271_out_ap_vld out_vld 1 1 } } }
	p_0_0_0_097262_out { ap_vld {  { p_0_0_0_097262_out out_data 1 10 }  { p_0_0_0_097262_out_ap_vld out_vld 1 1 } } }
}
