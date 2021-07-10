`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:33:18 06/19/2021 
// Design Name: 
// Module Name:    mips_testbench 
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
  module testbench ;
  
   reg clk;
   reg reset;
   wire [31:0] writedata, dataadr;
   wire memwrite;
// instantiate device to be tested
   top dut (clk, reset, writedata, dataadr, memwrite);
// initialize test
   initial
    begin
     reset <= 1;
 	  # 22; 
	  reset <= 0;
    end
// generate clock to sequence tests
   always   
    begin
     clk <= 1; 
	  # 5; 
	  clk <= 0;
	  # 5;
    end
// check results
    always @(negedge clk)
     begin
      if (memwrite) 
		 begin
        if (dataadr === 84 & writedata === 7) 
		   begin
          $display("Simulation succeeded");
          $stop;
         end 
		  else 
		   if (dataadr != 80) 
			 begin
           $display("Simulation failed");
           $stop;
          end
       end
     end
	  
   endmodule  