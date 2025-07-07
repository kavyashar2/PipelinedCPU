`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: Data Memory

module data_memory(address, in, clock, read, write, out);
    reg [31:0] data [65535:0];
    input [31:0] address;
    input [31:0] in;
    input clock, read, write;
    output reg [31:0] out;
    
    initial
    begin
        data[2] = 31;
        data[3] = 1024;
        data[4] = 9;
        data[5] = -2048;
        data[6] = 10;
        
        data[2048] = 60; // for Jump Memory testing
    end
    
    always@ (posedge clock)
        begin
            if (read == 1)
                out = data[address];
            else if (write == 1)
                data[address] = in;
        end
endmodule