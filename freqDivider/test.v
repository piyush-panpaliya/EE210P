`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2024 12:34:35
// Design Name: 
// Module Name: test
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

module testBench;
    reg clk;
    reg reset;
    wire out1;
    wire out2;

    parameter integer N1 = 8;
    parameter integer N2 = 5; 

    main #(N1) uut1 (
        .clk(clk),
        .reset(reset),
        .out(out1)
    );

    main #(N2) uut2 (
        .clk(clk),
        .reset(reset),
        .out(out2)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #20 reset = 0;      
        #1000 $finish;
    end

endmodule
