`timescale 1ns / 1ps


module hsub(
    input a,
    input b,
    output d,
    output br
    );
    assign d = a^b;
    assign br = ~a&b;
endmodule

module fsub(
   input a,
   input b,
   input bin,
   output d,bout
    );
    wire n1,n2,n3;
    hsub h1(
        .a(a),
        .b(b),
        .d(n1),
        .br(n2)
    );
    hsub h2(
        .a(n1),
        .b(bin),
        .d(d),
        .br(n3)
    );
    assign bout=n2|n3;
endmodule


module main( 
    input a,
    input b,
    output out1,
    output out2
    );
    wire n1, n2, n3;
    assign n1 = ~(a & b);
    assign n2 = ~(a & n1);
    assign n3 = ~(b & n1);
    assign out1 = ~(n2 & n3);
    assign out2 = ~(out1 & out1);
endmodule

