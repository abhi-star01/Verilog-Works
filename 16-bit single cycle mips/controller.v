`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:16:19 06/19/2021 
// Design Name: 
// Module Name:    controller 
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
  module controller(
   input wire [5:0] op, funct,
   input wire zero,
   output wire memtoreg, memwrite,
   output wire pcsrc, alusrc,
   output wire regdst, regwrite,
   output wire jump,
   output wire [2:0] alucontrol
	);
   wire [1:0] aluop;
   wire branch;
   maindec md(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
   aludec ad(funct, aluop, alucontrol);

   assign pcsrc = branch & zero;
  endmodule
