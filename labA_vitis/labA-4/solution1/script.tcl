############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project labA-4
set_top axi_interfaces
add_files ../course-labA/Interface_Synthesis/lab4/axi_interfaces.c
add_files ../course-labA/Interface_Synthesis/lab4/axi_interfaces.h
add_files -tb ../course-labA/Interface_Synthesis/lab4/axi_interfaces_test.c
add_files -tb ../course-labA/Interface_Synthesis/lab4/result.golden.dat
open_solution "solution1" -flow_target vivado
set_part {xcvu9p-flgb2104-1-e}
create_clock -period 4 -name default
source "./labA-4/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -rtl verilog -format ip_catalog
