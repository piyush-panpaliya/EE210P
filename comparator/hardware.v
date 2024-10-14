`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2024 12:08:39
// Design Name: 
// Module Name: hardwareComp
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

module hardwareComp #(parameter N = 4) (
    input [N-1:0] a,
    input [N-1:0] b,
    output reg aGt,
    output reg aEq,
    output reg aLs
);
    integer i;
    reg done;
    always @(*) begin
        aGt = 0;
        aEq = 1;
        aLs = 0;
        done = 0;
        for (i = N-1; i >= 0 && !done; i = i - 1) begin
            if (a[i] != b[i]) begin
                aEq = 0;
                if (a[i] > b[i]) begin
                    aGt = 1;
                    aLs = 0;
                    done = 1;                    
                end else begin
                    aGt = 0;
                    aLs = 1;
                    done = 1;
                end
            end
        end
    end
endmodule