`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:29:34 06/19/2021 
// Design Name: 
// Module Name:    top 
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
  module top(
   input wire clk, reset,
   output wire [31:0] writedata, dataadr,
   output wire memwrite
	);
	
   wire [31:0] pc, instr, readdata;
// instantiate processor and memories
   mips mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
   instr_mem imem(clk, pc[7:2], instr);
   data_mem dmem(clk, memwrite, dataadr, writedata, readdata);
	
  endmodule
