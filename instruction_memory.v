`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: Instruction Memory

module instruction_memory(address, clock, instrOut);
    wire[31:0] instr[255:0];
    input clock;
    input [31:0] address;
    output reg [31:0] instrOut;
    

    /*
    // Assumptions:
    // x7 - Base pointer for array a   --> 000111
    // x11 - a_length                   --> 001011
    // x5 - i                           --> 000101
    // x6 - Temp to hold i - n           --> 000110
    // x13 - Temp to hold a[i]
    // x10 - Min                         --> 001010
    // x8 - Address of loop branch      --> 001000
    // x9 - Address of newMin branch    --> 001001
    // x28 - Address of next branch     --> 011100
    // x29 - Address of done branch     --> 011101
    */

    // MIN PROGRAM
    assign instr[0] = 32'b1110_001010_000111_000000_0000000000;	// LD x10, x7
    assign instr[1] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[2] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[3] = 32'b0101_000101_000000_000001_0000000000;	// INC x5, x0, 1
    assign instr[4] = 32'b1111_001000_000000000100_0000000000;	// SVPC x8, 4
    assign instr[5] = 32'b1111_001001_000000011000_0000000000;	// SVPC x9, 24
    assign instr[6] = 32'b1111_011100_000000011000_0000000000;	// SVPC x28, 24
    assign instr[7] = 32'b1111_011101_000000011100_0000000000;	// SVPC x29, 28
    assign instr[8] = 32'b0111_000110_000101_001011_0000000000;	// SUB x6, x5, x11
    assign instr[9] = 32'b1001_000000_011101_000000_0000000000;	// BRZ x29
    assign instr[10] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[11] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[12] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[13] = 32'b0100_000110_000111_000101_0000000000;	// ADD x6, x7, x5
    assign instr[14] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[15] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[16] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[17] = 32'b1110_001100_000110_000000_0000000000;	// LD x12, x6
    assign instr[18] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[19] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[20] = 32'b0111_001101_001100_001010_0000000000;	// SUB x13, x12, x10
    assign instr[21] = 32'b1011_000000_001001_000000_0000000000;	// BRN x9
    assign instr[22] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[23] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[24] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[25] = 32'b1000_000000_011100_000000_0000000000;	// J x28
    assign instr[26] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[27] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[28] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[29] = 32'b0100_001010_001100_000000_0000000000;	// ADD x10, x12, x0
    assign instr[30] = 32'b0101_000101_000101_000001_0000000000;	// INC x5, x5, 1
    assign instr[31] = 32'b1000_000000_001000_000000_0000000000;	// J x8
    assign instr[32] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[33] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[34] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[35] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[36] = 32'b0110_001110_001010_000000_0000000000;	// NEG x14, x10
    assign instr[37] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[38] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[39] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[40] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[41] = 32'b0011_000000_000101_001110_0000000000;	// ST x14, x5
    assign instr[42] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[43] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[44] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[45] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[46] = 32'b1010_000000_001110_000000_0000000000;	// JM x14
    assign instr[47] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[48] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[49] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[50] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[51] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[52] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[53] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[54] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[55] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[56] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[57] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[58] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[59] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[60] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[61] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    assign instr[62] = 32'b0000_000000_000000_000000_0000000000;	// NOP
    
    always@(posedge clock) begin
        instrOut = instr[address];    
    end

endmodule

/*
// opcode (4 bits) | rd (6 bits) | rs (6 bits) | rt (6 bits) | unused(10 bits)
// INSTRUCTION GUIDE
NOP -->             32'b0000_000000_000000_000000_0000000000
SVPC rd, y -->      32'b1111_rd6_000000_y6_0000000000
LD rd, rs -->       32'b1110_rd6_rs6_000000_0000000000
ST rd, rs -->       32'b0011_rd6_rs6_000000_0000000000
ADD rd, rs, rt -->  32'b0100_rd6_rs6_rt6_0000000000
INC rd, rs, y -->   32'b0101_rd6_rs6_y6_0000000000
NEG rd, rs -->      32'b0110_rd6_rs6_000000_0000000000
SUB rd, rs, rt -->  32'b0111_rd6_rs6_rt6_0000000000
J rs -->            32'b1000_000000_rs6_000000_0000000000
JM rs -->           32'b1010_000000_rs6_000000_0000000000
BRZ rs -->          32'b1001_000000_rs6_000000_0000000000
BRN rs -->          32'b1011_000000_rs6_000000_0000000000
MIN rd, rs, rt-->   32'b0001_rd6_rs6_rt6_0000000000
*/