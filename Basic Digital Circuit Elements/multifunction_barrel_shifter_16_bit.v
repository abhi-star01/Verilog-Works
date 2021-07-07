`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:01 05/24/2021 
// Design Name: 
// Module Name:    multifunction_barrel_shifter_16_bit 
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
module multifunction_barrel_shifter_16_bit
 (
   input wire [15:0] a,
   input wire [3:0] amt,
	input wire dir,
   output wire [15:0] y
 );
// si n a l d e c l a r a t i o n
 wire [15:0] s1, s0, s2, s3, b;

// body
 // if direction left......pre reversal of input
 assign b = dir ? a : {a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15]};
 // s t a g e 0, s h i f t 0 o r 1 b i t
 assign s0 = amt[0] ? {b[0], b[15:1]} : b;
 // s t a g e 1 , s h i f t 0 o r 2 b i t s
 assign s1 = amt[1] ? {s0[1:0] , s0[15:2]} : s0;
 // s t a g e 2, s h i f t 0 o r 4 b i t s
 assign s2 = amt[2] ? {s1[3:0], s1[15:4]} : s1;
 // s t a g e 3, s h i f t 0 o r 8 b i t s
 assign s3 = amt[3] ? {s2[7:0], s2[15:8]} : s2;
 // if direction left .... post-reversal, else same.
 assign y = dir ? s3 : {s3[0],s3[1],s3[2],s3[3],s3[4],s3[5],s3[6],s3[7],s3[8],s3[9],s3[10],s3[11],s3[12],s3[13],s3[14],s3[15]}; //** s2[0:7] doesn't work...we should use the same direction in array lsb to msb or msb to lsb as in declaration of array.
 
endmodule 