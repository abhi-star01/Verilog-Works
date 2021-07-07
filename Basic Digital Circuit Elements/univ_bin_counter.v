`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:26:17 05/25/2021 
// Design Name: 
// Module Name:    univ_bin_counter 
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
 module univ_bin_counter
    #(parameter N = 8)
	 (
     input wire clk, reset,
	  input syn_clr, load, en, up,
	  input [N-1:0] d,
	  output wire max_tick, //to show counted till max
	  output wire min_tick,
	  output wire [N-1:0] q
    );
   reg [N-1:0] r_reg; 
	reg [N-1:0] r_next;
	
	always @(posedge clk, posedge reset)
	 if(reset)
	  r_reg <= 0;
	 else
	  r_reg <= r_next;
	  
	always @*
	 begin
	  if(syn_clr)
	   r_next = 0;
	  else if(load)
	   r_next = d;
	  else if(en)
	   begin
	    if(up)
		  r_next = r_reg + 1;
		 else
		  r_next = r_reg - 1;
		end
	  else
	   r_next = r_reg;
    end
	 
	assign q = r_reg;
	assign max_tick = (r_reg == (2**N - 1)) ? 1 : 0; //can act as enable for other units
   assign min_tick = (r_reg == 0) ? 1 : 0;
 endmodule
