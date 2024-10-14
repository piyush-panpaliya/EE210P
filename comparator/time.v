`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2024 12:08:39
// Design Name: 
// Module Name: timeComp
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
module timeComp #(parameter N = 4) (
    input [N-1:0] a,
    output reg aGt,
    input [N-1:0] b,
    output reg aEq,
    output reg aLs
);
    wire [N-1:0] diff;
    wire borrow_out;

    rSub #(N) subtractor (
        .a(a),
        .b(b),
        .diff(diff),
        .borrow_out(borrow_out)
    );

    always @(*) begin
        if (diff == 0) begin
            aGt = 0;
            aEq = 1;
            aLs = 0;
        end else if (borrow_out) begin
            aGt = 0;
            aEq = 0;
            aLs = 1;
        end else begin
            aGt = 1;
            aEq = 0;
            aLs = 0;
        end
    end
endmodule

module rSub #(parameter N = 4) (
    input [N-1:0] a,
    input [N-1:0] b,
    output [N-1:0] diff,
    output borrow_out
);
    wire [N:0] borrow;
    assign borrow[0] = 0;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : subtractor
            fullSub fs (
                .a(a[i]),
                .b(b[i]),
                .borrow_in(borrow[i]),
                .diff(diff[i]),
                .borrow_out(borrow[i+1])
            );
        end
    endgenerate

    assign borrow_out = borrow[N];
endmodule

module fullSub (
    input a,
    input b,
    input borrow_in,
    output diff,
    output borrow_out
);
    assign diff = a ^ b ^ borrow_in;
    assign borrow_out = (~a & b) | ((~a | b) & borrow_in);
endmodule
