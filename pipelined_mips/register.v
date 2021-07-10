`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:25:56 06/18/2021 
// Design Name: 
// Module Name:    register 
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
  module register
  #(parameter WIDTH = 32)
   (
	 input wire clk, reset,
    input wire [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
	 );
	 
    always @(posedge clk, posedge reset)
     begin
	   if (reset) 
	    q <= 0;
      else
   	 q <= d;
	  end
		 
  endmodule 