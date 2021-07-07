`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:13 05/26/2021 
// Design Name: 
// Module Name:    prog_square_wave_gen 
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
  module prog_square_wave_gen
   #( parameter m=5, n=6)
	( 
	  input clk, reset,
	  //input wire [3:0] m , n,
     output wire [7:0] count,
	  output reg wv
   );	
	  reg [7:0] c_reg ; 
	  wire [7:0] c_next ;
     always @(posedge clk, posedge reset)
	    if(reset)
		  c_reg <= 0;
		 else
		  c_reg <= c_next;
		 
	  assign c_next = (c_reg == (5*(m+n)-1)) ? 0 : c_reg + 1; 
	  
	  always @* 
		 if(c_reg <= (5*m - 1))
		  wv = 1;
		 else
        wv = 0;		 
	  assign count = c_reg;
	endmodule
        	   
	 
	    


