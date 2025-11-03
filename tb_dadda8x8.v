`timescale 1ns / 1ps
module tb_dadda8x8;

    reg [7:0] A, B;
    wire [15:0] P;

    dadda8x8 uut (.A(A), .B(B), .P(P));

    initial begin
        $monitor("Time=%0t | A=%h B=%h => P=%h (%0d)", $time, A, B, P, P);
        A=0; B=0;
        #10 A=8'h50; B=8'h03;  // expect 0x00F0
        #10 A=8'hFF; B=8'h0F;  // expect 0x0EF1
        #10 A=8'hFE; B=8'hFF;  // expect 0xFD02
        #10 A=8'h09; B=8'h09;  // expect 0x0051
        #10 A=8'h12; B=8'h34;  // expect 0x03A8
        #10 A=8'h88; B=8'h02;  // expect 0x0110
        #10 A=8'hAF; B=8'h55;  // expect 0x3A1B
        #20 $finish;
    end

endmodule
