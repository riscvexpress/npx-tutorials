// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
// Electronics and Telecommunications Research Institute (ETRI)
// 
// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2026-10-27
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"





module DCA_MODULE_05 
(
  dca_port_08,
  dca_port_12,
  dca_port_05,

  dca_port_02,
  dca_port_03,

  dca_port_11,
  dca_port_01,
  
  dca_port_10,
  dca_port_06,

  dca_port_09,
  dca_port_00,
  dca_port_04,
  dca_port_07
);





parameter DCA_GPARA_1 = 10;
parameter DCA_GPARA_2 = 10;
parameter DCA_GPARA_0 = 8;
parameter DCA_GPARA_3 = 8;

input wire dca_port_08;
input wire dca_port_12;
input wire dca_port_05;

input wire [DCA_GPARA_0-1:0] dca_port_02;
input wire [DCA_GPARA_3-1:0] dca_port_03;

input wire dca_port_11;
output wire dca_port_01;

output wire dca_port_10;
output wire dca_port_06;

output wire dca_port_09;
output wire dca_port_00;
output wire dca_port_04;
output wire dca_port_07;

localparam  DCA_LPARA_3 = 2;
localparam  DCA_LPARA_1 = 0;
localparam  DCA_LPARA_6 = 1;
localparam  DCA_LPARA_5 = 2;

reg [DCA_LPARA_3-1:0] dca_signal_09;
wire dca_signal_06;

localparam  DCA_LPARA_0 = DCA_GPARA_0;

reg [DCA_LPARA_0-1:0] dca_signal_20;
wire dca_signal_11;

wire dca_signal_16;
wire dca_signal_13;
wire [DCA_LPARA_0-1:0] dca_signal_14;
wire dca_signal_07;

localparam  DCA_LPARA_4 = DCA_GPARA_3 + 1;

reg [DCA_LPARA_4-1:0] dca_signal_19;
reg [DCA_LPARA_4-1:0] dca_signal_12;
wire dca_signal_10;
wire dca_signal_03;

wire dca_signal_02;
wire dca_signal_05;
wire [DCA_LPARA_4-1:0] dca_signal_08;
wire dca_signal_15;

localparam  DCA_LPARA_2 = `MAX(DCA_GPARA_2,DCA_GPARA_1);

wire dca_signal_17;
wire dca_signal_18;
wire [DCA_LPARA_2-1:0] dca_signal_00;

wire dca_signal_04;
wire dca_signal_01;

always@(posedge dca_port_08, negedge dca_port_12)
begin
  if(dca_port_12==0)
    dca_signal_09 <= DCA_LPARA_1;
  else if(dca_port_05)
  begin
    if(dca_port_01)
      dca_signal_09 <= DCA_LPARA_1;
    else if(dca_port_11)
      dca_signal_09 <= DCA_LPARA_5;
    else if(dca_signal_13)
      dca_signal_09 <= DCA_LPARA_6;
    else if(dca_signal_09==DCA_LPARA_6)
      dca_signal_09 <= DCA_LPARA_5;
  end
end

assign dca_signal_06 = (dca_signal_09==DCA_LPARA_5);

always@(posedge dca_port_08, negedge dca_port_12)
begin
  if(dca_port_12==0)
    dca_signal_20 <= 0;
  else if(dca_port_05)
  begin
    if(dca_port_11)
      dca_signal_20 <= dca_port_02;
    else if(dca_signal_13)
      dca_signal_20 <= (dca_signal_20>>1);
  end
end

assign dca_signal_11 = dca_signal_06 & dca_signal_20[0];

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(DCA_LPARA_0),
  .UP(1),
  .RESET_INDEX(0),
  .CIRCULAR(1)
)
i_dca_instance_1
(
  .clk(dca_port_08),
  .rstnn(dca_port_12),
  .enable(dca_port_05),
  .init(dca_signal_16),
  .count(dca_signal_13),
  .value(dca_signal_14),
  .is_first_count(),
  .is_last_count(dca_signal_07)
);

assign dca_signal_16 = dca_port_11;
assign dca_signal_13 = dca_signal_05 & dca_signal_15;

always@(posedge dca_port_08, negedge dca_port_12)
begin
  if(dca_port_12==0)
    dca_signal_19 <= 0;
  else if(dca_port_05)
  begin
    if(dca_port_11 || dca_signal_13)
      dca_signal_19 <= dca_port_03;
    else if(dca_signal_05)
      dca_signal_19 <= (dca_signal_19>>1);
  end
end

assign dca_signal_10 =  dca_signal_11 & dca_signal_19[0];

always@(posedge dca_port_08, negedge dca_port_12)
begin
  if(dca_port_12==0)
    dca_signal_12 <= 0;
  else if(dca_port_05)
  begin
    if(dca_port_11 || dca_signal_13)
      dca_signal_12 <= {dca_port_03,1'b 0};
    else if(dca_signal_05)
      dca_signal_12 <= (dca_signal_12>>1);
  end
end

assign dca_signal_03 = dca_signal_11 & dca_signal_12[0];

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(DCA_LPARA_4),
  .UP(1),
  .RESET_INDEX(0),
  .CIRCULAR(1)
)
i_dca_instance_2
(
  .clk(dca_port_08),
  .rstnn(dca_port_12),
  .enable(dca_port_05),
  .init(dca_signal_02),
  .count(dca_signal_05),
  .value(dca_signal_08),
  .is_first_count(),
  .is_last_count(dca_signal_15)
);

assign dca_signal_02 = dca_port_11 | dca_signal_13;
assign dca_signal_05 = dca_signal_06 & dca_signal_01;
assign dca_signal_04 = dca_signal_10 | dca_signal_03;
assign dca_signal_01 = dca_signal_04? dca_signal_00[DCA_LPARA_2-1] : 1;

ERVP_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(DCA_LPARA_2),
  .UP(1),
  .RESET_INDEX(0),
  .CIRCULAR(1)
)
i_dca_instance_0
(
  .clk(dca_port_08),
  .rstnn(dca_port_12),
  .enable(dca_port_05),
  .init(dca_signal_17),
  .count(dca_signal_18),
  .value(dca_signal_00),
  .is_first_count(),
  .is_last_count()
);

assign dca_signal_17 = dca_port_11;
assign dca_signal_18 = dca_signal_04;

assign dca_port_10 = dca_signal_10 & dca_signal_00[0];
assign dca_port_06 = dca_signal_03 & dca_signal_00[0];

assign dca_port_01 = dca_signal_13 & dca_signal_07;

assign dca_port_09 = dca_signal_06 & dca_signal_15 & dca_signal_00[0];
assign dca_port_00 = dca_signal_06 & (~dca_signal_15) & dca_signal_00[0];
assign dca_port_04 = dca_signal_10 & dca_signal_00[DCA_GPARA_1-1];
assign dca_port_07 = dca_signal_03 & dca_signal_00[DCA_GPARA_2-1];

endmodule
