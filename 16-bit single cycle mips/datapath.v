`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:29:40 06/19/2021 
// Design Name: 
// Module Name:    datapath 
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
  module datapath(
   input wire clk, reset, 
   input wire memtoreg, pcsrc,
   input wire alusrc, regdst,
   input wire regwrite, jump,
   input wire [2:0] alucontrol,
   output wire zero,
   output wire [31:0] pc,
   input wire [31:0] instr,
   output wire [31:0] aluout, writedata,
   input wire [31:0] readdata
	);
   wire [4:0] writereg;
   wire [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
   wire [31:0] signimm, signimmsh;
   wire [31:0] srca, srcb;
   wire [31:0] result;
   // next PC logic
   register #(32) pcreg(clk, reset, pcnext, pc);
   adder pcadd1(pc, 32'b100, pcplus4);
   left_shift2 immsh(signimm, signimmsh);
   adder pcadd2(pcplus4, signimmsh, pcbranch);
   mux #(32) pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
   mux #(32) pcmux(pcnextbr, {pcplus4[31:28], instr[25:0], 2'b00}, jump, pcnext); // j instruction
 
   // register file logic
   regfile rf(clk, regwrite, instr[25:21], instr[20:16], writereg, result, srca, writedata);
   mux #(5) wrmux(instr[20:16], instr[15:11], regdst, writereg);
   mux #(32) resmux(aluout, readdata, memtoreg, result);
   signext se(instr[15:0], signimm);
  
   // ALU logic
   mux #(32) srcbmux(writedata, signimm, alusrc, srcb);
   ALU alu(srca, srcb, alucontrol, aluout, zero);

  endmodule 