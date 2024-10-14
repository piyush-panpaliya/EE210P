`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 14:19:25
// Design Name: 
// Module Name: main
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



module xor4(
    a,
    b,
    y
    );
    parameter n = 16;
    input [n-1:0] a, b;
    output [n-1:0] y;

    genvar i;
    generate
        for(i=0; i<n; i=i+1) 
        begin: xor4Label
            xor x(a[i], b[i], y[i]);
        end
    endgenerate
endmodule
