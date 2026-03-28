`timescale 1ns / 1ps

module jump_dec(en,load_en,addr_in,addr_out,check);
input check,en;
input [7:0] addr_in;
output reg [7:0] addr_out;
output reg load_en;

always@(*) begin
    if(en) begin
        if(check) begin
            load_en = 1'b1;
            addr_out = addr_in;
        end
        else begin
            addr_out = 0;
            load_en = 0;
        end
    end
    else begin
        addr_out = 0;
        load_en = 0;
    end
end
endmodule



/*
always@(*) begin
    if(en) begin
        if(ctrl) begin
            if(check) begin
                addr_out = 0;
                load_en = 0;
            end
            else begin
                load_en = 1'b1;
                addr_out = addr_in;
            end
        end
        else begin
            if(check) begin
                load_en = 1'b1;
                addr_out = addr_in;
            end
            else begin
                addr_out = 0;
                load_en = 0;
            end
        end
    end
    else begin
        addr_out = 0;
        load_en = 0;
    end
end
endmodule
*/