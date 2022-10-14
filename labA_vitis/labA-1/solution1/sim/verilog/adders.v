// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="adders_adders,hls_ip_2022_1,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu9p-flgb2104-1-e,HLS_INPUT_CLOCK=3.250000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=0.907000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=64,HLS_VERSION=2022_1}" *)

module adders (
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        in1,
        in2,
        in3,
        ap_return
);


input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] in1;
input  [31:0] in2;
input  [31:0] in3;
output  [31:0] ap_return;

wire   [31:0] add_ln50_fu_44_p2;
wire    ap_ce_reg;

assign add_ln50_fu_44_p2 = (in1 + in3);

assign ap_done = ap_start;

assign ap_idle = 1'b1;

assign ap_ready = ap_start;

assign ap_return = (add_ln50_fu_44_p2 + in2);

endmodule //adders
