`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:05:19 07/10/2021 
// Design Name: 
// Module Name:    Discar_Instr 
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
 
 module Discard_Instr
 (
  output wire ID_flush,IF_flush,
  input wire jump,bne,jr
  );
  
  assign IF_flush = jump || bne || jr;
  assign ID_flush = bne || jr;
  
 endmodule 