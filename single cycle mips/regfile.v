`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:48 06/18/2021 
// Design Name: 
// Module Name:    regfile 
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

// three ported register file
// read two ports combinationally
// write third port on rising edge of clk
// register 0 hardwired to 0

  module regfile(
   input wire clk,
   input wire we3,
   input wire [4:0] ra1, ra2, wa3,
   input wire [31:0] wd3,
   output wire [31:0] rd1, rd2
	);
	
   reg [31:0] rf[31:0];
	
   always @(posedge clk)
	 begin
	  if (we3) 
	    rf[wa3] <= wd3;
	 end
		 
   assign rd1 = (ra1) ? rf[ra1] : 0;
   assign rd2 = (ra2) ? rf[ra2] : 0;
  endmodule
