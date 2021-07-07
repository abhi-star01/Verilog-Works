`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:01:16 05/24/2021 
// Design Name: 
// Module Name:    fp_adder 
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
 module fp_adder
 (
  input wire signl, sign2,
  input wire [3:0] expl, exp2,
  input wire [7:0] fracl, frac2,
  output reg sign_out ,
  output reg [3:0] exp_out ,
  output reg [7:0] frac_out
 );

// s i g n a l d e c l a r a t i o n
// s u f f i x b, s , a , n f o r
// b i g , s m a l l , a l i g n e d , n o r m a l i z e d number
  reg signb , signs ;
  reg [3:0] expb , exps , expn , exp_diff ;
  reg [7:0] fracb , fracs , fraca , fracn , sum_norm ;
  reg [8:0] sum;
  reg [2:0] lead0;
 // body
  always @*
   begin
   // 1st s t a g e : s o r t t o f i n d the l a r g e r number
   if ({expl , fracl} > {exp2, frac2})
    begin
     signb = signl ;
     signs = sign2;
     expb = expl ;
     exps = exp2;
     fracb = fracl ;
     fracs = frac2;
    end
   
	else
    begin
     signb = sign2;
     signs = signl ;
     expb = exp2;
     exps = expl ;
     fracb = frac2;
     fracs = fracl ;
    end
   
	// 2nd s t a g e : a l i g n s m a l l e r number
   exp_diff = expb - exps ;
   fraca = fracs >> exp_diff ;
   
	// 3 r d s t a g e : add/substract
   if (signb==signs)
    sum = {1'b0, fracb } + {1'b0, fraca};
   
	else
    sum = {1'b0, fracb } - {1'b0, fraca};
  
   // 4 t h s t a g e : n o r m a l i z e
   // count l e a d i n g 0s
   if (sum[7])
    lead0 = 3'o0;
   else if (sum[6])
    lead0 = 3'o1;
   else if (sum[5])
    lead0 = 3'o2;
   else if (sum[4])
    lead0 = 3'o3;
   else if (sum[3])
    lead0 = 3'o4;
   else if (sum[2])
    lead0 = 3'o5;
   else if (sum[1])
    lead0 = 3'o6;
   else
    lead0 = 3'o7;
  
   // s h i f t s i g n i f i c a n d a c c o r d i n g t o l e a d i n g 0
   sum_norm = sum << lead0;
   // tzormalize w i t h s p e c i a l c o n d i t i o n s
   if (sum[8]) // w i t h carry o u t ; s h i f t frac l o r i g h t
    begin
     expn = expb + 1;
     fracn = sum [8:1];
    end
   else if (lead0 > expb) // t o o small t o n o r m a l i z e
    begin
     expn = 0; // s e t t o 0
     fracn = 0;
    end
   else
    begin
     expn = expb - lead0;
     fracn = sum_norm;
    end
// ,form outpz~t
   sign_out = signb;
   exp_out = expn;
   frac_out = fracn;
  end
endmodule
