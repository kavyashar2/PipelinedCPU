`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: Control Unit

module control_unit(opcode, regWrite, memtoReg, PCtoReg, branchN, branchZ, loadStore, jump, jumpMem, aluOp, aluSrc, memRead, memWrite, immGen);
input [3:0] opcode;
output reg [3:0] aluOp;
output reg regWrite, memtoReg, PCtoReg, branchN, branchZ, jump, jumpMem, memRead, memWrite, aluSrc, loadStore, immGen;

always@ (*)
begin
if (opcode == 4'b0000) // no operation
begin
    regWrite = 0;
    memtoReg = 0;
    PCtoReg = 0;
    branchN = 0;
    branchZ = 0;
    jump = 0;
    jumpMem = 0;
    memRead = 0;
    memWrite = 0;
    loadStore = 0;
    aluSrc = 0;
    immGen = 0;
    aluOp = 4'b0000;//010
end


if (opcode == 4'b1111) // Save PC
begin
    regWrite = 1;
    memtoReg = 0;
    PCtoReg = 1;
    branchN = 0;
    branchZ = 0;
    jump = 0;
    jumpMem = 0;
    memRead = 0;
    memWrite = 0;
    loadStore = 0;
    aluSrc = 1;
    immGen = 0;
    aluOp = 4'b0001; //000
end

if (opcode == 4'b1110) // load
begin
    regWrite = 1;
    memtoReg = 1;
    PCtoReg = 0;
    branchN = 0;
    branchZ = 0;
    jump = 0;
    jumpMem = 0;
    memRead = 1;
    memWrite = 0;
    loadStore = 1;
    aluSrc = 0;
    immGen = 0;
    aluOp = 4'b0100; //111
end

if (opcode == 4'b0011) // store
begin
    regWrite = 0;
    memtoReg = 0;
    PCtoReg = 0;
    branchN = 0;
    branchZ = 0;
    jump = 0;
    jumpMem = 0;
    memRead = 0;
    memWrite = 1;
    loadStore = 1;
    aluSrc = 0;
    immGen = 0;
    aluOp = 4'b0100; //111
end

if (opcode == 4'b0100) // add
begin
    regWrite = 1;
    memtoReg = 0;
    PCtoReg = 0;
    branchN = 0;
    branchZ = 0;
    jump = 0;
    jumpMem = 0;
    memRead = 0;
    memWrite = 0;
    loadStore = 0;
    aluSrc = 0;
    immGen = 0;
    aluOp =4'b0001; //000
end

if (opcode == 4'b0101) // inc
begin
    regWrite = 1;
    memtoReg = 0;
    PCtoReg = 0;
    branchN = 0;
    branchZ = 0;
    jump = 0;
    jumpMem = 0;
    memRead = 0;
    memWrite = 0;
    loadStore = 0;
    aluSrc = 1;
    immGen = 1;
    aluOp = 4'b0001; //000
end

if (opcode == 4'b0110) // neg
begin
    regWrite = 1;
    memtoReg = 0;
    PCtoReg = 0;
    branchN = 0;
    branchZ = 0;
    jump = 0;
    jumpMem = 0;
    memRead = 0;
    memWrite = 0;
    loadStore = 0;
    aluSrc = 0;
    immGen = 0;
    aluOp = 4'b0010; //110
end


if (opcode == 4'b0111) // sub
begin
    regWrite = 1;
    memtoReg = 0;
    PCtoReg = 0;
    branchN = 0;
    branchZ = 0;
    jump = 0;
    jumpMem = 0;
    memRead = 0;
    memWrite = 0;
    loadStore = 0;
    aluSrc = 0;
    immGen = 0;
    aluOp = 4'b0011; //101
end

if (opcode == 4'b1000) // jump
begin
    regWrite = 0;
    memtoReg = 0;
    PCtoReg = 0;
    branchN = 0;
    branchZ = 0;
    jump = 1;
    jumpMem = 0;
    memRead = 0;
    memWrite = 0;
    loadStore = 0;
    aluSrc = 0;
    immGen = 0;
    aluOp = 4'b0000; //??? 010
end

if (opcode == 4'b1010) // jump mem
begin
    regWrite = 0;
    memtoReg = 0;
    PCtoReg = 0;
    branchN = 0;
    branchZ = 0;
    jump = 1;
    jumpMem = 1;
    memRead = 1;
    memWrite = 0;
    loadStore = 1;
    aluSrc = 0;
    immGen = 0;
    aluOp = 4'b0100; //111
end

if (opcode == 4'b1001) // branch zero
begin
    regWrite = 0;
    memtoReg = 0;
    PCtoReg = 0;
    branchN = 0;
    branchZ = 1;
    jump = 0;
    jumpMem = 0;
    memRead = 0;
    memWrite = 0;
    loadStore = 1;
    aluSrc = 0;
    immGen = 0;
    aluOp = 4'b0100; //111
end

if (opcode == 4'b1011) // branch negative
begin
    regWrite = 0;
    memtoReg = 0;
    PCtoReg = 0;
    branchN = 1;
    branchZ = 0;
    jump = 0;
    jumpMem = 0;
    memRead = 0;
    memWrite = 0;
    loadStore = 1;
    aluSrc = 0;
    immGen = 0;
    aluOp = 4'b0100; //111
end

end
endmodule
