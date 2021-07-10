`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:02:44 06/18/2021 
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
		input w_en, 		
	   input wire [31:0] addr, 
		input wire [31:0] wd,
		output wire [31:0] rd
   );

      reg [31:0] dmem [1023:0];
	   always @(posedge clk)
		 if (w_en == 1)
		  dmem[addr] <= wd; //word align
		
      assign rd = dmem[addr] ;		
   endmodule
