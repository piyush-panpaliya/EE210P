`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2024 12:34:20
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

module tFF(input clk, reset, T, output reg Q);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;         
        else if (T)
            Q <= ~Q;      
    end
endmodule

module freqDiv2 #(parameter m = 3) (input clk, reset, output out);
    wire [m-1:0] Q; 

    genvar i;
    generate
        for (i = 0; i < m; i = i + 1) begin : tff_chain
            if (i == 0) begin
                tFF tFF1 (.clk(clk), .reset(reset), .T(1'b1), .Q(Q[i])); 
            end
            else begin
                tFF tFF2 (.clk(Q[i-1]), .reset(reset), .T(1'b1), .Q(Q[i])); 
            end
        end
    endgenerate

    assign out = Q[m-1];
endmodule

module freqDivnon2 #(parameter n = 5) (input clk, reset, output reg out);
    reg [31:0] count; 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            out <= 0;
        end
        else if (count == (n/2-1)) begin
            count <= 0; 
            out <= ~out; 
        end
        else begin
            count <= count + 1;
        end
    end
endmodule


module main #(parameter n = 10) (input clk, reset, output out);
    reg [31:0] count;

    localparam isPower2 = (n & (n - 1)) == 0;
    generate
        if (isPower2) begin : gp2
            localparam m = $clog2(n);
            freqDiv2 #(m) dp2 (.clk(clk), .reset(reset), .out(out));
        end
        else begin : gnp2
            freqDivnon2 #(n) dpn2 (.clk(clk), .reset(reset), .out(out));
        end
    endgenerate
endmodule

