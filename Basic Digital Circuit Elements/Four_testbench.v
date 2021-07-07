`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:59:38 03/07/2021 
// Design Name: 
// Module Name:    Four_testbench 
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
module Four_testbench;

  reg [3:0]test_in0; 
  reg test_in1 ;
  wire [15:0]test_out ;
    
  four_to_sixteen_decoder uua (.a(test_in0) , .en(test_in1) , .b(test_out));

  initial
  begin
 // t e s t v e c t o r 1
test_in0 = 4'b1001;
test_in1 = 0;
# 200;
// t e s t v e c t o r 2
test_in0 = 4'b1000;
test_in1 = 1;
# 200;
// t e s t v e c t o r 3
test_in0 = 4'b1011;
test_in1 = 1;
# 200;
// t e s t v e c t o r 4
test_in0 = 4'b1010;
test_in1 = 1;
# 200;
// t e s t v e c t o r 5
test_in0 = 4'b1001;
test_in1 = 1;
# 200;
// t e s t v e c t o r 6
test_in0 = 4'b1100;
test_in1 = 1;
# 200;
// t e s t v e c t o r 7
test_in0 = 4'b1101;
test_in1 = 1;
# 200;
// t e s t v e c t o r 2
test_in0 = 4'b1000;
test_in1 = 1;
# 200;

// s t o p sitnztlation
$stop ;
end
endmodule
   

