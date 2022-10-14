############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project labA-1
set_top adders
add_files ../course-labA/Interface_Synthesis/lab1/adders.c
add_files ../course-labA/Interface_Synthesis/lab1/adders.h
add_files -tb ../course-labA/Interface_Synthesis/lab1/adders_test.c
open_solution "solution1" -flow_target vivado
set_part {xcvu9p-flgb2104-1-e}
create_clock -period 3.25 -name default
source "./labA-1/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -format ip_catalog
