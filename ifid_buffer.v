`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: IF/ID Buffer

module ifid_buffer(instr_in, PC_in, clock, reset, instr_out, PC_out);
    input [31:0] instr_in;
    input [31:0] PC_in;
    input clock, reset;
    output reg [31:0] instr_out;
    output reg [31:0] PC_out;
    
    always@ (negedge clock)begin
        if (reset) begin
            instr_out <= 32'b0;
            PC_out <= 32'b0;
        end else begin
            PC_out <= PC_in;
            instr_out <= instr_in;
        end
    end
    
endmodule