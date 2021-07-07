`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:38 05/31/2021 
// Design Name: 
// Module Name:    data_mem 
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
   module data_mem   // data cache type
   (
	   input clk,
	   input wire [3:0] addr, 
		input wire [7:0] din,
      input e, w_en, 		
		output wire [7:0] dout
   );

      reg [7:0] dmem [15:0];
	   always @(posedge clk)
		 if ( e == 1 & w_en == 1)
		  dmem[addr] <= din;
		
      assign dout = (e == 1) ? dmem[addr] : 0 ;		
   endmodule
