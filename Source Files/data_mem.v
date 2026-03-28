`timescale 1ns / 1ps

module data_mem(clk,addr,dout,wen,din);
input clk,wen;
input [7:0] addr;
input [15:0] din;
output [15:0] dout;

reg [15:0]memory[0:255];

assign dout = memory[addr];

always@(posedge clk) begin
    if(wen) 
        memory[addr] <= din ;
end

endmodule
