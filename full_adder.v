`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: Full Adder

module full_adder(A, B, cout, sum);
    
input [31:0] A, B;
output cout;
output [31:0] sum;

wire [31:0] couts;

assign couts[0] = 0;
one_bit_adder add1(A[0], B[0], 1'b0, couts[1], sum[0]);
one_bit_adder add2(A[1], B[1], couts[1], couts[2], sum[1]);
one_bit_adder add3(A[2], B[2], couts[2], couts[3], sum[2]);
one_bit_adder add4(A[3], B[3], couts[3], couts[4], sum[3]);
one_bit_adder add5(A[4], B[4], couts[4], couts[5], sum[4]);
one_bit_adder add6(A[5], B[5], couts[5], couts[6], sum[5]);
one_bit_adder add7(A[6], B[6], couts[6], couts[7], sum[6]);
one_bit_adder add8(A[7], B[7], couts[7], couts[8], sum[7]);
one_bit_adder add9(A[8], B[8], couts[8], couts[9], sum[8]);
one_bit_adder add10(A[9], B[9], couts[9], couts[10], sum[9]);
one_bit_adder add11(A[10], B[10], couts[10], couts[11], sum[10]);
one_bit_adder add12(A[11], B[11], couts[11], couts[12], sum[11]);
one_bit_adder add13(A[12], B[12], couts[12], couts[13], sum[12]);
one_bit_adder add14(A[13], B[13], couts[13], couts[14], sum[13]);
one_bit_adder add15(A[14], B[14], couts[14], couts[15], sum[14]);
one_bit_adder add16(A[15], B[15], couts[15], couts[16], sum[15]);
one_bit_adder add17(A[16], B[16], couts[16], couts[17], sum[16]);
one_bit_adder add18(A[17], B[17], couts[17], couts[18], sum[17]);
one_bit_adder add19(A[18], B[18], couts[18], couts[19], sum[18]);
one_bit_adder add20(A[19], B[19], couts[19], couts[20], sum[19]);
one_bit_adder add21(A[20], B[20], couts[20], couts[21], sum[20]);
one_bit_adder add22(A[21], B[21], couts[21], couts[22], sum[21]);
one_bit_adder add23(A[22], B[22], couts[22], couts[23], sum[22]);
one_bit_adder add24(A[23], B[23], couts[23], couts[24], sum[23]);
one_bit_adder add25(A[24], B[24], couts[24], couts[25], sum[24]);
one_bit_adder add26(A[25], B[25], couts[25], couts[26], sum[25]);
one_bit_adder add27(A[26], B[26], couts[26], couts[27], sum[26]);
one_bit_adder add28(A[27], B[27], couts[27], couts[28], sum[27]);
one_bit_adder add29(A[28], B[28], couts[28], couts[29], sum[28]);
one_bit_adder add30(A[29], B[29], couts[29], couts[30], sum[29]);
one_bit_adder add31(A[30], B[30], couts[30], couts[31], sum[30]);
one_bit_adder add32(A[31], B[31], couts[31], cout, sum[31]);
    
endmodule
