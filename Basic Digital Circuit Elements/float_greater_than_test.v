
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:58 05/24/2021 
// Design Name: 
// Module Name:    float_greater_than_test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 10ps
module float_greater_than_test ;
reg sign1, sign2;
reg [3:0] exp1, exp2;
reg [7:0] frac1, frac2;

float_greater_than iurf(.sign1(sign1), .sign2(sign2), .exp1(exp1), .exp2(exp2), .frac1(frac1), .frac2(frac2), .gt(gt));
initial
 begin
 sign1 = 1'b0;
 exp1 = 4'h3;
 frac1 = 8'h87;
 sign2 = 1'b0;
 exp2 = 4'h3;
 frac2 = 8'h97;
 #200;
 sign1 = 1'b1;
 exp1 = 4'h4;
 frac1 = 8'h48;
 sign2 = 1'b0;
 exp2 = 4'h3;
 frac2 = 8'h31;
 #200;
 sign1 = 1'b0;
 exp1 = 4'h5;
 frac1 = 8'h12;
 sign2 = 1'b0;
 exp2 = 4'h5;
 frac2 = 8'h32;
 #200;
 sign1 = 1'b1;
 exp1 = 4'h3;
 frac1 = 8'h878;
 sign2 = 1'b1;
 exp2 = 4'h3;
 frac2 = 8'h97;
 #200;
 sign1 = 1'b1;
 exp1 = 4'h6;
 frac1 = 8'h57;
 sign2 = 1'b1;
 exp2 = 4'h6;
 frac2 = 8'h45;
 #200;
 $stop;
 end
endmodule
