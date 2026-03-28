`timescale 1ns / 1ps

module reg_file(clk,s1,s2,rd,wen,din,s1val,s2val);
input clk,wen ;
input [3:0] s1,s2,rd ;
input [15:0] din ;
output [15:0] s1val,s2val ;

reg [15:0] registers [0:15] ;

assign s1val = registers[s1] ;
assign s2val = registers[s2] ;

always@(posedge clk) begin
    if(wen)
        registers[rd] <= din ;
end

endmodule
