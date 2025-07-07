`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: Immediate Generator

module immediate_generator(instr, immSignal, immOut);
    input [31:0] instr;
    input immSignal;
    //input immSignal;
    output reg [31:0] immOut;
    
    always @(*) begin
        if (immSignal)
            immOut = {{16{instr[15]}}, instr[15:10]};
        else
            immOut = {{10{instr[21]}}, instr[21:10]};
    end
endmodule    