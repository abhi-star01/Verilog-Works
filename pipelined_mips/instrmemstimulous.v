`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:58:22 07/09/2021 
// Design Name: 
// Module Name:    instrmemstimulous 
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

 module instrmemstimulous;

  reg [31:0] addr;
  wire [31:0] instr;

  instruction_mem instructionmemory(.addr(addr),.I(instr));

  initial
   begin
    //$monitor("Mem Address=%h instruction=%b",addr,instr);
    addr=32'd0;
    #10000 addr=32'd4;
    #10000 addr=32'd8;
    #10000 addr=32'd12;
    #10000 addr=32'd16;
    #10000 addr=32'd20;
    #10000 addr=32'd24;
    #10000 addr=32'd28;
    #100000;
    //$finish;
   end

endmodule
