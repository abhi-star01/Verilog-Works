`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:05 05/31/2021 
// Design Name: 
// Module Name:    microcontroller 
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
  module microcontroller(
      input wire clk, rs
    );
      parameter load = 2'b00, fetch = 2'b01, decode = 2'b10, execute = 2'b11 ;
      reg [1:0] curr_state, next_state ;
      reg [3:0] SR; // Status Register
      reg [11:0] IR; // Instruction	Register
      reg [7:0] DR; // Data Register
      reg [7:0] acc; //accumulator
      reg [7:0] pc;  //program counter
      reg load_comp;
      reg [11:0] program_mem[9:0];
      reg[7:0] load_addr;
      wire[11:0] load_instr;		
      wire PC_E,Acc_E,SR_E,DR_E,IR_E;
      reg PC_clr,Acc_clr,SR_clr,DR_clr,IR_clr;
      wire [7:0] PC_updated,DR_updated;
      wire[11:0] IR_updated;
      wire[3:0] SR_updated;
      wire PMem_E,DMem_E,DMem_WE,ALU_E,PMem_LE,MUX1_Sel,MUX2_Sel;
      wire [3:0] ALU_Mode;
      wire [7:0] Adder_Out;
      wire [7:0] ALU_Out,ALU_Operand2;      		

      // LOAD instruction memory
      initial
       begin
       $readmemb("program_mem.txt", program_mem,0,9);
       end

      ALU alu_module (
    .operand1(acc), 
    .operand2(ALU_Operand2), 
    .mode(ALU_Mode), 
    .E(ALU_E), 
    .Rflags(SR), 
    .out(ALU_Out), 
    .Wflags(SR_updated)
    );
 
      MUX mux2 (
    .In1(IR[7:0]), 
    .In2(DR), 
    .sel(MUX2_Sel), 
    .muxout(ALU_Operand2)
    );
  
      MUX mux1 (
    .In1(IR[7:0]), 
    .In2(Adder_Out), 
    .sel(MUX1_Sel), 
    .muxout(PC_updated)
    );
	 
	   adder adder_module (
    .in(pc), 
    .out(Adder_Out)
    );
	 
	   prog_mem pmem (
    .clk(clk), 
    .e(PMem_E), 
    .le(PMem_LE), 
    .addr(pc), 
    .Load_addr(load_addr), 
    .Iin(load_instr), 
    .I(IR_updated)
    );

      data_mem dmem (
    .clk(clk), 
    .addr(IR[3:0]), 
    .din(ALU_Out), 
    .e(DMem_E), 
    .w_en(DMem_WE), 
    .dout(DR_updated)
    );

      control_unit control_module (
    .stage(curr_state),  // state input (load/fetch/decode/execute ...and as per its value decisions taken)
    .IR(IR), 
    .SR(SR), 
    .pc_e(PC_E), 
    .acc_e(Acc_E), 
    .sr_e(SR_E), 
    .ir_e(IR_E), 
    .dr_e(DR_E), 
    .pmem_e(PMem_E), 
    .dmem_e(DMem_E), 
    .dmem_we(DMem_WE), 
    .alu_e(ALU_E), 
    .mux1_sel(MUX1_Sel), 
    .mux2_sel(MUX2_Sel), 
    .pmem_le(PMem_LE), 
    .ALU_Mode(ALU_Mode)
    );

       // State Management
      always @(posedge clk)
       begin
        if(rs == 1) 
		   begin
          load_addr <= 0;
          load_comp <= 1'b0;
         end 
        else if(PMem_LE == 1)
         begin 
          load_addr <= load_addr + 8'd1;
          if(load_addr == 8'd9)  // for testing purpose only until 10 lines 
           begin
            load_addr <= 8'd0;
            load_comp <= 1'b1;
           end
        //  else
         //  load_comp <= 1'b0; // entire program not loaded into instruction memory
         end 
        end

      assign load_instr = program_mem[load_addr];
      // state transition 
      always @(posedge clk)
       begin
        if(rs == 1)
         curr_state <= load;
        else
         curr_state <= next_state;
       end
		 
		// predicting next state 
      always @*
       begin
        PC_clr = 0;
        Acc_clr = 0;
        SR_clr = 0;
        DR_clr = 0; 
        IR_clr = 0;
        case(curr_state)
		  
         load: 
			 begin
           if(load_comp == 1)
   			begin
             next_state = fetch;
             PC_clr = 1;
             Acc_clr = 1;
             SR_clr = 1;
             DR_clr = 1; 
             IR_clr = 1;
            end
           else
            next_state = load;  // keep loading until load completes
          end
			 
         fetch: 
			 begin
           next_state = decode;
          end
			 
         decode:
     		 begin
           next_state = execute;
          end
			 
         execute:
          begin
           next_state = fetch;
          end 
        endcase
      end


// PC , Acc , SR management
       always @(posedge clk)
        begin
         if(rs == 1) 
          begin
           pc <= 8'd0;
           acc <= 8'd0;
           SR <= 4'd0;
          end
         else 
          begin
           if(PC_E == 1'd1) 
            pc <= PC_updated;
           else if (PC_clr == 1)
            pc <= 8'd0;
           if(Acc_E == 1'd1) 
            acc <= ALU_Out;
           else if (Acc_clr==1)
            acc <= 8'd0;
           if(SR_E == 1'd1) 
            SR <= SR_updated; 
           else if (SR_clr == 1)
            SR <= 4'd0; 
          end
         end		  
		  
		   // IR and DR management
        always @(posedge clk)
         begin
          if(DR_E == 1'd1) 
           DR <= DR_updated;
          else if (DR_clr == 1)
           DR  <= 8'd0;
          if(IR_E == 1'd1) 
           IR <= IR_updated;
          else if(IR_clr == 1)
           IR <= 12'd0;
         end
			
  endmodule
