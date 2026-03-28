`timescale 1ns / 1ps

module instr_mem(addr,instruction);
input [7:0] addr;
output [15:0] instruction;

reg [15:0] ROM [0:255] ;

assign instruction = ROM[addr] ;

endmodule
