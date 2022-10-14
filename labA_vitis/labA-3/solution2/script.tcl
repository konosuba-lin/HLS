############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project labA-3
set_top array_io
add_files ../course-labA/Interface_Synthesis/lab3/array_io.h
add_files ../course-labA/Interface_Synthesis/lab3/array_io.c
add_files -tb ../course-labA/Interface_Synthesis/lab3/result.golden.dat -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../course-labA/Interface_Synthesis/lab3/array_io_test.c -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution2" -flow_target vivado
set_part {xcvu9p-flgb2104-1-e}
create_clock -period 4 -name default
source "./labA-3/solution2/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -format ip_catalog
