`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:34:38 06/01/2021 
// Design Name: 
// Module Name:    MCU_tb 
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
module MCU_tb;
// Inputs
reg clk;
reg rst;
// Instantiate the Unit Under Test (UUT)
microcontroller uut (
.clk(clk), 
.rs(rst)
);
initial begin
// Initialize Inputs
rst = 1;
// Wait 100 ns for global reset to finish
#100;
rst = 0;
end
initial 
begin 
clk = 0;
forever #10 clk = ~clk;
end 
endmodule 
