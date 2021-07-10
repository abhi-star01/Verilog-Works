`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:02 07/10/2021 
// Design Name: 
// Module Name:    MIPSStimulus 
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

 module MIPSStimulus;

 // Testbench Verilog code for 32-bit 5-stage Pipelined MIPS Processor 
 parameter ClockDelay = 5000;

 reg clk,reset; 

 MIPS_Pipeline  myMIPS(clk, reset);
 
 initial clk = 0;
 always #(ClockDelay/2) clk = ~clk;

 initial 
  begin
   reset = 1;
  #(ClockDelay/4);
  reset = 0;
  end

 endmodule 