`timescale 1ns / 1ps

module sub_mux #(parameter N=2)(in1,in2,sel,out);
input sel ;
input [N-1:0] in1,in2 ;
output [N-1:0] out ;

assign out = sel ? in1 : in2 ;

endmodule
