`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:56 05/24/2021 
// Design Name: 
// Module Name:    float_greater_than 
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
module float_greater_than
    (
	  input wire sign1, sign2,
     input wire [3:0] exp1, exp2,
     input wire [7:0] frac1, frac2,
     output wire gt
    );
     wire [12:0] a, b ;
	  wire gti;
	  assign a = {~sign1,exp1,frac1};
	  assign b = {~sign2,exp2,frac2};
	  assign gti = (a>b) ? 1 : 0 ;
	  assign gt = (sign1&sign2) ? ~gti : gti ;
endmodule
