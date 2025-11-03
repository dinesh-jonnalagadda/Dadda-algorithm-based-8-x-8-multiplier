`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// 
// Design Name: 8x8 Array Multiplier (Dadda-compatible structure)
// Description: Structural design using only Half Adders and Full Adders
// 
//
//////////////////////////////////////////////////////////////////////////////////

//--------------------
// Half Adder
//--------------------
module half_adder(input a, b, output sum, carry);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

//--------------------
// Full Adder
//--------------------
module full_adder(input a, b, cin, output sum, carry);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (cin & a);
endmodule

//--------------------
// 8x8 Multiplier
//--------------------
module dadda8x8(
    input  [7:0] A, B,
    output [15:0] P
);
    // Step 1: Partial Products
    wire [7:0] pp[7:0];
    assign pp[0] = A & {8{B[0]}};
    assign pp[1] = A & {8{B[1]}};
    assign pp[2] = A & {8{B[2]}};
    assign pp[3] = A & {8{B[3]}};
    assign pp[4] = A & {8{B[4]}};
    assign pp[5] = A & {8{B[5]}};
    assign pp[6] = A & {8{B[6]}};
    assign pp[7] = A & {8{B[7]}};

    //---------------------------------------------------------
    // Step 2: Manual reduction using Half and Full Adders
    //---------------------------------------------------------
    // We'll reduce column by column; all carry wires are unique

    //--- Column 0 ---
    assign P[0] = pp[0][0];

    //--- Column 1 ---
    wire s11, c11;
    half_adder ha11(pp[0][1], pp[1][0], s11, c11);
    assign P[1] = s11;

    //--- Column 2 ---
    wire s21, c21;
    full_adder fa21(pp[0][2], pp[1][1], pp[2][0], s21, c21);
    wire s22, c22;
    half_adder ha22(s21, c11, s22, c22);
    assign P[2] = s22;

    //--- Column 3 ---
    wire s31, c31;
    full_adder fa31(pp[0][3], pp[1][2], pp[2][1], s31, c31);
    wire s32, c32;
    full_adder fa32(s31, pp[3][0], c21, s32, c32);
    wire s33, c33;
    half_adder ha33(s32, c22, s33, c33);
    assign P[3] = s33;

    //--- Column 4 ---
    wire s41, c41;
    full_adder fa41(pp[0][4], pp[1][3], pp[2][2], s41, c41);
    wire s42, c42;
    full_adder fa42(s41, pp[3][1], pp[4][0], s42, c42);
    wire s43, c43;
    full_adder fa43(s42, c31, c32, s43, c43);
    wire s44, c44;
    half_adder ha44(s43, c33, s44, c44);
    assign P[4] = s44;

    //--- Column 5 ---
    wire s51, c51;
    full_adder fa51(pp[0][5], pp[1][4], pp[2][3], s51, c51);
    wire s52, c52;
    full_adder fa52(s51, pp[3][2], pp[4][1], s52, c52);
    wire s53, c53;
    full_adder fa53(s52, pp[5][0], c41, s53, c53);
    wire s54, c54;
    full_adder fa54(s53, c42, c43, s54, c54);
    wire s55, c55;
    half_adder ha55(s54, c44, s55, c55);
    assign P[5] = s55;

    //--- Column 6 ---
    wire s61, c61;
    full_adder fa61(pp[0][6], pp[1][5], pp[2][4], s61, c61);
    wire s62, c62;
    full_adder fa62(s61, pp[3][3], pp[4][2], s62, c62);
    wire s63, c63;
    full_adder fa63(s62, pp[5][1], pp[6][0], s63, c63);
    wire s64, c64;
    full_adder fa64(s63, c51, c52, s64, c64);
    wire s65, c65;
    full_adder fa65(s64, c53, c54, s65, c65);
    wire s66, c66;
    half_adder ha66(s65, c55, s66, c66);
    assign P[6] = s66;

    //--- Column 7 ---
    wire s71, c71;
    full_adder fa71(pp[0][7], pp[1][6], pp[2][5], s71, c71);
    wire s72, c72;
    full_adder fa72(s71, pp[3][4], pp[4][3], s72, c72);
    wire s73, c73;
    full_adder fa73(s72, pp[5][2], pp[6][1], s73, c73);
    wire s74, c74;
    full_adder fa74(s73, pp[7][0], c61, s74, c74);
    wire s75, c75;
    full_adder fa75(s74, c62, c63, s75, c75);
    wire s76, c76;
    full_adder fa76(s75, c64, c65, s76, c76);
    wire s77, c77;
    half_adder ha77(s76, c66, s77, c77);
    assign P[7] = s77;

    //--- Column 8 ---
    wire s81, c81;
    full_adder fa81(pp[1][7], pp[2][6], pp[3][5], s81, c81);
    wire s82, c82;
    full_adder fa82(s81, pp[4][4], pp[5][3], s82, c82);
    wire s83, c83;
    full_adder fa83(s82, pp[6][2], pp[7][1], s83, c83);
    wire s84, c84;
    full_adder fa84(s83, c71, c72, s84, c84);
    wire s85, c85;
    full_adder fa85(s84, c73, c74, s85, c85);
    wire s86, c86;
    full_adder fa86(s85, c75, c76, s86, c86);
    wire s87, c87;
    half_adder ha87(s86, c77, s87, c87);
    assign P[8] = s87;

    //--- Column 9 ---
    wire s91, c91;
    full_adder fa91(pp[2][7], pp[3][6], pp[4][5], s91, c91);
    wire s92, c92;
    full_adder fa92(s91, pp[5][4], pp[6][3], s92, c92);
    wire s93, c93;
    full_adder fa93(s92, pp[7][2], c81, s93, c93);
    wire s94, c94;
    full_adder fa94(s93, c82, c83, s94, c94);
    wire s95, c95;
    full_adder fa95(s94, c84, c85, s95, c95);
    wire s96, c96;
    full_adder fa96(s95, c86, c87, s96, c96);
    assign P[9] = s96;

    //--- Column 10 ---
    wire s101, c101;
    full_adder fa101(pp[3][7], pp[4][6], pp[5][5], s101, c101);
    wire s102, c102;
    full_adder fa102(s101, pp[6][4], pp[7][3], s102, c102);
    wire s103, c103;
    full_adder fa103(s102, c91, c92, s103, c103);
    wire s104, c104;
    full_adder fa104(s103, c93, c94, s104, c104);
    wire s105, c105;
    full_adder fa105(s104, c95, c96, s105, c105);
    assign P[10] = s105;

    //--- Column 11 ---
    wire s111, c111;
    full_adder fa111(pp[4][7], pp[5][6], pp[6][5], s111, c111);
    wire s112, c112;
    full_adder fa112(s111, pp[7][4], c101, s112, c112);
    wire s113, c113;
    full_adder fa113(s112, c102, c103, s113, c113);
    wire s114, c114;
    full_adder fa114(s113, c104, c105, s114, c114);
    assign P[11] = s114;

    //--- Column 12 ---
    wire s121, c121;
    full_adder fa121(pp[5][7], pp[6][6], pp[7][5], s121, c121);
    wire s122, c122;
    full_adder fa122(s121, c111, c112, s122, c122);
    wire s123, c123;
    full_adder fa123(s122, c113, c114, s123, c123);
    assign P[12] = s123;

    //--- Column 13 ---
    wire s131, c131;
    full_adder fa131(pp[6][7], pp[7][6], c121, s131, c131);
    wire s132, c132;
    full_adder fa132(s131, c122, c123, s132, c132);
    assign P[13] = s132;

    //--- Column 14 ---
    wire s141, c141;
    full_adder fa141(pp[7][7], c131, c132, s141, c141);
    assign P[14] = s141;

    //--- Column 15 ---
    assign P[15] = c141;

endmodule
