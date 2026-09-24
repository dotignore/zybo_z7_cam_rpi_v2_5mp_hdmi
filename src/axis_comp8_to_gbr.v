// One-pixel-per-clock MIPI CSI-2 COMP8 (10-8-10 DPCM, Predictor 1) decoder,
// followed by the same nearest-neighbour Bayer-to-GBR888 conversion as RAW10.
module axis_comp8_to_gbr(
 (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET aresetn" *)
 (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) input aclk,
 (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
 (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) input aresetn,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [7:0] s_axis_tdata,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER" *) input s_axis_tuser,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input s_axis_tlast,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output reg [23:0] m_axis_tdata,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output reg m_axis_tvalid,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER" *) output reg m_axis_tuser,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output reg m_axis_tlast,
 (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 bayer_phase DATA" *) input [1:0] bayer_phase
);
 reg [9:0] prev_row [0:1919];
 reg [10:0] x;
 reg y_odd, have_prev_row;
 reg [9:0] left_pixel, up_left_pixel;
 reg [9:0] dpcm_even, dpcm_odd;
 wire [10:0] col = s_axis_tuser ? 11'd0 : x;
 wire odd_row = s_axis_tuser ? 1'b0 : y_odd;
 wire [9:0] dpcm_pred = col[0] ? dpcm_odd : dpcm_even;
 function [9:0] decode_10_8_10;
   input [7:0] code;
   input [9:0] pred;
   input predicted;
   reg [9:0] magnitude;
   reg [9:0] absolute;
   reg signed [11:0] result;
   begin
     magnitude = 10'd0;
     absolute = 10'd0;
     if (!predicted) result = $signed({2'b00,code,2'b00}) + 12'sd2;
     else if ((code & 8'hc0) == 8'h00) begin
       magnitude = {5'b0,code[4:0]};
       result = code[5] ? $signed({2'b00,pred})-$signed({2'b00,magnitude})
                        : $signed({2'b00,pred})+$signed({2'b00,magnitude});
     end else if ((code & 8'he0) == 8'h40) begin
       magnitude = 10'd32 + {5'b0,code[3:0],1'b0};
       result = code[4] ? $signed({2'b00,pred})-$signed({2'b00,magnitude})
                        : $signed({2'b00,pred})+$signed({2'b00,magnitude});
     end else if ((code & 8'he0) == 8'h60) begin
       magnitude = 10'd65 + {4'b0,code[3:0],2'b00};
       result = code[4] ? $signed({2'b00,pred})-$signed({2'b00,magnitude})
                        : $signed({2'b00,pred})+$signed({2'b00,magnitude});
     end else begin
       absolute = {code[6:0],3'b000};
       result = $signed({2'b00,absolute}) +
                ((absolute > pred) ? 12'sd3 : 12'sd4);
     end
     if (result[11]) decode_10_8_10 = 10'd0;
     else if (result > 12'sd1023) decode_10_8_10 = 10'd1023;
     else decode_10_8_10 = result[9:0];
   end
 endfunction
 wire [9:0] raw = decode_10_8_10(s_axis_tdata, dpcm_pred, col >= 2);
 wire [9:0] up = prev_row[col];
 wire [9:0] left = (col == 0) ? raw : left_pixel;
 wire [9:0] up_left = (col == 0) ? up : up_left_pixel;
 wire [9:0] old_up = have_prev_row && !s_axis_tuser ? up : raw;
 wire [9:0] old_up_left = have_prev_row && !s_axis_tuser ? up_left : raw;
 function [1:0] site_color;
   input row_odd, col_odd; input [1:0] phase;
   begin case (phase)
     2'd0: site_color = (!row_odd&&!col_odd)?0:(row_odd&&col_odd)?2:1;
     2'd1: site_color = (!row_odd&&col_odd)?0:(row_odd&&!col_odd)?2:1;
     2'd2: site_color = (row_odd&&!col_odd)?0:(!row_odd&&col_odd)?2:1;
     default: site_color = (row_odd&&col_odd)?0:(!row_odd&&!col_odd)?2:1;
   endcase end
 endfunction
 wire [1:0] here=site_color(odd_row,col[0],bayer_phase);
 wire [1:0] left_c=site_color(odd_row,~col[0],bayer_phase);
 wire [1:0] up_c=site_color(~odd_row,col[0],bayer_phase);
 function [9:0] pick; input [1:0] ch;
   begin pick=(here==ch)?raw:(left_c==ch)?left:(up_c==ch)?old_up:old_up_left; end
 endfunction
 wire [9:0] red=pick(0), green=pick(1), blue=pick(2);
 assign s_axis_tready = !m_axis_tvalid || m_axis_tready;
 always @(posedge aclk) begin
   if (!aresetn) begin
     x<=0; y_odd<=0; have_prev_row<=0; left_pixel<=0; up_left_pixel<=0;
     dpcm_even<=0; dpcm_odd<=0;
     m_axis_tvalid<=0; m_axis_tdata<=0; m_axis_tuser<=0; m_axis_tlast<=0;
   end else if (s_axis_tready) begin
     m_axis_tvalid<=s_axis_tvalid;
     if (s_axis_tvalid) begin
       prev_row[col]<=raw; left_pixel<=raw; up_left_pixel<=up;
       if (col[0]) dpcm_odd<=raw; else dpcm_even<=raw;
       if (s_axis_tlast) begin x<=0; y_odd<=~odd_row; have_prev_row<=1; end
       else begin x<=col+1'b1; if(s_axis_tuser) begin y_odd<=0; have_prev_row<=0; end end
       m_axis_tdata<={red[9:2],blue[9:2],green[9:2]};
       m_axis_tuser<=s_axis_tuser; m_axis_tlast<=s_axis_tlast;
     end
   end
 end
endmodule
