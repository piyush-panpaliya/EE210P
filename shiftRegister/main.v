`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2024 14:37:30
// Design Name: 
// Module Name: shiftReg
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
module dFlipFlop (
    input D,   
    input clk, 
    output reg Q,
    output reg Qn 
);
    always @(posedge clk) begin
        Q <= D;
        Qn <= ~D;
    end
endmodule

module shiftReg(
    input dataIn,
    input clk,
    output dataOut
);
    wire d1, d2, d3, d4;
    dFlipFlop u1(.D(dataIn), .clk(clk), .Q(d1), .Qn());
    dFlipFlop u2(.D(d1), .clk(clk), .Q(d2), .Qn());
    dFlipFlop u3(.D(d2), .clk(clk), .Q(d3), .Qn());
    dFlipFlop u4(.D(d3), .clk(clk), .Q(d4), .Qn());
    assign dataOut = d4;
endmodule   