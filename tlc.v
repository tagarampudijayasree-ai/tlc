`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 14:49:27
// Design Name: 
// Module Name: tlc
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


module tlc(input clk,rst,output reg [2:0] light_ns,light_ew);
parameter s1=0, s2=1, s3=2, s4=3;
parameter sec5=5, sec2=2;
reg [3:0]count;
reg [1:0]ps;
always@(posedge clk or posedge rst)
begin
if (rst==1)
begin
ps<=s1;
count<=0;
end
else
begin
case(ps)
s1: 
begin 
if (count<sec5)
begin
ps<=s1;
count<=count+1;
end
else
begin
ps<=s2;
count<=0;
end
end

s2:
begin
 if (count<sec2)
begin
ps<=s2;
count<=count+1;
end
else
begin
ps<=s3;
count<=0;
end
end
s3:
begin
 if (count<sec5)
begin
ps<=s3;
count<=count+1;
end
else
begin
ps<=s4;
count<=0;
end
end
s4: 
begin
 if (count<sec5)
begin
ps<=s4;
count<=count+1;
end
else 
begin
ps<=s1;
count<=0;
end
end
default:
begin
ps<=s1;
count<=0;
end
endcase
end
end
always@(*)
begin
case(ps)
s1: begin
light_ns<=3'b001;
light_ew<=3'b100;
end
s2: begin
light_ns<=3'b010;
light_ew<=3'b100;
end
s3: begin
light_ns<=3'b100;
light_ew<=3'b001;
end
s4: begin
light_ns<=3'b100;
light_ew<=3'b010;
end
default:begin
light_ns<=3'b000;
light_ew<=3'b000;
end
endcase
end
endmodule
