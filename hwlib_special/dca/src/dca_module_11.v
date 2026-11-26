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




module DCA_MODULE_11
(
  dca_port_06,
  dca_port_09,
  dca_port_03,
  dca_port_11,

  dca_port_10,

  dca_port_00,
  dca_port_04,
  dca_port_05,
  dca_port_01,

  dca_port_02,
  dca_port_13,
  dca_port_08,
  dca_port_12,
  dca_port_07
);




parameter LSU_PARA = 0;
parameter AXI_PARA = 32;
parameter MATRIX_SIZE_PARA = 4;

`include "ervp_axi_lpara.vb"
`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_matrix_lsu_inst_lpara.vb"

input wire dca_port_06;
input wire dca_port_09;
input wire dca_port_03;
input wire dca_port_11;

`include "dca_lsu_util.vb"
`include "dca_lsu_lpara.vb"

input wire [BW_WDATA_INFO-1:0] dca_port_10;

output wire dca_port_00;
input wire dca_port_04;
input wire [BW_MEMORY_ROW_BUFFER-1:0] dca_port_05;
input wire [BW_TXN_INFO-1:0] dca_port_01;

input wire dca_port_02;
output wire dca_port_13;
output wire [BW_MEMORY_ROW_BUFFER-1:0] dca_port_08;
output wire [BW_MEMORY_ROW_BUFFER-1:0] dca_port_12;
output wire [BW_TXN_INFO-1:0] dca_port_07;

integer i;

wire [MATRIX_NUM_COL-1:0] dca_signal_15;
wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_02;
wire [`BW_DCA_MATRIX_INFO_ADDR-1:0] dca_signal_14;
wire [`BW_DCA_MATRIX_INFO_STRIDE_LS3-1:0] dca_signal_19;
wire [`BW_DCA_MATRIX_INFO_NUM_ROW_M1-1:0] dca_signal_05;
wire [`BW_DCA_MATRIX_INFO_NUM_COL_M1-1:0] dca_signal_01;
wire [`BW_DCA_MATRIX_INFO_IS_SIGNED-1:0] dca_signal_13;
wire [`BW_DCA_MATRIX_INFO_IS_FLOAT-1:0] dca_signal_12;
wire [`BW_DCA_MATRIX_INFO_ADDR_LSA_P3-1:0] dca_signal_16;

wire [BW_BITADDR-1:0] dca_signal_07;
wire [`BW_AXI_ALEN-1:0] dca_signal_06;
wire dca_signal_08;
wire dca_signal_17;

wire [BW_BITADDR_OFFSET-1:0] dca_signal_18;

localparam  DCA_LPARA_2 = BW_MEMORY_ROW_BUFFER;
localparam  DCA_LPARA_0 = BW_BITADDR_OFFSET;

wire [DCA_LPARA_2-1:0] dca_signal_10;
wire [DCA_LPARA_0-1:0] dca_signal_11;
wire [DCA_LPARA_2-1:0] dca_signal_20;

localparam  DCA_LPARA_1 = BW_MEMORY_ROW_BUFFER;
localparam  DCA_LPARA_3 = BW_BITADDR_OFFSET;

reg [DCA_LPARA_1-1:0] dca_signal_09;
wire [DCA_LPARA_3-1:0] dca_signal_03;
wire [DCA_LPARA_1-1:0] dca_signal_00;

wire [DCA_LPARA_1-1:0] dca_signal_04;

assign {dca_signal_16, dca_signal_12, dca_signal_13, dca_signal_01, dca_signal_05, dca_signal_19, dca_signal_14, dca_signal_02, dca_signal_15} = dca_port_10;
assign {dca_signal_17, dca_signal_08, dca_signal_06, dca_signal_07} = dca_port_01;

assign dca_signal_18[BW_BITADDR_OFFSET-1:3] = LSU_SUPPORT_MULTIBYTE? dca_signal_07[BW_BITADDR-1:3] : 0;
assign dca_signal_18[2:0] = LSU_SUPPORT_SUBBYTE? dca_signal_07[2:0] : 0;

ERVP_BARREL_SHIFTER
#(
  .BW_DATA(DCA_LPARA_2),
  .BW_SHIFT_AMOUNT(DCA_LPARA_0),
  .SIGNED_AMOUNT(0),
  .PLUS_TO_LEFT(1),
  .ARITHMETIC_SHIFT(0),
  .CIRCULAR_SHIFT(0),
  .MSB_FILL_VALUE(0)
)
i_dca_instance_0
(
  .data_input(dca_signal_10),
  .shift_amount(dca_signal_11),
  .data_output(dca_signal_20)
);

assign dca_signal_10 = dca_port_05;
assign dca_signal_11 = dca_signal_18;

ERVP_BARREL_SHIFTER
#(
  .BW_DATA(DCA_LPARA_1),
  .BW_SHIFT_AMOUNT(DCA_LPARA_3),
  .SIGNED_AMOUNT(0),
  .PLUS_TO_LEFT(1),
  .ARITHMETIC_SHIFT(0),
  .CIRCULAR_SHIFT(0),
  .MSB_FILL_VALUE(0)
)
i_dca_instance_1
(
  .data_input(dca_signal_09),
  .shift_amount(dca_signal_03),
  .data_output(dca_signal_00)
);

assign dca_signal_04 = $unsigned(dca_signal_15);
always@(*)
begin
  dca_signal_09 = 0;
  for(i=0; i<DCA_LPARA_1; i=i+1)
  begin
    case(dca_signal_16)
      0:
        dca_signal_09[i] = dca_signal_04[i];
      1:
        dca_signal_09[i] = dca_signal_04[i>>1];
      2:
        dca_signal_09[i] = dca_signal_04[i>>2];
      3:
        dca_signal_09[i] = dca_signal_04[i>>3];
      4:
        dca_signal_09[i] = dca_signal_04[i>>4];
      5:
        dca_signal_09[i] = dca_signal_04[i>>5];
    endcase
  end
end
assign dca_signal_03 = dca_signal_18;

assign dca_port_00 = dca_port_02;
assign dca_port_13 = dca_port_04;
assign dca_port_08 = dca_signal_20;
assign dca_port_12 = dca_signal_00;
assign dca_port_07 = dca_port_01;

endmodule
