/*
This is traditional 2-radix DIT FFT algorithm implementation.
INPUT:
	In_R, In_I[]: Real and Imag parts of Complex signal

OUTPUT:
	Out_R, Out_I[]: Real and Imag parts of Complex signal
*/

#include "fft.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

void bit_reverse(DTYPE X_R[SIZE], DTYPE X_I[SIZE], DTYPE OUT_R[SIZE], DTYPE OUT_I[SIZE]);
void fft_first(DTYPE X_R[SIZE], DTYPE X_I[SIZE], DTYPE OUT_R[SIZE], DTYPE OUT_I[SIZE]);
void fft_last(DTYPE X_R[SIZE], DTYPE X_I[SIZE], DTYPE OUT_R[SIZE], DTYPE OUT_I[SIZE]);
void fft_stages(int stage, DTYPE X_R[SIZE], DTYPE X_I[SIZE], DTYPE OUT_R[SIZE], DTYPE OUT_I[SIZE])
{
	//Write a code that computes any arbitary stages of the FFT
	//int DFTpts;
	//int numBF;
	int i,j;
	int i_lower;
	DTYPE temp_R;		//temporary storage complex variable
	DTYPE temp_I;		//temporary storage complex variable

	int t,step_t;
	int idx_higher, idx_lower;
	DTYPE sin_t,cos_t;
	step_t = (SIZE >> stage);
	t = 0;
	int n1,n2;
	n1 = (1 << (stage-1)); // 2^(stage-1) = (2^stage)/2
	n2 = (SIZE >> stage); // SIZE/2^stage
	butterfly:for(j=0; j<n1; j++)
	{
		DFTpts:for(i=0; i<n2; i ++)
		{
#pragma HLS PIPELINE
			sin_t = SIN[j*step_t];
			cos_t = COS[j*step_t];
			idx_higher = j + 2*i*n1;
			idx_lower = idx_higher + n1;
			temp_R = X_R[idx_lower]*cos_t- X_I[idx_lower]*sin_t;
			temp_I = X_I[idx_lower]*cos_t+ X_R[idx_lower]*sin_t;
			OUT_R[idx_lower] = X_R[idx_higher] - temp_R;
			OUT_I[idx_lower] = X_I[idx_higher] - temp_I;
			OUT_R[idx_higher] = X_R[idx_higher] + temp_R;
			OUT_I[idx_higher] = X_I[idx_higher] + temp_I;
		}
	}
}

void fft(DTYPE X_R[SIZE], DTYPE X_I[SIZE], DTYPE OUT_R[SIZE], DTYPE OUT_I[SIZE])
{
#pragma HLS INTERFACE mode=s_axilite port=return
#pragma HLS INTERFACE mode=m_axi port=OUT_R
#pragma HLS INTERFACE mode=m_axi port=OUT_I
#pragma HLS INTERFACE mode=m_axi port=X_I
#pragma HLS INTERFACE mode=m_axi port=X_R

#pragma HLS DATAFLOW

	DTYPE Stage_R0[SIZE],  Stage_I0[SIZE];
	DTYPE Stage_R1[SIZE],  Stage_I1[SIZE];
	DTYPE Stage_R2[SIZE],  Stage_I2[SIZE];
	DTYPE Stage_R3[SIZE],  Stage_I3[SIZE];
	DTYPE Stage_R4[SIZE],  Stage_I4[SIZE];
	DTYPE Stage_R5[SIZE],  Stage_I5[SIZE];
	DTYPE Stage_R6[SIZE],  Stage_I6[SIZE];
	DTYPE Stage_R7[SIZE],  Stage_I7[SIZE];
	DTYPE Stage_R8[SIZE],  Stage_I8[SIZE];
	DTYPE Stage_R9[SIZE],  Stage_I9[SIZE];
	bit_reverse(X_R, X_I, Stage_R0, Stage_I0);
	fft_first(Stage_R0, Stage_I0,Stage_R1, Stage_I1);
	fft_stages(2,Stage_R1, Stage_I1, Stage_R2, Stage_I2);
	fft_stages(3,Stage_R2, Stage_I2, Stage_R3, Stage_I3);
	fft_stages(4,Stage_R3, Stage_I3, Stage_R4, Stage_I4);
	fft_stages(5,Stage_R4, Stage_I4, Stage_R5, Stage_I5);
	fft_stages(6,Stage_R5, Stage_I5, Stage_R6, Stage_I6);
	fft_stages(7,Stage_R6, Stage_I6, Stage_R7, Stage_I7);
	fft_stages(8,Stage_R7, Stage_I7, Stage_R8, Stage_I8);
	fft_stages(9,Stage_R8, Stage_I8, Stage_R9, Stage_I9);
	fft_last(Stage_R9, Stage_I9,OUT_R,OUT_I);

}

