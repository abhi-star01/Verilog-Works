
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:23 05/26/2021 
// Design Name: 
// Module Name:    square_wv_test 
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
 `timescale 1 ns/10 ps
 
  module square_wv_test;
 
  localparam T = 20; // clock period
  reg clk, reset;
  //reg [3:0] m , n;
  wire wv;
  wire [7:0] count;
 
  prog_square_wave_gen #(.m(5),.n(8)) uuk (.clk(clk) , .reset(reset) , .wv(wv), .count(count));
  
  // clock
   // 20 ns clock running forever
   always
    begin
     clk = 1'b1;
     #(T/2) ;
     clk = 1'b0;
     #(T/2) ;
    end
	 
	initial
    begin
     reset = 1'b1;
     #(T/2) ;
     reset = 1'b0;
	  @(negedge clk);
	  //m = 4'h5;
	  //n = 4'ha;
	  #(100000*T);
	  
	  $stop;
	 end
	endmodule
   

