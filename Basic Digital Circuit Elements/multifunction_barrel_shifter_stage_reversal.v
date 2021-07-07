`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:24:27 05/24/2021 
// Design Name: 
// Module Name:    multifunction_barrel_shifter 
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
 module multifunction_barrel_shifter_stage_reversal
 (
   input wire [7:0] a,
   input wire [2:0] amt,
	input wire dir,
   output wire [7:0] y
 );
// si n a l d e c l a r a t i o n
 wire [7:0] s1, s0, s2, b;

// body
 // if direction left......pre reversal of input
 assign b = dir ? a : {a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7]};
 // s t a g e 0, s h i f t 0 o r 1 b i t
 assign s0 = amt[0] ? {b[0], b[7:1]} : b;
 // s t a g e 1 , s h i f t 0 o r 2 b i t s
 assign s1 = amt[1] ? {s0[1:0] , s0[7:2]} : s0;
 // s t a g e 2, s h i f t 0 o r 4 b i t s
 assign s2 = amt[2] ? {s1[3:0], s1[7:4]} : s1;
 // if direction left .... post-reversal, else same.
 assign y = dir ? s2 : {s2[0],s2[1],s2[2],s2[3],s2[4],s2[5],s2[6],s2[7]}; //** s2[0:7] doesn't work...we should use the same direction in array lsb to msb or msb to lsb as in declaration of array.
 
endmodule
