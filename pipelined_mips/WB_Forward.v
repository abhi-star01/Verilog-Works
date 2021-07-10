`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:45 07/10/2021 
// Design Name: 
// Module Name:    WB_F||ward 
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
// WB Hazard: Reading data while writing 
// Solve Hazard at the WriteBack Stage
 module WB_forward
 (
  output wire [31:0] ReadData1Out,ReadData2Out,
  input wire [31:0] ReadData1,ReadData2,WriteData,
  input wire [4:0] rs,rt,WriteRegister,
  input RegWrite
  );
  
  reg ReadSourceRs,ReadSourceRt;
  wire compOut1,compOut2;

  always @(rs || rt || WriteRegister || WriteData || RegWrite)
   begin
    if ((RegWrite==1)&&(WriteRegister != 0)&&(WriteRegister==rs))
     ReadSourceRs = 1'b1; //Forwarding WriteData to ReadData1
    else 
     ReadSourceRs = 1'b0;
    if ((RegWrite==1)&&(WriteRegister != 0)&&(WriteRegister==rt))
     ReadSourceRt = 1'b1; //Forwarding WriteData to ReadData2
    else 
     ReadSourceRt = 1'b0;
   end

   mux #(32) muxReadData1(ReadData1, WriteData, ReadSourceRs, ReadData1Out);
   mux #(32) muxReadData2(ReadData2, WriteData, ReadSourceRt, ReadData2Out);
 endmodule
