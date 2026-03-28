`timescale 1ns / 1ps

module processor_tb;
reg clk,rst ;

processor_top dut(clk , rst );
integer i;
always #1 clk = ~clk;
initial begin 
    
    for(i=0 ; i<256 ; i=i+1) 
        dut.Imem.ROM[i] = 16'hF000;
    for(i=0 ; i<16 ; i=i+1)
        dut.Rfile.registers[i] = 0;
    for(i=0 ; i<256 ; i=i+1) 
        dut.Dmem.memory[i] = 0;
    
    $readmemh("program.txt", dut.Imem.ROM);
    
    clk = 0 ; 
    rst = 1 ; #3 ;
    rst = 0 ;
    #70 $finish;
end
endmodule
