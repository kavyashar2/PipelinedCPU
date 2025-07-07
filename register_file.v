`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: Register File

module register_file(
    wrt, rs, rt, rd, dataIn, rsOut, rtOut, clk
    );
    input wrt, clk;
    input [5:0] rs, rt, rd;
    input [31:0] dataIn;
    output reg [31:0] rsOut, rtOut;
   
    reg [31:0] registers[63:0];
    
    initial begin
        registers[0] = 0;
        registers[7] = 2;
        registers[11] = 5;
    end
    
//    always@ (*) begin
//        rsOut = registers[rs];
//        rtOut = registers[rt];
//    end

    always@(posedge clk) begin
        if (wrt) begin
            registers[rd] = dataIn;
        end
    
        rsOut = registers[rs];
        rtOut = registers[rt];
    
        //if (wrt) begin
            //registers[rd] = dataIn;
        //end
    end
endmodule