`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 14:39:53
// Design Name: 
// Module Name: xor4Test
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
// write test for 
// module xor4(
//     a,
//     b,
//     y
//     );
//     parameter n = 16;
//     input [n-1:0] a, b;
//     output [n-1:0] y;

//     genvar i;
//     generate
//         for(i=0; i<n; i=i+1) 
//         begin: xor4Label
//             xor x(a[i], b[i], y[i]);
//         end
//     endgenerate
// endmodule

module xor4Test(
    );
    parameter n = 16;
    reg [n-1:0] a, b;
    wire [n-1:0] y;
    integer i;
    xor4 uut(
        .a(a),
        .b(b),
        .y(y)
        );
    initial begin
        a <= 16'b0001_1010_1111_0011;
        b <= 16'b0001_1010_1111_0011;
        $finish;
    end
endmodule
