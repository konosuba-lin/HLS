# 1 "C:/Users/user/Desktop/HLS/course-labA/Interface_Synthesis/lab2/adders_io.c"
# 1 "C:/Users/user/Desktop/HLS/course-labA/Interface_Synthesis/lab2/adders_io.c" 1
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 147 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Users/user/Desktop/HLS/course-labA/Interface_Synthesis/lab2/adders_io.c" 2
# 46 "C:/Users/user/Desktop/HLS/course-labA/Interface_Synthesis/lab2/adders_io.c"
# 1 "C:/Users/user/Desktop/HLS/course-labA/Interface_Synthesis/lab2/adders_io.h" 1
# 49 "C:/Users/user/Desktop/HLS/course-labA/Interface_Synthesis/lab2/adders_io.h"
void adders_io(int in1, int in2, int *in_out1);
# 47 "C:/Users/user/Desktop/HLS/course-labA/Interface_Synthesis/lab2/adders_io.c" 2

void adders_io(int in1, int in2, int *in_out1) {
#pragma HLS INTERFACE mode=ap_hs port=in_out1
#pragma HLS INTERFACE mode=ap_vld port=in2
#pragma HLS INTERFACE mode=ap_vld port=in1

 *in_out1 = in1 + in2 + *in_out1;


}
