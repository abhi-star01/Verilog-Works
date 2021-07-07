`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:25:06 06/19/2021 
// Design Name: 
// Module Name:    mips 
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
  module mips(
   input wire clk, reset,
   output wire [31:0] pc,
   input wire [31:0] instr,
   output wire memwrite,
   output wire [31:0] aluout, writedata,
   input wire [31:0] readdata
	);
   wire memtoreg, alusrc, regdst, regwrite, jump, pcsrc, zero;
   wire [2:0] alucontrol;
   controller c(instr[31:26], instr[5:0], zero, memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, alucontrol);
   datapath dp(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, zero, pc, instr, aluout, writedata, readdata);
  endmodule
