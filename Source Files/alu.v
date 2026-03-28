`timescale 1ns / 1ps

module alu(A,B,opc,RES,C);
input [15:0] A,B;
input [3:0] opc;
output reg [15:0] RES ;
output reg C;

always @(*) begin
    {C,RES} = 0 ;
    case(opc)
        4'b0000 : {C,RES} = A + B ;
        4'b0001 : {C,RES} = A - B ;
        4'b0010 : RES = A[7:0] * B[7:0] ;
        4'b0011 : RES = (B==0) ? 16'h00 : A/B ;
        4'b0100 : RES = A ^ B ;
        4'b0101 : RES = A & B ;
        4'b0110 : RES = A | B ;
        4'b0111 : RES = A << B[3:0] ;  
        4'b1000 : RES = A >> B[3:0] ;
        4'b1001 : C = (B==0) ? 1'b1 : 1'b0 ;
        default : {C,RES} = 0 ;
    endcase
end
endmodule
