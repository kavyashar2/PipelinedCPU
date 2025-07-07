`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: ID/EX Buffer

module idex_buffer(RegWrite_in, MemToReg_in, BranchN_in, BranchZ_in, Jump_in, JumpMem_in, PCToReg_in, LoadStore_in, MemRead_in, MemWrite_in, ALUSrc_in, ALUOp_in, PC_in, rs_in, rt_in, y_in, rd_in, clock, reset, RegWrite_out, MemToReg_out, BranchN_out, BranchZ_out, Jump_out, JumpMem_out, PCToReg_out, LoadStore_out, MemRead_out, MemWrite_out, ALUSrc_out, ALUOp_out, PC_out, rs_out, rt_out, y_out, rd_out);
    input clock, reset;
    // control
    input RegWrite_in, MemToReg_in, BranchN_in, BranchZ_in, Jump_in, JumpMem_in, PCToReg_in, LoadStore_in, MemRead_in, MemWrite_in, ALUSrc_in;
    output reg RegWrite_out, MemToReg_out, BranchN_out, BranchZ_out,Jump_out, JumpMem_out, PCToReg_out, LoadStore_out, MemRead_out, MemWrite_out, ALUSrc_out;
    input [3:0] ALUOp_in;
    output reg [3:0] ALUOp_out;
    // misc
    input [31:0] PC_in, rs_in, rt_in, y_in;
    output reg [31:0] PC_out;
    input [5:0] rd_in;
    output reg [31:0] rs_out, rt_out, y_out;
    output reg [5:0] rd_out;
    
    
    always@ (negedge clock)begin
        if (reset) begin
            RegWrite_out <= 0;
            MemToReg_out <= 0;
            BranchN_out <= 0;
            BranchZ_out <= 0;
            Jump_out <= 0;
            JumpMem_out <= 0;
            PCToReg_out <= 0;
            LoadStore_out <= 0;
            MemRead_out <= 0;
            MemWrite_out <= 0;
            ALUSrc_out <= 0;
            ALUOp_out <= 4'b0;
            PC_out <= 32'b0;
            rs_out <= 32'b0;
            rt_out <= 32'b0;
            y_out <= 32'b0;
            rd_out <= 6'b0;
        
        end else begin
            RegWrite_out <= RegWrite_in;
            MemToReg_out <= MemToReg_in;
            BranchN_out <= BranchN_in;
            BranchZ_out <= BranchZ_in;
            Jump_out <= Jump_in;
            JumpMem_out <= JumpMem_in;
            PCToReg_out <= PCToReg_in;
            LoadStore_out <= LoadStore_in;
            MemRead_out <= MemRead_in;
            MemWrite_out <= MemWrite_in;
            ALUSrc_out <= ALUSrc_in;
            ALUOp_out <= ALUOp_in;
            PC_out <= PC_in;
            rs_out <= rs_in;
            rt_out <= rt_in;
            y_out <= y_in;
            rd_out <= rd_in;
        end
    end
    
endmodule