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



module DCA_MODULE_28
(
  dca_port_02,
  dca_port_12,
  dca_port_06,
  dca_port_03,

  dca_port_09,
  dca_port_11,

  dca_port_10,
  dca_port_08,
  dca_port_04,
  dca_port_05,

  dca_port_00,
  dca_port_13,
  dca_port_01,
  dca_port_07
);



parameter LSU_PARA = 0;
parameter AXI_PARA = 32;
parameter MATRIX_SIZE_PARA = 4;
parameter TENSOR_PARA = 0;

`include "ervp_axi_lpara.vb"
`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_matrix_lsu_inst_lpara.vb"

input wire dca_port_02;
input wire dca_port_12;
input wire dca_port_06;
input wire dca_port_03;

`include "dca_lsu_util.vb"
`include "dca_lsu_lpara.vb"

input wire dca_port_09;
input wire [BW_RRESP_INFO-1:0] dca_port_11;

output wire dca_port_10;
input wire dca_port_08;
input wire [BW_LSU_ELEMENT_ROW-1:0] dca_port_04;
input wire [BW_TXN_INFO-1:0] dca_port_05;

`include "dca_tensor_scalar_lpara.vb"
`include "dca_tensor_dim_lpara.vb"

output wire dca_port_00;
output wire dca_port_13;
output wire [BW_TENSOR_ROW-1:0] dca_port_01;
input wire dca_port_07;

genvar i;

`include "ervp_log_util.vf"

wire [MATRIX_NUM_COL-1:0] dca_signal_05;
wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_21;
wire [`BW_DCA_MATRIX_INFO_ADDR-1:0] dca_signal_11;
wire [`BW_DCA_MATRIX_INFO_STRIDE_LS3-1:0] dca_signal_24;
wire [`BW_DCA_MATRIX_INFO_NUM_ROW_M1-1:0] dca_signal_08;
wire [`BW_DCA_MATRIX_INFO_NUM_COL_M1-1:0] dca_signal_23;
wire [`BW_DCA_MATRIX_INFO_IS_SIGNED-1:0] dca_signal_09;
wire [`BW_DCA_MATRIX_INFO_IS_FLOAT-1:0] dca_signal_13;
wire [`BW_DCA_MATRIX_INFO_ADDR_LSA_P3-1:0] dca_signal_16;

wire [BW_BITADDR-1:0] dca_signal_25;
wire [`BW_AXI_ALEN-1:0] dca_signal_18;
wire dca_signal_14;
wire dca_signal_19;
wire [BW_LSU_PAD_INFO-1:0] dca_signal_20;
wire [3-1:0] dca_signal_01;
wire [MATRIX_NUM_COL-1:0] dca_signal_02;
wire [MATRIX_NUM_ROW-1:0] dca_signal_15;
wire [LOG2RU(MATRIX_NUM_COL)-1:0] dca_signal_00;
wire [3-1:0] dca_signal_17;
wire [LOG2RU(MATRIX_NUM_ROW)-1:0] dca_signal_07;
wire dca_signal_03;
reg [`BW_DCA_MATRIX_INFO_NUM_ROW_M1-1:0] dca_signal_06;
wire dca_signal_12;
wire dca_signal_10;
wire dca_signal_04;
wire [BW_LSU_ELEMENT_ROW-1:0] dca_signal_22;

assign {dca_signal_16, dca_signal_13, dca_signal_09, dca_signal_23, dca_signal_08, dca_signal_24, dca_signal_11, dca_signal_21, dca_signal_05} = dca_port_11;
assign {dca_signal_19, dca_signal_14, dca_signal_18, dca_signal_25} = dca_port_05;
assign dca_signal_20 = dca_port_11[MATRIX_NUM_COL+`BW_DCA_MATRIX_LSU_INST_OPCODE+`BW_DCA_MATRIX_INFO_ALIGNED+:BW_LSU_PAD_INFO];
assign {dca_signal_15, dca_signal_07, dca_signal_17, dca_signal_00, dca_signal_01, dca_signal_02} = SUPPORT_PAD? dca_signal_20[MATRIX_NUM_ROW+LOG2RU(MATRIX_NUM_ROW)+3+LOG2RU(MATRIX_NUM_COL)+3+MATRIX_NUM_COL-1:0] : 0;
assign dca_signal_22 = dca_port_04 << (BW_LSU_ELEMENT*dca_signal_01);

assign dca_signal_03 = (&dca_signal_02) | (&dca_signal_15);

always@(posedge dca_port_02, negedge dca_port_12)
begin
  if(dca_port_12==0)
    dca_signal_06 <= 0;
  else if(dca_port_06)
    dca_signal_06 <= 0;
  else if(dca_port_03)
  begin
    if(dca_signal_04)
    begin
      if(dca_signal_12)
        dca_signal_06 <= 0;
      else
        dca_signal_06 <= dca_signal_06 + 1'b 1;
    end
  end
end

assign dca_signal_12 = (dca_signal_06==dca_signal_08);
assign dca_signal_10 = SUPPORT_PAD? (dca_signal_03 | dca_signal_15[dca_signal_06]) : 0;
assign dca_signal_04 = dca_port_00 & dca_port_07;

assign dca_port_10 = dca_signal_10? 0 : dca_port_07;
assign dca_port_00 = dca_signal_10? dca_port_09 : dca_port_08;
assign dca_port_13 = SUPPORT_PAD? dca_signal_12 : dca_signal_14;

generate
for(i=0; i<MATRIX_NUM_COL; i=i+1)
begin : i_format
  assign dca_port_01[BW_TENSOR_SCALAR*i+:BW_TENSOR_SCALAR] = (~dca_signal_05[i])? INVALID_TENSOR_VALUE : (dca_signal_10 | dca_signal_02[i])? 0 : dca_signal_22[BW_LSU_ELEMENT*i+:BW_LSU_ELEMENT];
end
endgenerate

endmodule
