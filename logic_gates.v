`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: Logic Gates

module logic_gates(Jump, N, Z, BranchN, BranchZ, out);
    input Jump, N, Z, BranchN, BranchZ;
    output reg out;

    always@ (*) begin
	   out = (Z & BranchZ) | (N & BranchN) | Jump;
	end
endmodule