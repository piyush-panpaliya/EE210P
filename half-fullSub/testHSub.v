`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2024 15:20:16
// Design Name: 
// Module Name: hsub
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test2;
    reg a,b;
    wire d, br;

    hsub testHSub(
        .a(a),
        .b(b),
        .d(d),
        .br(br)
    );

    initial begin
        a = 0; b = 0; #10; 
        a = 0; b = 1; #10; 
        a = 1; b = 0; #10; 
        a = 1; b = 1; #10; 
    end
endmodule
   