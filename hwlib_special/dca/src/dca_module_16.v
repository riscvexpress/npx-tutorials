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
`include "ervp_axi_define.vh"





module DCA_MODULE_16
(
  dca_port_12,
  dca_port_09,
  dca_port_10,
  dca_port_13,

  dca_port_18,

  dca_port_07,
  dca_port_15,
  dca_port_06,
  dca_port_00,
  dca_port_05,
  dca_port_14,
  dca_port_03,

  dca_port_17,
  dca_port_16,
  dca_port_01,
  dca_port_11,

  dca_port_08,
  dca_port_04,
  dca_port_02
);





parameter DCA_GPARA_0 = 32;
parameter DCA_GPARA_2 = 32;
parameter DCA_GPARA_1 = 4;

input wire dca_port_12;
input wire dca_port_09;
input wire dca_port_10;
input wire dca_port_13;

input wire dca_port_18;

input wire dca_port_07;
input wire dca_port_15;
input wire dca_port_06;
input wire [DCA_GPARA_0-1:0] dca_port_00;
output reg dca_port_05;
output wire dca_port_14;
output wire [DCA_GPARA_1-1:0] dca_port_03;

input wire dca_port_17;
input wire [DCA_GPARA_1-1:0] dca_port_16;
output wire dca_port_01;
output wire [DCA_GPARA_2-1:0] dca_port_11;

input wire dca_port_08;
input wire [DCA_GPARA_2-1:0] dca_port_04;
output wire dca_port_02;

localparam  DCA_LPARA_0 = 4;

genvar i;

wire dca_signal_06;
reg [DCA_GPARA_1-1:0] dca_signal_05;
reg [DCA_GPARA_1-1:0] dca_signal_09;
reg [DCA_GPARA_2-1:0] dca_signal_02[DCA_GPARA_1-1:0];
wire [DCA_GPARA_2*DCA_GPARA_1-1:0] dca_signal_12;

wire dca_signal_04;
reg [DCA_GPARA_1-1:0] dca_signal_10;
wire [DCA_GPARA_1-1:0] dca_signal_01;
wire [DCA_GPARA_1-1:0] dca_signal_03;
wire [DCA_GPARA_1-1:0] dca_signal_07;
reg [DCA_GPARA_0-1:0] dca_signal_13[DCA_GPARA_1-1:0];

reg [DCA_LPARA_0-1:0] dca_signal_00[DCA_GPARA_1-1:0];
wire [DCA_GPARA_1-1:0] dca_signal_08;
wire [DCA_GPARA_1-1:0] dca_signal_11;

assign dca_signal_06 = dca_port_08 & dca_port_02;
assign dca_port_02 = 1;

always@(posedge dca_port_12, negedge dca_port_09)
begin
  if (dca_port_09 == 0) begin
    dca_signal_05 <= 1;
    dca_signal_09 <= 0;
  end else if (dca_port_10 | dca_port_18) begin
    dca_signal_05 <= 1;
    dca_signal_09 <= 0;
  end else if (dca_signal_06) begin
    dca_signal_05 <= {
      dca_signal_05, dca_signal_05[DCA_GPARA_1-1]
    };
    dca_signal_09 <= dca_signal_09 | dca_signal_05;
  end
end

generate
for (i = 0; i < DCA_GPARA_1; i = i + 1)
begin : i_generate_write_data
  always@(posedge dca_port_12, negedge dca_port_09) begin
    if (dca_port_09 == 0) dca_signal_02[i] <= 0;
    else if (dca_signal_06 & dca_signal_05[i]) dca_signal_02[i] <= dca_port_04;
  end
  assign dca_signal_12[DCA_GPARA_2*(i+1)-1-:DCA_GPARA_2] = dca_signal_02[i];
end
endgenerate

assign dca_signal_04 = dca_port_07 & dca_port_05 & dca_port_15 & (~dca_port_14);

always@(posedge dca_port_12, negedge dca_port_09)
begin
  if (dca_port_09 == 0) dca_signal_10 <= 1;
  else if (dca_port_10 | dca_port_18) dca_signal_10 <= 1;
  else if (dca_signal_04)
  dca_signal_10 <= {
    dca_signal_10, dca_signal_10[DCA_GPARA_1-1]
  };
end

generate
for (i = 0; i < DCA_GPARA_1; i = i + 1)
begin : i_generate_write_addr
  always@(posedge dca_port_12, negedge dca_port_09)
  begin
    if (dca_port_09 == 0)
      dca_signal_00[i] <= 0;
    else if (dca_port_10 | dca_port_18)
      dca_signal_00[i] <= 0;
    else if (dca_signal_08[i] & (~dca_signal_11[i]))
      dca_signal_00[i] <= {dca_signal_00[i], 1'b1};
    else if (dca_signal_11[i] & (~dca_signal_08[i]))
      dca_signal_00[i] <= {dca_signal_00[i][DCA_LPARA_0-1:1]};
  end
  assign dca_signal_08[i] = dca_port_07 & dca_port_05 & (dca_port_14? (dca_port_06? dca_port_03[i] : 0) : (dca_port_15? (dca_signal_10[i] & (~dca_signal_01[i])) : 0));
  assign dca_signal_11[i] = dca_port_17 & dca_port_01 & dca_port_16[i];
  assign dca_signal_01[i] = dca_signal_00[i][0];
  assign dca_signal_03[i] = dca_signal_00[i][1];
  assign dca_signal_07[i] = dca_signal_00[i][DCA_LPARA_0-1];

  always@(posedge dca_port_12, negedge dca_port_09)
  begin
    if (dca_port_09 == 0)
      dca_signal_13[i] <= 0;
    else if (dca_signal_04 & dca_signal_10[i])
      dca_signal_13[i] <= dca_port_00;
  end

  assign dca_port_03[i] = dca_signal_01[i] & (dca_port_00 == dca_signal_13[i]);
end
endgenerate

assign dca_port_14 = (dca_port_03 != 0);

always@(*)
begin
  dca_port_05 = 0;
  if (dca_port_14)
  begin
    if(!dca_port_06)
      dca_port_05 = 1;
    if((dca_port_03 & (~dca_signal_07))!= 0)
      dca_port_05 = 1;
  end
  else if(dca_port_15)
  begin
    if ((dca_signal_10 & (~dca_signal_01))!=0)
      dca_port_05 = 1;
    if ((dca_signal_10 & (~dca_signal_03) & dca_signal_09)!=0)
      dca_port_05 = 1;
  end
  else
    dca_port_05 = 1;
end

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA (DCA_GPARA_2),
  .NUM_DATA(DCA_GPARA_1)
)
i_dca_instance_0
(
  .data_input_list(dca_signal_12),
  .select(dca_port_16),
  .data_output(dca_port_11)
);

assign dca_port_01 = ((dca_signal_09 & dca_port_16) != 0);

endmodule
