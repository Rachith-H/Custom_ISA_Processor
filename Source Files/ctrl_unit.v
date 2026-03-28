`timescale 1ns / 1ps

module ctrl_unit(opcode,msel,wen,aluopc,dsm,jen,ops2m,data_en,wdsel);
input [3:0] opcode;
output reg wen,dsm,jen,ops2m,data_en,wdsel ;
output reg [1:0] msel ;
output reg [3:0] aluopc ;


always@(*) begin
    case(opcode)
        4'b0000 : begin
            aluopc = 4'b0000 ;
            wen = 1'b1 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        4'b0001 : begin
            aluopc = 4'b0001 ;
            wen = 1'b1 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        4'b0010 : begin
            aluopc = 4'b0010 ;
            wen = 1'b1 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        4'b0011 : begin
            aluopc = 4'b0011 ;
            wen = 1'b1 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        4'b0100 : begin 
            aluopc = 4'b0100 ;
            wen = 1'b1 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        4'b0101 : begin
            aluopc = 4'b0101 ;
            wen = 1'b1 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        4'b0110 : begin
            aluopc = 4'b0110 ;
            wen = 1'b1 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        4'b0111 : begin
            aluopc = 4'b1111 ;
            wen = 1'b1 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b10 ;
        end 
        
        4'b1000 : begin
            aluopc = 4'b1111 ;
            wen = 1'b1 ;
            dsm = 1'b1 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b11 ;
        end
        
        4'b1001 : begin
            aluopc = 4'b1111 ;
            wen = 1'b1 ;
            dsm = 1'b1 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b01 ;
        end
        
        4'b1010 : begin
            aluopc = 4'b1111 ;
            wen = 1'b1 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b1 ;
            msel = 2'b00 ;
        end
        
        4'b1011 : begin
            aluopc = 4'b1111 ;
            wen = 1'b0 ;
            dsm = 1'b1 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b1 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        4'b1100 : begin
            aluopc = 4'b0111 ;
            wen = 1'b1 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b1 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        4'b1101 : begin
            aluopc = 4'b1000 ;
            wen = 1'b1 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b1 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        4'b1110 : begin
            aluopc = 4'b1001 ;
            wen = 1'b0 ;
            dsm = 1'b1 ;
            jen = 1'b1 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        4'b1111 : begin
            aluopc = 4'b1111 ;
            wen = 1'b0 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
        
        default : begin 
            aluopc = 4'b1111 ;
            wen = 1'b0 ;
            dsm = 1'b0 ;
            jen = 1'b0 ;
            ops2m = 1'b0 ;
            data_en = 1'b0 ;
            wdsel = 1'b0 ;
            msel = 2'b00 ;
        end
    endcase
end
endmodule
