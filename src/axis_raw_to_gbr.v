// One-pixel-per-clock GBRG RAW10 to GBR888.  The previous row and the
// previous pixel supply nearest-neighbour R, G, B without frame buffering.
module axis_raw_to_gbr(
 (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET aresetn" *)
 (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) input aclk,
 (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
 (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) input aresetn,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [15:0] s_axis_tdata,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER" *) input s_axis_tuser,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input s_axis_tlast,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output reg [23:0] m_axis_tdata,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output reg m_axis_tvalid,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER" *) output reg m_axis_tuser,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output reg m_axis_tlast
);
 reg [9:0] prev_row [0:1919];
 reg [10:0] x;
 reg y_odd;
 reg have_prev_row;
 reg [9:0] left_pixel;
 reg [9:0] up_left_pixel;
 wire [10:0] col = s_axis_tuser ? 11'd0 : x;
 wire odd_row = s_axis_tuser ? 1'b0 : y_odd;
 wire [9:0] raw = s_axis_tdata[9:0];
 wire [9:0] up = prev_row[col];
 wire [9:0] left = (col == 0) ? raw : left_pixel;
 wire [9:0] up_left = (col == 0) ? up : up_left_pixel;
 wire [9:0] old_up = have_prev_row && !s_axis_tuser ? up : raw;
 wire [9:0] old_up_left = have_prev_row && !s_axis_tuser ? up_left : raw;
 wire [9:0] red = odd_row ? (col[0] ? left : raw)
                              : (col[0] ? old_up_left : old_up);
 wire [9:0] blue = odd_row ? (col[0] ? old_up : old_up_left)
                               : (col[0] ? raw : left);
 wire [9:0] green = (odd_row == col[0]) ? raw
                         : (col[0] ? left : old_up);
 assign s_axis_tready = !m_axis_tvalid || m_axis_tready;
 always @(posedge aclk) begin
   if (!aresetn) begin
     x <= 0;
     y_odd <= 0;
     have_prev_row <= 0;
     left_pixel <= 0;
     up_left_pixel <= 0;
     m_axis_tvalid <= 1'b0;
     m_axis_tdata <= 24'b0;
     m_axis_tuser <= 1'b0;
     m_axis_tlast <= 1'b0;
   end else if (s_axis_tready) begin
     m_axis_tvalid <= s_axis_tvalid;
     if (s_axis_tvalid) begin
       prev_row[col] <= raw;
       left_pixel <= raw;
       up_left_pixel <= up;
       if (s_axis_tlast) begin
         x <= 0;
         y_odd <= ~odd_row;
         have_prev_row <= 1'b1;
       end else begin
         x <= col + 1'b1;
         if (s_axis_tuser) begin
           y_odd <= 1'b0;
           have_prev_row <= 1'b0;
         end
       end
       m_axis_tdata <= {red[9:2], blue[9:2], green[9:2]};
       m_axis_tuser <= s_axis_tuser;
       m_axis_tlast <= s_axis_tlast;
     end
   end
 end
endmodule
