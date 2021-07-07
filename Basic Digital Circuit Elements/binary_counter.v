`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:04:36 05/25/2021 
// Design Name: 
// Module Name:    binary_counter 
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
 module binary_counter
    #(parameter N = 4)
	 (
     input wire clk, reset,
	  output wire max_tick, //to show counted till max
	  output wire [N-1:0] q
    );
   reg [N-1:0] r_reg; 
	wire [N-1:0] r_next;
	
	always @(posedge clk, posedge reset)
	 if(reset)
	  r_reg <= 0;
	 else
	  r_reg <= r_next;
	  
	assign r_next = r_reg + 1 ;
	assign q = r_reg;
	assign max_tick = (r_reg == (2**N - 1)) ? 1 : 0; //can act as enable for other units
 endmodule

