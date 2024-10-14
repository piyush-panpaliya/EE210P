`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 14:56:25
// Design Name: 
// Module Name: rcaTest
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

module rcaTest();
    parameter n=4;
    reg [n-1:0] a, b;
    reg cin;
    wire [n-1:0] y;
    wire cout;
    wire final[n:0];

    rca #(.n(4)) UUTrca (
        .a(a),
        .b(b),
        .cin(cin),
        .y(y),
        .cout(cout)
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
    // assign final = {cout, y[n-1:0]};
endmodule
    

