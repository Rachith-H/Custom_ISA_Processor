`timescale 1ns / 1ps

module processor_top(clk , rst );
input clk, rst ;

wire load_en,wen,flag,dsm,ops2m,data_en,wdsel,jen;
wire [7:0]load_val,addr ;
wire [15:0] instruction,dsval,s1val,s2val,s2val_m,aluout,dout,wbout,mvr,mvl ;
wire [3:0] aluopc,opc,s1,s2,s2_m,ds ;
wire [1:0] msel ;

assign opc = instruction [15:12] ;
assign ds = instruction[11:8] ;
assign s1 = instruction [7:4] ;
assign s2 = instruction [3:0] ;
assign mvr = {s2val[15:8],s1,s2};
assign mvl = {s1,s2,s2val[7:0]};

prog_cntr PC (clk,rst,load_en,load_val,addr);
instr_mem Imem (addr,instruction);
reg_file Rfile (clk,s1,s2_m,ds,wen,dsval,s1val,s2val);
alu ALU (s1val,s2val_m,aluopc,aluout,flag);
sub_mux #(.N(4)) Sm1 (ds,s2,dsm,s2_m);
sub_mux #(.N(16)) Sm2 ({12'b0000_0000_0000,s2},s2val,ops2m,s2val_m);
sub_mux #(.N(16)) Sm3 (dout,aluout,wdsel,wbout);
data_mem Dmem (clk,{s1,s2},dout,data_en,s2val);
route_mux Rmux (wbout,mvl,s1val,mvr,msel,dsval);
jump_dec Jump (jen,load_en,{s1,s2},load_val,flag);
ctrl_unit CU (opc,msel,wen,aluopc,dsm,jen,ops2m,data_en,wdsel);

endmodule
