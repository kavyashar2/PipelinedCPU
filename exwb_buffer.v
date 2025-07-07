`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: EX/WB Buffer

module exwb_buffer(RegWrite_in, MemToReg_in, readData_in, rd_in, aluResult_in, aluN_in, aluZ_in, clock, reset, RegWrite_out, MemToReg_out, readData_out, rd_out, aluResult_out, aluN_out, aluZ_out);
    input clock, reset;
    
	input MemToReg_in, RegWrite_in;
	output reg MemToReg_out, RegWrite_out;
    input [31:0] readData_in;
    output reg [31:0] readData_out;
	input [31:0] aluResult_in;
    output reg [31:0] aluResult_out;
    input aluN_in, aluZ_in;
    output reg aluN_out, aluZ_out;
    
    input [5:0] rd_in;
    output reg[5:0] rd_out;
   
    
    always@ (negedge clock)begin
        if (reset) begin
            aluResult_out <= 32'b0;
            aluN_out <= 0;
            aluZ_out <= 0;
            readData_out <= 32'b0;
            rd_out <= 6'b0;
            MemToReg_out <= 0;
            RegWrite_out <= 0;
        
        end else begin
            aluResult_out <= aluResult_in;
            aluN_out <= aluN_in;
            aluZ_out <= aluZ_in;
            readData_out <= readData_in;
            rd_out <= rd_in;
            MemToReg_out <= MemToReg_in;
            RegWrite_out <= RegWrite_in;
        end
    end
    
endmodule