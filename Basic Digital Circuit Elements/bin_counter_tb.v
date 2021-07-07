`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:26:42 05/25/2021 
// Design Name: 
// Module Name:    bin_counter_tb 
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

  module bin_counter_tb ;
  // declaration
  localparam T = 20; // clock period
  reg clk, reset;
  reg syn_clr , load, en, up;
  reg [2:0] d;
  wire max_tick, min_tick;
  wire [2:0] q ;
  // uut instantiation
  univ_bin_counter #(.N(3)) uut
    (.clk(clk), 
    .reset(reset), 
    .syn_clr(syn_clr), 
    .load(load), 
    .en(en), 
    .up(up), 
    .d(d), 
    .max_tick(max_tick), 
    .min_tick(min_tick), 
    .q(q)
    );

   // clock
   // 20 ns clock running forever
   always
    begin
     clk = 1'b1;
     #(T/2) ;
     clk = 1'b0;
     #(T/2) ;
    end
   // reset for the first half cycle
   initial
    begin
     reset = 1'b1;
     #(T/2) ;
     reset = 1'b0;
    end

   // other stimulus
   initial
    begin
   // ==== initial input =====
     syn_clr = 1'b0;
     load = 1'b0;
     en = 1'b0;
     up = 1'b1 ; // count up
     d = 3'b000;
     @(negedge reset ) ; // w a i t r e s e t t o d e a s s e r t
     @(negedge clk) ; // w a i t f o r one c l o c k
   // ==== test load =====
     load = 1'b1 ;
     d = 3'b011;
     @(negedge clk) ; // w a i t f o r one c l o c k
     load = 1'b0;
     repeat(2) @(negedge clk) ;
   // ==== test syn-clear ====
     syn_clr = 1'b1 ; // a s s e r t c l e a r
     @(negedge clk) ;
     syn_clr = 1'b0;
   // ==== t e s t up counter and pause ====   
     en = 1'b1; // c o u n t
     up = 1'b1;
     repeat (10) @(negedge clk) ;
     en = 1'b0; // pause
     repeat(2) @(negedge clk) ;
     en = 1'b1;
     repeat(2) @(negedge clk) ;
   // ==== t e s t down c o u n t e r ====
     up = 1'b0;
     repeat(10) @(negedge clk) ;
   // ==== wait statement ====
   // c o n t i n u e u n t i l q=2
     wait (q==2) ;
     @(negedge clk) ;   
     up = 1'b1 ;
   // c o n t i n u e u n t i l min-tick becomes 1
     @(negedge clk) ;
     wait (min_tick) ;
     @(negedge clk) ;
     up = 1'b0;
   // ==== a b s o l u t e d e l a y ====
     #(4*T); // w a i t f o r 80 ns
     en = 1'b0; // pause
     #(4+T); // w a i t f o r 80 ns
   // ==== stop simulation ====
   // r e t u r n t o i n t e r a c t i v e s i m u l a t i o n mode
     $stop ;
    end
endmodule 