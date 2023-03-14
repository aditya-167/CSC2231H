`timescale 1ns / 1ps
`default_nettype wire

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 17:48:48
// Design Name: Systollic Arry
// Module Name: SystolicMMU
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


module SystolicMMU#(
 parameter DATA_WIDTH=8,
 parameter SystolicSize = 4)
 (input rst,clk,
input wire [DATA_WIDTH-1*SystolicSize:0] in_a,//[SystolicSize-1:0],
input wire [DATA_WIDTH-1*SystolicSize:0] in_b,//[SystolicSize-1:0],
output wire [2*DATA_WIDTH * SystolicSize*SystolicSize-1:0] out_c,[SystolicSize*SystolicSize-1:0]);
// reg [DATA_WIDTH-1:0] out_a,out_b);
wire [DATA_WIDTH-1:0] interconnectsRow [SystolicSize*SystolicSize-1:0];
wire [DATA_WIDTH-1:0] interconnectsCol [SystolicSize*SystolicSize-1:0];

genvar row;
generate
 for(row=0;row<SystolicSize*SystolicSize;row=row+1) begin: peUnit
    if(row<SystolicSize && row%SystolicSize == 0) begin
       pe pe_i (.clk(clk), .reset(reset), .in_a(in_a[row]), .in_b(in_b[row]), .out_a(interconnectsRow[row]), .out_b(interconnectsCol[row]), .out_c(out_c[row]));
    end
    else begin
       if(row%SystolicSize == 0) begin
            pe pe_i (.clk(clk), .reset(reset), .in_a(in_a[row]), .in_b(interconnectsCol[row-SystolicSize]), .out_a(interconnectsRow[row]), .out_b(interconnectsCol[row]), .out_c(out_c[row]));
       end
       else begin
            if(row>SystolicSize) begin
                pe pe_i (.clk(clk), .reset(reset), .in_a(interconnectsRow[row-1]), .in_b(interconnectsCol[row-SystolicSize]), .out_a(interconnectsRow[row]), .out_b(interconnectsCol[row]), .out_c(out_c[row]));
            end
            else begin
                pe pe_i (.clk(clk), .reset(reset), .in_a(interconnectsRow[row-1]), .in_b(in_b[row]), .out_a(interconnectsRow[row]), .out_b(interconnectsCol[row]), .out_c(out_c[row]));
            end            
       end
    end
end
endgenerate
/*
pe pe0 (.clk(clk), .rst(rst), .in_a(in_a[0]), .in_b(in_b[0]), .out_a(interconnectsRow[0]), .out_b(interconnectsCol[0]), .out_c(out_c[0]));
pe pe1 (.clk(clk), .rst(rst), .in_a(interconnectsRow[0]), .in_b(in_b[1]), .out_a(interconnectsRow[1]), .out_b(interconnectsCol[1]), .out_c(out_c[1]));
pe pe2 (.clk(clk), .rst(rst), .in_a(interconnectsRow[1]), .in_b(in_b[2]), .out_a(interconnectsRow[2]), .out_b(interconnectsCol[2]), .out_c(out_c[2]));
pe pe3 (.clk(clk), .rst(rst), .in_a(interconnectsRow[2]), .in_b(in_b[3]), .out_a(interconnectsRow[3]), .out_b(interconnectsCol[3]), .out_c(out_c[3]));
pe pe4 (.clk(clk), .rst(rst), .in_a(in_a[1]), .in_b(interconnectsCol[0]), .out_a(interconnectsRow[4), .out_b(b58), .out_c(c5));
pe pe5 (.clk(clk), .rst(rst), .in_a(in_a), .in_b(b36), .out_a(), .out_b(b69), .out_c(c6));
pe pe6 (.clk(clk), .rst(rst), .in_a(in_a), .in_b(b47), .out_a(a78), .out_b(), .out_c(c7));
pe pe7 (.clk(clk), .rst(rst), .in_a(a78), .in_b(b58), .out_a(a89), .out_b(), .out_c(c8));

pe pe8 (.clk(clk), .rst(rst), .in_a(in_a), .in_b(b1), .out_a(a12), .out_b(b14), .out_c(c1));
pe pe9 (.clk(clk), .rst(rst), .in_a(in_a), .in_b(b2), .out_a(a23), .out_b(b25), .out_c(c2));
pe pe10 (.clk(clk), .rst(rst), .in_a(in_a), .in_b(b3), .out_a(), .out_b(b36), .out_c(c3));
pe pe11 (.clk(clk), .rst(rst), .in_a(in_a), .in_b(b14), .out_a(a45), .out_b(b47), .out_c(c4));
pe pe12 (.clk(clk), .rst(rst), .in_a(in_a), .in_b(b25), .out_a(a56), .out_b(b58), .out_c(c5));
pe pe13 (.clk(clk), .rst(rst), .in_a(in_a), .in_b(b36), .out_a(), .out_b(b69), .out_c(c6));
pe pe14 (.clk(clk), .rst(rst), .in_a(in_a), .in_b(b47), .out_a(a78), .out_b(), .out_c(c7));
pe pe15 (.clk(clk), .rst(rst), .in_a(in_a), .in_b(b58), .out_a(a89), .out_b(), .out_c(c8));
*/
endmodule