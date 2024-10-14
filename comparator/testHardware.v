`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2024 12:09:48
// Design Name: 
// Module Name: hcTest
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


module hcTest;
    reg [3:0] a;
    reg [3:0] b;
    wire aGt;
    wire aEq;
    wire aLs;

    hardwareComp #(.N(4)) uut (
        .a(a),
        .b(b),
        .aGt(aGt),
        .aEq(aEq),
        .aLs(aLs)
    );

    initial begin
        a = 4'b1010; b = 4'b0101; #10; // a > b
        a = 4'b0101; b = 4'b1010; #10; // a < b
        a = 4'b1001; b = 4'b1001; #10; // a == b
        // $finish;
    end
endmodule
