`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2024 12:09:48
// Design Name: 
// Module Name: tcTest
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
module tcTest;
    parameter N = 4;

    reg [N-1:0] a;
    reg [N-1:0] b;

    wire aGt;
    wire aEq;
    wire aLs;

    timeComp #(N) uut (
        .a(a),
        .b(b),
        .aGt(aGt),
        .aEq(aEq),
        .aLs(aLs)
    );

    initial begin
        a = 0;
        b = 0;

        #10 a = 4'b0001; b = 4'b0000; 
        #10 a = 4'b0010; b = 4'b0010; 
        #10 a = 4'b0011; b = 4'b0100; 
        #10 a = 4'b1111; b = 4'b0000; 
        #10 a = 4'b0000; b = 4'b1111; 
        #10 a = 4'b1010; b = 4'b1010; 

        // #10 $finish;
    end

endmodule