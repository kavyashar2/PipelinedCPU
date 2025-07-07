`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: Program Counter


module program_counter(PCin, PCout, clock, reset);
    input[31:0] PCin;
    input clock, reset;
    output reg [31:0] PCout;
    
    initial
    begin
        PCout = 32'b0;
    end
    
    always@ (negedge clock)begin
        if (reset)begin
            PCout <= 32'b0;
        end else begin
            PCout <= PCin;
        end
    end
    
endmodule