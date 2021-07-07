
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:23 05/24/2021 
// Design Name: 
// Module Name:    bcd_incrementer_test 
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
`timescale 1ns / 10ps
module bcd_incrementer_test ;
reg [11:0] bcd_in;
wire [11:0] bcd_out;

bcd_incrementer unito(.bcd_in(bcd_in), .bcd_out(bcd_out));

initial
 begin
  bcd_in = 12'h280;
  #200;
  bcd_in = 12'h289;
  #200;
  bcd_in = 12'h299;
  #200;
  bcd_in = 12'h967;
  #200;
  $stop; 
 end
endmodule


