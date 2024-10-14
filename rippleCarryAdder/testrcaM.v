`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 15:04:37
// Design Name: 
// Module Name: rcamTest
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

module rcamTest();
    parameter n=4;
    reg [n-1:0] a, b;
    reg cin;
    wire [n-1:0] y;
    wire final[n:0];
    wire cout;

    rcaM #(.n(4)) UUTrcam (
        .a(a),
        .b(b),
        .cin(cin),
        .y(y),
        .cout(cout),
        .final(final)
    );

    initial begin
        a = 4'b0111;
        b = 4'b0101;
        cin = 0;
        #50;
        a = 4'b0111;
        b = 4'b1011;
        cin = 1;
    end
    
endmodule
    

