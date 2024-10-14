`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2024 12:14:37
// Design Name: 
// Module Name: testBench
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
    reg S, R;
    reg J, K;

    wire Q_latch, Qn_latch;
    wire Q_srFF, Qn_srFF;
    wire Q_jkFF, Qn_jkFF;
    srLatch srL (
        .S(S),
        .R(R),
        .Q(Q_latch),
        .Qn(Qn_latch)
    );

    srFlipFlop srFF (
        .S(S),
        .R(R),
        .clk(clk),
        .Q(Q_srFF),
        .Qn(Qn_srFF)
    );

    jkFlipFlop jkFF (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q_jkFF),
        .Qn(Qn_jkFF)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        S = 0; R = 0; J = 0; K = 0;
        
        #10 
        S = 1; R = 0;
        J = 0; K = 1;  
        #10 
        S = 0; R = 1;
        J = 1; K = 0;  
        #10 
        S = 0; R = 0;
        J = 1; K = 1;  
        #10 
        S = 1; R = 1;
        J = 0; K = 0;  
        #10 
        J = 1; K = 1;  
        #10 
        J = 0; K = 1;  

        #10 $finish;
    end
endmodule