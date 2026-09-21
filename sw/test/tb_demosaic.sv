`timescale 1ns/1ps
// Exercise the actual generated Xilinx demosaic followed by our ISP.
// Flat RAW10 GBRG fields must retain 64x64 raster size and channel identity.
module tb_demosaic;
 reg clk=0; always #5 clk=~clk;
 reg rst=0, awv=0,wv=0,iv=0,iu=0,il=0;
 reg[5:0] addr=0; reg[31:0] wd=0; reg[15:0] raw=0;
 wire awr,wr,bv,ir,dv,du,dl,dr,ov,ou,ol;
 wire[31:0] rgb10; wire[23:0] rgb8;
 integer received=0,cycles=0,field=0;
 integer x,y,k,channel,expected;
 design_1_v_demosaic_0_0_v_demosaic dm(
  .ap_clk(clk),.ap_rst_n(rst),
  .s_axi_CTRL_AWVALID(awv),.s_axi_CTRL_AWREADY(awr),.s_axi_CTRL_AWADDR(addr),
  .s_axi_CTRL_WVALID(wv),.s_axi_CTRL_WREADY(wr),.s_axi_CTRL_WDATA(wd),.s_axi_CTRL_WSTRB(4'hf),
  .s_axi_CTRL_ARVALID(1'b0),.s_axi_CTRL_ARADDR(6'd0),.s_axi_CTRL_RREADY(1'b1),
  .s_axi_CTRL_BVALID(bv),.s_axi_CTRL_BREADY(1'b1),
  .s_axis_video_TDATA(raw[9:0]),.s_axis_video_TKEEP(2'b11),.s_axis_video_TSTRB(2'b11),
  .s_axis_video_TID(1'b0),.s_axis_video_TDEST(1'b0),
  .s_axis_video_TUSER(iu),.s_axis_video_TLAST(il),.s_axis_video_TVALID(iv),.s_axis_video_TREADY(ir),
  .m_axis_video_TDATA(rgb10[29:0]),.m_axis_video_TVALID(dv),.m_axis_video_TREADY(dr),
  .m_axis_video_TUSER(du),.m_axis_video_TLAST(dl));
 assign rgb10[31:30]=0;
 axis_isp isp(clk,rst,rgb10,dv,dr,du,dl,rgb8,ov,1'b1,ou,ol);
 task write_reg(input[5:0] a,input[31:0] v);
 begin
   @(negedge clk);addr=a;awv=1;
   do @(posedge clk); while(!awr);
   @(negedge clk);awv=0;wd=v;wv=1;
   do @(posedge clk); while(!wr);
   @(negedge clk);wv=0;
   wait(bv); @(negedge clk);
 end endtask
 always @(posedge clk) if(rst) begin
   cycles=cycles+1;
   if(cycles>200000) $fatal(1,"demosaic timeout, received=%d",received);
   if(ov) begin
     if(ou !== (received==0) || ol !== (received%64==63)) $fatal(1,"SOF/EOL raster mismatch");
     if(received/64>=8 && received/64<56 && received%64>=8 && received%64<56) begin
       for(k=0;k<3;k=k+1) begin
         // field 0=red,1=green,2=blue,3=white,4=black.
         expected=(field==3 || (field==0&&k==2) || (field==1&&k==0) || (field==2&&k==1))?255:0;
         if(rgb8[k*8+:8]<expected-2 || rgb8[k*8+:8]>expected+2)
           $fatal(1,"CFA/channel mismatch field=%d x=%d y=%d GBR=%h",field,received%64,received/64,rgb8);
       end
     end
     received=received+1;
   end
 end
 initial begin
   for(field=0;field<5;field=field+1) begin
     rst=0;iv=0;awv=0;wv=0;repeat(8) @(negedge clk);
     received=0;cycles=0;rst=1;
     write_reg('h10,64);write_reg('h18,64);write_reg('h28,2);write_reg(0,1);
     for(y=0;y<64;y=y+1) for(x=0;x<64;x=x+1) begin
       @(negedge clk);
       channel=(!y[0]) ? (x[0]?2:1) : (x[0]?1:0);
       raw=(field==3 || channel==field)?1023:64;
       iu=(x==0&&y==0);il=(x==63);iv=1;
       do @(posedge clk); while(!ir);
     end
     @(negedge clk);iv=0;
     wait(received==4096);repeat(8) @(negedge clk);
     if(received!=4096) $fatal(1,"wrong output pixel count");
     $display("PASS demosaic field %d: 4096 RAW samples -> 4096 RGB pixels",field);
   end
   $finish;
 end
endmodule
