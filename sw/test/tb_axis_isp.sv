`timescale 1ns/1ps
module tb_axis_isp;
 reg clk=0; always #5 clk=~clk;
 reg rstn=0, valid=0, ready=0, sof=0, eol=0;
 reg [31:0] din=0;
 wire sr, ov, os, ol; wire[23:0] dout;
 reg[7:0] lut[0:1023];
 reg[25:0] expected[$];
 reg[25:0] exp_pixel;
 reg[25:0] held;
 reg stalled=0;
 integer sent=0,received=0,cycles=0;
 axis_isp dut(clk,rstn,din,valid,sr,sof,eol,dout,ov,ready,os,ol);
 initial begin
   $readmemh("isp_srgb.mem",lut);
   repeat(4) @(negedge clk);
   rstn=1;
 end
 always @(negedge clk) if(rstn) begin
   ready=($urandom_range(0,3)!=0);
   if(!valid || sr) begin
     valid=(sent<4096 && $urandom_range(0,4)!=0);
     din={2'b0,10'(sent%1024),10'((sent*7)%1024),10'((sent*31)%1024)};
     sof=(sent%1920==0); eol=(sent%1920==1919);
   end
 end
 always @(posedge clk) if(rstn) begin
   cycles=cycles+1;
   if(stalled && {os,ol,dout}!==held) $fatal(1,"unstable output under backpressure");
   stalled=ov&&!ready; held={os,ol,dout};
   if(ov && ready) begin
     if(expected.size()==0) $fatal(1,"unexpected output");
     exp_pixel=expected.pop_front();
     if({os,ol,dout}!==exp_pixel) $fatal(1,"color/marker mismatch at %d",received);
     received=received+1;
   end
   if(valid && sr) begin
     expected.push_back({sof,eol,lut[din[29:20]],lut[din[19:10]],lut[din[9:0]]});
     sent=sent+1;
   end
   if(received==4096) begin $display("PASS ISP 4096 pixels with random stalls"); $finish; end
   if(cycles>20000) $fatal(1,"timeout");
 end
endmodule
