`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/11/25
// CSEN 122L Final Project: SCU ISA
// Description: Test Bench

module datapath( input reset, input wire clock);
    
    wire [31:0] instrAdder, mux1Out, instr, outInstr, PCOut;
    wire cout1;
    
    wire [31:0] if_PCOut, rsOut_out, rtOut_out, extendedNum, id_extendedNum, id_PCOut, id_rsOut_out, id_rtOut_out;
    
    wire memRead, memWrite, regWrite, memtoReg, PCtoReg, branchN, branchZ, jump, jumpMem, aluSrc, loadStore, immSignal;
    wire [3:0] aluOp;
    wire [5:0] outRegD, ex_outRegD;
    
    wire id_regWrite, id_memRead, id_memWrite, id_memtoReg, id_PCtoReg, id_branchN, id_branchZ, id_jump, id_jumpMem, id_aluSrc, id_loadStore;
    wire [3:0] id_aluOp;
    wire [31:0] mux2Out, mux3Out, mux4Out, mux5Out, alu2Out, ex_alu2Out;
    wire [31:0] dataOutMem, dataOutMem_out;
    wire or1Out, Z, N, ex_memtoReg, ex_regWrite;
    
    wire ex_N, ex_Z;
    
    wire [31:0] mux6Out;
    
    
    
    //if/id stage
	mux test (
		.A(instrAdder),
		.B(mux2Out),
		.sel(or1Out),
		.out(mux1Out)
	);
    program_counter test1 (
		.PCin(mux1Out), 
		.PCout(PCOut), 
		.clock(clock), 
		.reset(reset)
	);
    instruction_memory test2 (
		.address(PCOut), 
		.clock(clock), 
		.instrOut(instr)
	);
    //alu test3 ({24'b0000_0000_0000_0000, PCOut}, 1, 4'b0, instrAdder, N, Z);
    full_adder add1(
		.A(PCOut), 
		.B(32'b1), 
		.cout(cout1), 
		.sum(instrAdder)
	);
    ifid_buffer test4 (
		.instr_in(instr), 
		.PC_in(PCOut), 
		.clock(clock), 
		.reset(reset), 
		.instr_out(outInstr), 
		.PC_out(if_PCOut)
	);
    
    //id/ex stage
    control_unit test5 (
		.opcode(outInstr[31:28]), 
		.regWrite(regWrite), 
		.memtoReg(memtoReg), 
		.PCtoReg(PCtoReg), 
		.branchN(branchN), 
		.branchZ(branchZ), 
		.loadStore(loadStore), 
		.jump(jump), 
		.jumpMem(jumpMem), 
		.aluOp(aluOp), 
		.aluSrc(aluSrc), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.immGen(immSignal)
	);
    register_file test6 (
		.wrt(ex_regWrite), 
		.rs(outInstr[21:16]), 
		.rt(outInstr[15:10]), 
		.rd(ex_outRegD), 
		.dataIn(mux6Out), 
		.rsOut(rsOut_out), 
		.rtOut(rtOut_out), 
		.clk(clock)
	);
    immediate_generator test7 (
		.instr(outInstr), 
		.immSignal(immSignal),
		.immOut(extendedNum)
	);
	
    idex_buffer test8 (
        .RegWrite_in(regWrite),
		.MemToReg_in(memtoReg),
		.BranchN_in(branchN),
		.BranchZ_in(branchZ),
		.Jump_in(jump),
		.JumpMem_in(jumpMem), 
		.PCToReg_in(PCtoReg), 
		.LoadStore_in(loadStore), 
		.MemRead_in(memRead), 
		.MemWrite_in(memWrite), 
		.ALUSrc_in(aluSrc), 
		.ALUOp_in(aluOp), 
		.PC_in(if_PCOut), 
		.rs_in(rsOut_out), 
		.rt_in(rtOut_out), 
		.y_in(extendedNum), 
		.rd_in(outInstr[27:22]), 
		.clock(clock), 
		.reset(reset), 
		.RegWrite_out(id_regWrite),
		.MemToReg_out(id_memtoReg),
		.BranchN_out(id_branchN),
		.BranchZ_out(id_branchZ),
		.Jump_out(id_jump), 
		.JumpMem_out(id_jumpMem), 
		.PCToReg_out(id_PCtoReg), 
		.LoadStore_out(id_loadStore),
		.MemRead_out(id_memRead), 
		.MemWrite_out(id_memWrite), 
		.ALUSrc_out(id_aluSrc), 
		.ALUOp_out(id_aluOp), 
		.PC_out(id_PCOut), 
		.rs_out(id_rsOut_out), 
		.rt_out(id_rtOut_out), 
		.y_out(id_extendedNum), 
		.rd_out(outRegD)
	);

    
    //ex/mem stage
    mux test9 (
		.A(id_rtOut_out), 
		.B(id_extendedNum), 
		.sel(id_aluSrc), 
		.out(mux4Out)
	);
    mux test10 (
		.A(mux4Out), 
		.B(id_rsOut_out), 
		.sel(id_loadStore), 
		.out(mux5Out)
	);
    mux test11 (
		.A(id_rsOut_out), 
		.B(id_PCOut), 
		.sel(id_PCtoReg), 
		.out(mux3Out)
	);
    alu test12 (
		.A(mux5Out), 
		.B(mux3Out), 
		.Sel(id_aluOp), 
		.Out(alu2Out), 
		.N(N), 
		.Z(Z)
	);
	logic_gates test15 (
		.Jump(id_jump), 
		.N(ex_N), 
		.Z(ex_Z), 
		.BranchN(id_branchN), 
		.BranchZ(id_branchZ), 
		.out(or1Out)
	);
    data_memory test13 (
		.address(alu2Out), 
		.in(id_rtOut_out), 
		.clock(clock), 
		.read(id_memRead), 
		.write(id_memWrite), 
		.out(dataOutMem)
	);
    mux test14 (
		.A(id_rsOut_out), 
		.B(dataOutMem), 
		.sel(id_jumpMem), 
		.out(mux2Out)
	);
    
    
    exwb_buffer test16 (
        .RegWrite_in(id_regWrite),
		.MemToReg_in(id_memtoReg), 
		.readData_in(dataOutMem), 
		.rd_in(outRegD), 
		.aluResult_in(alu2Out),
		.aluN_in(N),
		.aluZ_in(Z),
		.clock(clock), 
		.reset(reset), 
		.RegWrite_out(ex_regWrite),
		.MemToReg_out(ex_memtoReg), 
		.readData_out(dataOutMem_out), 
		.rd_out(ex_outRegD), 
		.aluResult_out(ex_alu2Out),
		.aluN_out(ex_N),
		.aluZ_out(ex_Z)
	);
    
    mux test17 (
		.A(ex_alu2Out), 
		.B(dataOutMem_out), 
		.sel(ex_memtoReg), 
		.out(mux6Out)
	);
    
    
endmodule