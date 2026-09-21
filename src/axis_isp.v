// PG286: 1 PPC RGB10 = {padding[1:0], R[9:0], B[9:0], G[9:0]}.
// Nominal sensor black=64, white=1023. Unity WB/CCM until calibrated.
// One elastic register: data and SOF/EOL remain stable under backpressure.
module axis_isp(
 (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET aresetn" *)
 (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) input aclk,
 (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
 (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) input aresetn,
 (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [31:0] s_axis_tdata,
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
 reg [7:0] lut [0:1023];
 initial $readmemh("isp_srgb.mem", lut);
 assign s_axis_tready = !m_axis_tvalid || m_axis_tready;
 always @(posedge aclk) begin
   if (!aresetn) begin
     m_axis_tvalid <= 0; m_axis_tdata <= 0;
     m_axis_tuser <= 0; m_axis_tlast <= 0;
   end else if (s_axis_tready) begin
     m_axis_tvalid <= s_axis_tvalid;
     if (s_axis_tvalid) begin
       m_axis_tdata <= {lut[s_axis_tdata[29:20]], lut[s_axis_tdata[19:10]], lut[s_axis_tdata[9:0]]};
       m_axis_tuser <= s_axis_tuser; m_axis_tlast <= s_axis_tlast;
     end
   end
 end
endmodule
