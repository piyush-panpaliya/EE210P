`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 14:45:48
// Design Name: 
// Module Name: rca
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

module rca #(parameter n=4)
(
    a,
    b,
    cin,
    y,
    cout,
    );

    input [n-1:0] a, b;
    input cin;  
    output [n-1:0] y;
    output cout;  

    wire [n:0] carry; 

    assign carry[0] = cin; 

    genvar i;
    generate 
        for (i = 0; i < n; i = i + 1)
        begin: rcaLabel
            fullAdder fa (
                .a(a[i]), 
                .b(b[i]), 
                .cin(carry[i]), 
                .sum(y[i]), 
                .cout(carry[i+1])
            );
        end
    endgenerate
    assign cout = carry[n]; 
endmodule
