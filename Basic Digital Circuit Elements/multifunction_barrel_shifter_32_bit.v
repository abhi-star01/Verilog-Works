`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:09:15 05/24/2021 
// Design Name: 
// Module Name:    multifunction_barrel_shifter_32_bit 
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
module multifunction_barrel_shifter_32_bit
 (
   input wire [31:0] a,
   input wire [4:0] amt,
	input wire dir,
   output wire [31:0] y
 );
// si n a l d e c l a r a t i o n
 wire [31:0] s1, s0, s2, s3, s4, b;

// body
 // if direction left......pre reversal of input
 assign b = dir ? a : {a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[16],a[17],a[18],a[19],a[20],a[21],a[22],a[23],a[24],a[25],a[26],a[27],a[28],a[29],a[30],a[31]};
 // s t a g e 0, s h i f t 0 o r 1 b i t
 assign s0 = amt[0] ? {b[0], b[31:1]} : b;
 // s t a g e 1 , s h i f t 0 o r 2 b i t s
 assign s1 = amt[1] ? {s0[1:0] , s0[31:2]} : s0;
 // s t a g e 2, s h i f t 0 o r 4 b i t s
 assign s2 = amt[2] ? {s1[3:0], s1[31:4]} : s1;
 // s t a g e 3, s h i f t 0 o r 8 b i t s
 assign s3 = amt[3] ? {s2[7:0], s2[31:8]} : s2;
  // s t a g e 4, s h i f t 0 o r 16 b i t s
 assign s4 = amt[4] ? {s3[15:0], s3[31:16]} : s3;
 // if direction left .... post-reversal, else same.
 assign y = dir ? s4 : {s4[0],s4[1],s4[2],s4[3],s4[4],s4[5],s4[6],s4[7],s4[8],s4[9],s4[10],s4[11],s4[12],s4[13],s4[14],s4[15],s4[16],s4[17],s4[18],s4[19],s4[20],s4[21],s4[22],s4[23],s4[24],s4[25],s4[26],s4[27],s4[28],s4[29],s4[30],s4[31]}; //** s2[0:7] doesn't work...we should use the same direction in array lsb to msb or msb to lsb as in declaration of array.
 
endmodule 