void bit_reverse(DTYPE X_R[SIZE], DTYPE X_I[SIZE], DTYPE OUT_R[SIZE], DTYPE OUT_I[SIZE]){
	int tmp,l;
	bit_reverse:for(l=0;l<SIZE;l+=1)
	{
		tmp = ((l & 0x01) << 9) | ((l & 0x02) << 7) | ((l & 0x04) << 5) | ((l & 0x08) << 3) | ((l & 0x10) << 1) | ((l & 0x20) >> 1) | ((l & 0x40) >> 3) | ((l & 0x80) >> 5) | ((l & 0x100) >> 7) | ((l & 0x200) >> 9);
		OUT_R[l] = X_R[tmp];
		OUT_I[l] = X_I[tmp];
	}
}

/*void bit_reverse(DTYPE X_R[SIZE], DTYPE X_I[SIZE]){
	int l, temp_R, temp_I, idx1, idx2;
	bit_reverse:for(l=0;l<(2*REVERSE_N);l+=2)
	{
		idx1 = RE_pt[l];
		idx2 = RE_pt[l+1];
		assert(idx1!=idx2);
		temp_R = X_R[idx1];
		temp_I = X_I[idx1];
		X_R[idx1] = X_R[idx2];
		X_I[idx1] = X_I[idx2];
		X_R[idx2] = temp_R;
		X_I[idx2] = temp_I;
	}
}*/

/*void bit_reverse(DTYPE X_R[SIZE], DTYPE X_I[SIZE]){
	int l, temp_R, temp_I, tmp, tmp2;
	bit_reverse:for(l=0;l<SIZE;l++)
	{
		tmp = ((l & 0x01) << 9) | ((l & 0x02) << 7) | ((l & 0x04) << 5) | ((l & 0x08) << 3) | ((l & 0x10) << 1) | ((l & 0x20) >> 1) | ((l & 0x40) >> 3) | ((l & 0x80) >> 5) | ((l & 0x100) >> 7) | ((l & 0x200) >> 9);
		if(l<tmp)
		{
			temp_R = X_R[tmp];
			temp_I = X_I[tmp];
			X_R[tmp] = X_R[l];
			X_I[tmp] = X_I[l];
			X_R[l] = temp_R;
			X_I[l] = temp_I;
		}
	}
}*/

void fft_first(DTYPE X_R[SIZE], DTYPE X_I[SIZE], DTYPE OUT_R[SIZE], DTYPE OUT_I[SIZE]) {
	int i;
	//Write a code that computes any arbitary stages of the FFT
	DFTpts:for(i=0; i<SIZE; i += 2)
	{
		OUT_R[i+1] = X_R[i] - X_R[i+1];
		OUT_I[i+1] = X_I[i] - X_I[i+1];
		OUT_R[i] = X_R[i] + X_R[i+1];
		OUT_I[i] = X_I[i] + X_I[i+1];
	}
}

void fft_last(DTYPE X_R[SIZE], DTYPE X_I[SIZE], DTYPE OUT_R[SIZE], DTYPE OUT_I[SIZE]) {
	int j,j_lower;
	DTYPE temp_R;		/*temporary storage complex variable*/
	DTYPE temp_I;		/*temporary storage complex variable*/
	DTYPE sin_t,cos_t;

	butterfly:for(j=0; j<int(SIZE2); j++)
	{
		sin_t = SIN[j];
		cos_t = COS[j];
		j_lower = j + int(SIZE2);			//index of lower point in butterfly
		temp_R = X_R[j_lower]*cos_t- X_I[j_lower]*sin_t;
		temp_I = X_I[j_lower]*cos_t+ X_R[j_lower]*sin_t;

		OUT_R[j_lower] = X_R[j] - temp_R;
		OUT_I[j_lower] = X_I[j] - temp_I;
		OUT_R[j] = X_R[j] + temp_R;
		OUT_I[j] = X_I[j] + temp_I;
	}
}



