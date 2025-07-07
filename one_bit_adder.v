`timescale 1ns / 1ps

// Group: LMS
// Names: Lindsey Leong, Afra Mahammad, Kavya Sharma
// Date: 6/13/25
// CSEN 122L Final Project: SCU ISA
// Description: One Bit Adder

module one_bit_adder(A, B, cin, cout, out);
    input A,B,cin;
    output cout, out;
    
    wire out1,out2,out3;
    
    xor(out1, A, B);
    xor(out, out1, cin);
    
    and(out2, out1, cin);
    and(out3, A, B);
    or(cout, out2, out3);  
    
endmodule
