`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2024 14:17:49
// Design Name: 
// Module Name: sim
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

module test;

    reg a, b;
    wire out1, out2;

    main testing(
        a,
        b,
        out1,
        out2
    );

    initial begin

        a = 0; b = 0; #10; 
        a = 0; b = 1; #10; 
        a = 1; b = 0; #10; 
        a = 1; b = 1; #10; 
    end
endmodule


