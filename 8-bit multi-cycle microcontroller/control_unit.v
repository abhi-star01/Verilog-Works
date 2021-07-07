`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:05 05/31/2021 
// Design Name: 
// Module Name:    control_unit 
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
  module control_unit(
     input wire [1:0] stage, // load/fetch/decode/execute
	  input wire [11:0] IR,
	  input wire [3:0] SR,
     output reg pc_e ,acc_e ,sr_e ,ir_e ,dr_e ,pmem_e ,dmem_e ,dmem_we ,alu_e, mux1_sel,mux2_sel,pmem_le,
     output reg [3:0] ALU_Mode	  
    );
     parameter load = 2'b00 , fetch = 2'b01 , decode = 2'b10 , execute = 2'b11 ;
	  
	  always @*
	   begin
		  pc_e = 0 ;
		  acc_e = 0 ;
		  sr_e = 0 ;
		  ir_e = 0 ;
		  dr_e = 0 ;
		  pmem_e = 0 ;
		  dmem_e = 0 ;
		  dmem_we = 0 ;
		  alu_e = 0 ;
		  mux1_sel = 0 ;
		  mux2_sel = 0 ;
		  pmem_le = 0 ;
		  ALU_Mode = 4'b0000 ;
		  
		   if( stage == load )
          begin
           pmem_le = 1;
           pmem_e = 1; 
          end
         else if( stage == fetch ) 
			 begin
           ir_e = 1; 
           pmem_e = 1;  
          end
         else if( stage == decode )
			 begin
			  if(IR[11:9] == 3'b001 )
			   begin 
 			   dr_e = 1;
				dmem_e = 1;
			   end
			 end
		   else if( stage == execute )
			 begin
			  if( IR[11] == 1) //ALU-I type
			   begin
			   pc_e = 1;
				acc_e = 1;
				sr_e = 1;
				alu_e = 1;
				ALU_Mode = IR[10:8];
				mux1_sel = 1;
			   end
			 else if( IR[10] == 1) //Branch type
			  begin
			  pc_e = 1;
			  mux1_sel = SR[IR[9:8]];
			  end
			  
			 else if( IR[9] == 1) //ALU-M type
			  begin
			  pc_e = 1;
			  acc_e = IR[8];
			  sr_e = 1;
			  dmem_e = ~IR[8];
			  dmem_we = ~IR[8];
			  alu_e = 1;
			  ALU_Mode = IR[7:4];
			  mux1_sel = 1;
			  mux2_sel = 1;
			  end
			
          else if( IR[8] == 1) //GOTO
   		  pc_e = 1;
			 
			 else if( IR[11:0] == 12'd0)   //NOP
 			  begin
			  pc_e = 1;
			  mux1_sel = 1;
			  end
			end
		end
		
  endmodule
