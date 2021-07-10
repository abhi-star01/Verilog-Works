`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:13:12 07/10/2021 
// Design Name: 
// Module Name:    JRControl_Block 
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
 
 module JRControl_Block( 
  output reg JRControl,
  input wire [1:0] ALUOp,
  input wire [5:0] Function
  );

  wire [7:0] test;
  assign test = {ALUOp,Function};

  always @(test)
   case (test)
    8'b10001000 : JRControl=1'b1; 
    default: JRControl=1'b0;
   endcase 

 endmodule 