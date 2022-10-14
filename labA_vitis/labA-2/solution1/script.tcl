############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project labA-2
set_top adders_io
add_files ../course-labA/Interface_Synthesis/lab2/adders_io.c
add_files ../course-labA/Interface_Synthesis/lab2/adders_io.h
add_files -tb ../course-labA/Interface_Synthesis/lab2/adders_io_test.c
open_solution "solution1" -flow_target vivado
set_part {xcvu9p-flgb2104-1-e}
create_clock -period 2 -name default
#source "./labA-2/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -format ip_catalog
