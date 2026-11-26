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
`include "dca_matrix_info.vh"
`include "dca_module_memorymap_offset.vh"




module DCA_MODULE_25
(
  dca_port_09,
  dca_port_14,
  dca_port_06,
  dca_port_04,

  dca_port_01,
  dca_port_05,
  dca_port_07,
  dca_port_02,
  dca_port_10,

  dca_port_12,
  dca_port_11,
  dca_port_13,
  dca_port_03,
  dca_port_08,
  dca_port_00
);




parameter LSU_PARA = 0;
parameter AXI_PARA = 32;
parameter MATRIX_SIZE_PARA = 4;

`include "ervp_axi_lpara.vb"
`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_matrix_lsu_inst_lpara.vb"

input wire dca_port_09;
input wire dca_port_14;
input wire dca_port_06;
input wire dca_port_04;

`include "dca_lsu_util.vb"
`include "dca_lsu_lpara.vb"

output wire dca_port_01;
input wire dca_port_05;
input wire [BW_MEMORY_ROW_BUFFER-1:0] dca_port_07;
input wire [BW_MEMORY_ROW_BUFFER/`BW_BYTE-1:0] dca_port_02;
input wire [BW_TXN_INFO-1:0] dca_port_10;

input wire dca_port_12;
output wire dca_port_11;
output wire [BW_AXI_DATA-1:0] dca_port_13;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] dca_port_03;
output wire dca_port_08;
output wire dca_port_00;

integer i;

wire [BW_BITADDR-1:0] dca_signal_08;
wire [`BW_AXI_ALEN-1:0] dca_signal_04;
wire dca_signal_02;
wire dca_signal_05;

wire dca_signal_11;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  DCA_LPARA_2 = REQUIRED_BITWIDTH_INDEX(MAX_NUM_AXI_DATA);

wire dca_signal_00;
wire dca_signal_12;
wire [DCA_LPARA_2-1:0] dca_signal_03;

localparam  DCA_LPARA_6 = BW_AXI_DATA;
localparam  DCA_LPARA_3 =  MAX_NUM_AXI_DATA;
localparam  DCA_LPARA_1 =  DCA_LPARA_2;

wire [DCA_LPARA_6*DCA_LPARA_3-1:0] dca_signal_09;
wire [DCA_LPARA_1-1:0] dca_signal_07;
wire [DCA_LPARA_6-1:0] dca_signal_10;

localparam  DCA_LPARA_5 = (BW_AXI_DATA/`BW_BYTE);
localparam  DCA_LPARA_0 =  MAX_NUM_AXI_DATA;
localparam  DCA_LPARA_4 =  DCA_LPARA_2;

wire [DCA_LPARA_5*DCA_LPARA_0-1:0] dca_signal_01;
wire [DCA_LPARA_4-1:0] dca_signal_06;
wire [DCA_LPARA_5-1:0] dca_signal_13;

assign {dca_signal_05, dca_signal_02, dca_signal_04, dca_signal_08} = dca_port_10;
assign dca_signal_11 = dca_port_11 & dca_port_12;

ERVP_COUNTER
#(
  .BW_COUNTER(DCA_LPARA_2),
  .COUNT_AMOUNT(1)
)
i_dca_instance_0
(
  .clk(dca_port_09),
  .rstnn(dca_port_14),
  .enable(dca_port_04),
  .init(dca_signal_00),
  .count(dca_signal_12),
  .value(dca_signal_03),
  .is_first_count(),
  .is_last_count()
);

assign dca_signal_00 = dca_signal_11 & dca_port_08;
assign dca_signal_12 = dca_signal_11 & (~dca_port_08);

ERVP_MUX
#(
  .BW_DATA(DCA_LPARA_6),
  .NUM_DATA(DCA_LPARA_3),
  .BW_SELECT(DCA_LPARA_1)
)
i_dca_instance_2
(
  .data_input_list(dca_signal_09),
  .select(dca_signal_07),
  .data_output(dca_signal_10)
);

assign dca_signal_09 = dca_port_07;
assign dca_signal_07 = dca_signal_03;

ERVP_MUX
#(
  .BW_DATA(DCA_LPARA_5),
  .NUM_DATA(DCA_LPARA_0),
  .BW_SELECT(DCA_LPARA_4)
)
i_dca_instance_1
(
  .data_input_list(dca_signal_01),
  .select(dca_signal_06),
  .data_output(dca_signal_13)
);

assign dca_signal_01 = dca_port_02;
assign dca_signal_06 = dca_signal_03;

assign dca_port_01 = dca_port_12 & dca_port_08;
assign dca_port_11 = dca_port_05;
assign dca_port_13 = dca_signal_10;
assign dca_port_03 = dca_signal_13;
assign dca_port_08 = ($unsigned(dca_signal_03)==$unsigned(dca_signal_04));
assign dca_port_00 = dca_signal_02;

endmodule
