`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: 2;1 Multiplexer

module mux(A, B, sel,out);

// define variable types
input [31:0] A, B;
input sel;
output reg [31:0] out;

// out = (B & sel) | (A & ~sel);
always@(*)
begin
    if (sel)
        out = B;
    else
        out = A;
    end
    
endmodule