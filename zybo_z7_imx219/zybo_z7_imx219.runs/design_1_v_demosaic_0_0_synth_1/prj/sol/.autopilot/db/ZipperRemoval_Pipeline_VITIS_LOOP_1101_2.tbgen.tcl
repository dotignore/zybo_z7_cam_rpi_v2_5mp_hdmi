set moduleName ZipperRemoval_Pipeline_VITIS_LOOP_1101_2
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
set C_modelName {ZipperRemoval_Pipeline_VITIS_LOOP_1101_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ p_0_0_0501703_lcssa716741 int 10 regular  }
	{ p_0_0_0502701_lcssa714739 int 10 regular  }
	{ p_0_0_0503705_lcssa712737 int 10 regular  }
	{ conv2_i_i_lcssa735 int 7 regular  }
	{ width_val int 16 regular {ap_stable 0} }
	{ loopWidth int 17 regular {ap_stable 0} }
	{ imgRgb int 30 regular {fifo 0 volatile }  }
	{ imgUnzip int 30 regular {fifo 1 volatile }  }
	{ p_0_0_0504_1715_out int 10 regular {pointer 1}  }
	{ p_0_0_0505_1713_out int 10 regular {pointer 1}  }
	{ p_0_0_0506_1711_out int 10 regular {pointer 1}  }
	{ p_0_0_0504_1709_out int 10 regular {pointer 2}  }
	{ p_0_0_0505_1708_out int 10 regular {pointer 2}  }
	{ p_0_0_0506_1707_out int 10 regular {pointer 2}  }
	{ p_0_0_0507_1706_out int 10 regular {pointer 2}  }
	{ phi_ln1132_out int 7 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "p_0_0_0501703_lcssa716741", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0502701_lcssa714739", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0503705_lcssa712737", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "conv2_i_i_lcssa735", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "width_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "loopWidth", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "imgRgb", "interface" : "fifo", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "imgUnzip", "interface" : "fifo", "bitwidth" : 30, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0504_1715_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0505_1713_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0506_1711_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0504_1709_out", "interface" : "wire", "bitwidth" : 10, "direction" : "READWRITE"} , 
 	{ "Name" : "p_0_0_0505_1708_out", "interface" : "wire", "bitwidth" : 10, "direction" : "READWRITE"} , 
 	{ "Name" : "p_0_0_0506_1707_out", "interface" : "wire", "bitwidth" : 10, "direction" : "READWRITE"} , 
 	{ "Name" : "p_0_0_0507_1706_out", "interface" : "wire", "bitwidth" : 10, "direction" : "READWRITE"} , 
 	{ "Name" : "phi_ln1132_out", "interface" : "wire", "bitwidth" : 7, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 42
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ imgRgb_dout sc_in sc_lv 30 signal 6 } 
	{ imgRgb_empty_n sc_in sc_logic 1 signal 6 } 
	{ imgRgb_read sc_out sc_logic 1 signal 6 } 
	{ imgRgb_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ imgRgb_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ imgUnzip_din sc_out sc_lv 30 signal 7 } 
	{ imgUnzip_full_n sc_in sc_logic 1 signal 7 } 
	{ imgUnzip_write sc_out sc_logic 1 signal 7 } 
	{ imgUnzip_num_data_valid sc_in sc_lv 32 signal 7 } 
	{ imgUnzip_fifo_cap sc_in sc_lv 32 signal 7 } 
	{ p_0_0_0501703_lcssa716741 sc_in sc_lv 10 signal 0 } 
	{ p_0_0_0502701_lcssa714739 sc_in sc_lv 10 signal 1 } 
	{ p_0_0_0503705_lcssa712737 sc_in sc_lv 10 signal 2 } 
	{ conv2_i_i_lcssa735 sc_in sc_lv 7 signal 3 } 
	{ width_val sc_in sc_lv 16 signal 4 } 
	{ loopWidth sc_in sc_lv 17 signal 5 } 
	{ p_0_0_0504_1715_out sc_out sc_lv 10 signal 8 } 
	{ p_0_0_0504_1715_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ p_0_0_0505_1713_out sc_out sc_lv 10 signal 9 } 
	{ p_0_0_0505_1713_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ p_0_0_0506_1711_out sc_out sc_lv 10 signal 10 } 
	{ p_0_0_0506_1711_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ p_0_0_0504_1709_out_i sc_in sc_lv 10 signal 11 } 
	{ p_0_0_0504_1709_out_o sc_out sc_lv 10 signal 11 } 
	{ p_0_0_0504_1709_out_o_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ p_0_0_0505_1708_out_i sc_in sc_lv 10 signal 12 } 
	{ p_0_0_0505_1708_out_o sc_out sc_lv 10 signal 12 } 
	{ p_0_0_0505_1708_out_o_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ p_0_0_0506_1707_out_i sc_in sc_lv 10 signal 13 } 
	{ p_0_0_0506_1707_out_o sc_out sc_lv 10 signal 13 } 
	{ p_0_0_0506_1707_out_o_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ p_0_0_0507_1706_out_i sc_in sc_lv 10 signal 14 } 
	{ p_0_0_0507_1706_out_o sc_out sc_lv 10 signal 14 } 
	{ p_0_0_0507_1706_out_o_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ phi_ln1132_out sc_out sc_lv 7 signal 15 } 
	{ phi_ln1132_out_ap_vld sc_out sc_logic 1 outvld 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
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
 	{ "name": "p_0_0_0501703_lcssa716741", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0501703_lcssa716741", "role": "default" }} , 
 	{ "name": "p_0_0_0502701_lcssa714739", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0502701_lcssa714739", "role": "default" }} , 
 	{ "name": "p_0_0_0503705_lcssa712737", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0503705_lcssa712737", "role": "default" }} , 
 	{ "name": "conv2_i_i_lcssa735", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "conv2_i_i_lcssa735", "role": "default" }} , 
 	{ "name": "width_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "width_val", "role": "default" }} , 
 	{ "name": "loopWidth", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "loopWidth", "role": "default" }} , 
 	{ "name": "p_0_0_0504_1715_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0504_1715_out", "role": "default" }} , 
 	{ "name": "p_0_0_0504_1715_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0504_1715_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0505_1713_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0505_1713_out", "role": "default" }} , 
 	{ "name": "p_0_0_0505_1713_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0505_1713_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0506_1711_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0506_1711_out", "role": "default" }} , 
 	{ "name": "p_0_0_0506_1711_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0506_1711_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0504_1709_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0504_1709_out", "role": "i" }} , 
 	{ "name": "p_0_0_0504_1709_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0504_1709_out", "role": "o" }} , 
 	{ "name": "p_0_0_0504_1709_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0504_1709_out", "role": "o_ap_vld" }} , 
 	{ "name": "p_0_0_0505_1708_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0505_1708_out", "role": "i" }} , 
 	{ "name": "p_0_0_0505_1708_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0505_1708_out", "role": "o" }} , 
 	{ "name": "p_0_0_0505_1708_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0505_1708_out", "role": "o_ap_vld" }} , 
 	{ "name": "p_0_0_0506_1707_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0506_1707_out", "role": "i" }} , 
 	{ "name": "p_0_0_0506_1707_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0506_1707_out", "role": "o" }} , 
 	{ "name": "p_0_0_0506_1707_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0506_1707_out", "role": "o_ap_vld" }} , 
 	{ "name": "p_0_0_0507_1706_out_i", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0507_1706_out", "role": "i" }} , 
 	{ "name": "p_0_0_0507_1706_out_o", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_0_0_0507_1706_out", "role": "o" }} , 
 	{ "name": "p_0_0_0507_1706_out_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0507_1706_out", "role": "o_ap_vld" }} , 
 	{ "name": "phi_ln1132_out", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "phi_ln1132_out", "role": "default" }} , 
 	{ "name": "phi_ln1132_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "phi_ln1132_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "5", "Max" : "65540"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "65537"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p_0_0_0501703_lcssa716741 { ap_none {  { p_0_0_0501703_lcssa716741 in_data 0 10 } } }
	p_0_0_0502701_lcssa714739 { ap_none {  { p_0_0_0502701_lcssa714739 in_data 0 10 } } }
	p_0_0_0503705_lcssa712737 { ap_none {  { p_0_0_0503705_lcssa712737 in_data 0 10 } } }
	conv2_i_i_lcssa735 { ap_none {  { conv2_i_i_lcssa735 in_data 0 7 } } }
	width_val { ap_stable {  { width_val in_data 0 16 } } }
	loopWidth { ap_stable {  { loopWidth in_data 0 17 } } }
	imgRgb { ap_fifo {  { imgRgb_dout fifo_data_out 0 30 }  { imgRgb_empty_n fifo_status_empty 0 1 }  { imgRgb_read fifo_data_in 1 1 }  { imgRgb_num_data_valid fifo_update 0 3 }  { imgRgb_fifo_cap fifo_data 0 3 } } }
	imgUnzip { ap_fifo {  { imgUnzip_din fifo_data_out 1 30 }  { imgUnzip_full_n fifo_status_empty 0 1 }  { imgUnzip_write fifo_data_in 1 1 }  { imgUnzip_num_data_valid fifo_update 0 32 }  { imgUnzip_fifo_cap fifo_data 0 32 } } }
	p_0_0_0504_1715_out { ap_vld {  { p_0_0_0504_1715_out out_data 1 10 }  { p_0_0_0504_1715_out_ap_vld out_vld 1 1 } } }
	p_0_0_0505_1713_out { ap_vld {  { p_0_0_0505_1713_out out_data 1 10 }  { p_0_0_0505_1713_out_ap_vld out_vld 1 1 } } }
	p_0_0_0506_1711_out { ap_vld {  { p_0_0_0506_1711_out out_data 1 10 }  { p_0_0_0506_1711_out_ap_vld out_vld 1 1 } } }
	p_0_0_0504_1709_out { ap_ovld {  { p_0_0_0504_1709_out_i in_data 0 10 }  { p_0_0_0504_1709_out_o out_data 1 10 }  { p_0_0_0504_1709_out_o_ap_vld out_vld 1 1 } } }
	p_0_0_0505_1708_out { ap_ovld {  { p_0_0_0505_1708_out_i in_data 0 10 }  { p_0_0_0505_1708_out_o out_data 1 10 }  { p_0_0_0505_1708_out_o_ap_vld out_vld 1 1 } } }
	p_0_0_0506_1707_out { ap_ovld {  { p_0_0_0506_1707_out_i in_data 0 10 }  { p_0_0_0506_1707_out_o out_data 1 10 }  { p_0_0_0506_1707_out_o_ap_vld out_vld 1 1 } } }
	p_0_0_0507_1706_out { ap_ovld {  { p_0_0_0507_1706_out_i in_data 0 10 }  { p_0_0_0507_1706_out_o out_data 1 10 }  { p_0_0_0507_1706_out_o_ap_vld out_vld 1 1 } } }
	phi_ln1132_out { ap_vld {  { phi_ln1132_out out_data 1 7 }  { phi_ln1132_out_ap_vld out_vld 1 1 } } }
}
