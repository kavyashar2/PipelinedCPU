`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: Arithmetic Logic Unit

module alu(A, B, Sel, Out, N, Z);
    input[31:0] A, B; // 32 bit inputs
    input [3:0] Sel; // 4 bit select
    output reg [31:0] Out; // 32 bit output
    output reg N, Z; // flags
    
    always@ (A, B, Sel)
    
    
    begin // loop which selects as operation to do based on the select
        if(Sel == 4'b0001) // add
            Out = A + B;
        if (Sel == 4'b0010) // negate
            Out = ~B + 1;
        if (Sel == 4'b0011) // subtract
            Out = B-A;
        if (Sel == 4'b0100) // pass value
            Out = A;
    end
    
    
    always@ (Out)
    
    begin
        
        if(Out == 0) // sets flag to true if avlue is zero
            Z = 1;
        else if (Out != 0) // false if not zero
            Z = 0;
        if (Out[31] == 1) // if NSB is one then it is negative
            N = 1;
        else if (Out[31] == 0) // not negative if otherwise
            N = 0;
         
    end
    
endmodule