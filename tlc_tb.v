`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 16:22:48
// Design Name: 
// Module Name: tlc_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tlc_tb();
    reg clk,rst;
    wire [2:0] light_ns, light_ew;
    tlc uut(.clk(clk),.rst(rst),.light_ns(light_ns),.light_ew(light_ew));
    initial
    begin
    clk=0;
    forever #5 clk=~clk;
    end
    initial
    begin
    rst=1;
    #20;
    rst=0;
    #300;
    $finish;
    end
    initial
    begin
    $monitor("Time=%0t rst=%b light_ns=%b light_ew=%b",
                                         $time,rst,light_ns, light_ew);
                                         end
endmodule