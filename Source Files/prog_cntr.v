`timescale 1ns / 1ps

module prog_cntr(clk,rst,load_en,load_val,addr);
input clk,load_en,rst ;
input [7:0] load_val ;
output reg [7:0]addr ;

always@(posedge clk or posedge rst) begin
    if(rst) 
        addr <= 8'h00;
    else if(load_en)
        addr <= load_val ;
    else 
        addr <= addr+1 ;
end
endmodule
