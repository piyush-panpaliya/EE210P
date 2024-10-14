`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 15:17:23
// Design Name: 
// Module Name: rcaM
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
module rcaM
#(parameter n=4)
(
    a,
    b,
    cin,
    y,
    cout,
    final
    );


    input [n-1:0] a, b;
    input cin;
    output [n-1:0] y;
    output [n:0] final;
    output cout;  

    wire [n:0] carry; 
    assign carry[0] = cin; 

    genvar i;
    generate 
        for (i = 0; i < n; i = i + 1)
        begin: rcaLabel
            fullAdder fa (
                .a(a[i]), 
                .b(b[i] ^ cin), 
                .cin(carry[i]), 
                .sum(y[i]), 
                .cout(carry[i+1])
            );
        end
    endgenerate
    assign cout = carry[n]; 
    assign final = carry;
endmodule
