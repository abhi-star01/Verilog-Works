`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:45:25 07/10/2021 
// Design Name: 
// Module Name:    Stall_control 
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

 module StallControl
 (
  output reg PC_WriteEn,IFID_WriteEn,Stall_flush,
  input wire EX_MemRead,EX_rt,ID_rs,ID_rt,
  input wire [5:0] ID_Op
  );
  
  always @(EX_MemRead || EX_rt || ID_rs || ID_rt)
   begin
    if ((EX_MemRead==1)&&((EX_rt==ID_rs)||((EX_rt==ID_rt)&&(ID_Op!= 6'b001110)&&(ID_Op!= 6'b100011))))
     begin
      PC_WriteEn=1'b0;
      IFID_WriteEn=1'b0;
      Stall_flush =1'b1;
     end
    else
     begin
      PC_WriteEn=1'b1;
      IFID_WriteEn=1'b1;
      Stall_flush =1'b0;
     end
   end
	
 endmodule
