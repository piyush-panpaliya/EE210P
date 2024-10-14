`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2024 11:57:57
// Design Name: 
// Module Name: sr
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

module srLatch(
    input S, 
    input R,  
    output Q,
    output Qn
);
    assign Q  = ~(S & Qn); 
    assign Qn = ~(R & Q);

endmodule

module srFlipFlop (
    input S,   
    input R,  
    input clk, 
    output reg Q,
    output reg Qn 
);
    wire latchQ, latchQn;
    initial begin
        Q <= 0;
        Qn <= 1;
    end
    srLatch srL (
        .S(~S),
        .R(~R),
        .Q(latchQ),
        .Qn(latchQn)
    );

    always @(posedge clk) begin
        if (S && R) begin
            Q <= 1'bx; 
            Qn <= 1'bx;
        end else begin
            Q <= latchQ;
            Qn <= latchQn;
        end
    end

endmodule


module ifElseSRFF (
     input S,   
    input R,  
    input clk, 
    output reg Q,
    output reg Qn 
);
    initial begin
        Q <= 0;
        Qn <= 1;
    end
    always @(posedge clk) begin
        if (S && R) begin
            Q <= 1'bx; 
            Qn <= 1'bx;
        end else if (S) begin
            Q <= 1;
            Qn <= 0;
        end else if (R) begin
            Q <= 0;
            Qn <= 1;
        end
    end

endmodule

module jkFlipFlop (
    input J,
    input K,
    input clk,
    output Q,
    output Qn
);
    wire S, R;
    assign S = J & Qn;
    assign R = K & Q;
    ifElseSRFF srFF (
        .S(S),
        .R(R),
        .clk(clk),
        .Q(Q),
        .Qn(Qn)
    );
endmodule




// truth table for sr latch
// S R | Q Qn
// 0 0 | INVALID
// 0 1 | 1 0
// 1 0 | 0 1
// 1 1 | Q Qn

// truth table for sr flip flop
// S R | Q Qn
// 0 0 | Q Qn
// 0 1 | 0 1
// 1 0 | 1 0
// 1 1 | INVALID

// truth table for jk flip flop
// J K | Q Qn
// 0 0 | Q Qn
// 0 1 | 0 1
// 1 0 | 1 0
// 1 1 | toggle Q and Qn 
