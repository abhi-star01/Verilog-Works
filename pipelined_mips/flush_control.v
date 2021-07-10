`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:37 07/10/2021 
// Design Name: 
// Module Name:    flush_control 
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

 module flush_control
  (
   output wire ID_RegDst,ID_ALUSrc,ID_MemtoReg,ID_RegWrite,ID_MemRead,ID_MemWrite,ID_Branch,ID_JRControl,
   output wire [1:0] ID_ALUOp,
   input wire flush,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,JRControl,
   input wire [1:0] ALUOp
  );

   wire notflush;
   assign notflush = ~flush;
   assign ID_RegDst = RegDst & notflush;
	assign ID_ALUSrc = ALUSrc & notflush;
   assign ID_MemtoReg = MemtoReg & notflush;
   assign ID_RegWrite = RegWrite & notflush;
   assign ID_MemRead = MemRead & notflush;
   assign ID_MemWrite = MemWrite & notflush;
   assign ID_Branch = Branch & notflush;
   assign ID_JRControl = JRControl & notflush;
   assign ID_ALUOp[1] = ALUOp[1] & notflush;
   assign ID_ALUOp[0] = ALUOp[0] & notflush;
 
 endmodule

