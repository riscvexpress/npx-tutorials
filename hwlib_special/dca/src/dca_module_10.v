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





module DCA_MODULE_10
(
  dca_port_05,
  dca_port_23,
  dca_port_09,
  dca_port_21,
  dca_port_02,

  dca_port_20,

  dca_port_28,
  dca_port_14,
  dca_port_17,

  dca_port_00,
  dca_port_12,
  dca_port_04,

  dca_port_22,
  dca_port_25,
  dca_port_11,

  dca_port_13,
  dca_port_24,
  dca_port_27,

  dca_port_19,
  dca_port_16,
  dca_port_07,

  dca_port_10,
  dca_port_26,
  dca_port_15,

  dca_port_08,
  dca_port_29,
  dca_port_03,

  dca_port_18,
  dca_port_06,
  dca_port_01
);





parameter LSU_PARA = 0;
parameter AXI_PARA = 32;
parameter MATRIX_SIZE_PARA = 4;

`include "ervp_axi_lpara.vb"
`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_matrix_lsu_inst_lpara.vb"

parameter DCA_GPARA_0 = MATRIX_NUM_COL;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire dca_port_05;
input wire dca_port_23;
input wire dca_port_09;
input wire dca_port_21;
output wire dca_port_02;

input wire dca_port_20;

localparam  DCA_LPARA_01 = BW_LSU_INST;

input wire dca_port_28;
input wire [DCA_LPARA_01-1:0] dca_port_14;
output wire dca_port_17;

`include "dca_lsu_util.vb"
`include "dca_lsu_lpara.vb"

input wire dca_port_00;
output wire dca_port_12;
output wire [BW_TXN_INFO-1:0] dca_port_04;

input wire dca_port_22;
output wire dca_port_25;
output wire [BW_TXN_INFO-1:0] dca_port_11;

input wire dca_port_13;
output wire dca_port_24;
output wire [BW_TXN_INFO-1:0] dca_port_27;

input wire dca_port_19;
output wire dca_port_16;
output wire [BW_TXN_INFO-1:0] dca_port_07;

input wire dca_port_10;
output wire dca_port_26;
output wire [BW_RRESP_INFO-1:0] dca_port_15;

input wire dca_port_08;
output wire dca_port_29;
output wire [BW_WDATA_INFO-1:0] dca_port_03;

input wire dca_port_18;
input wire dca_port_06;
input wire dca_port_01;

integer i;

wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_50;
wire [`BW_DCA_MATRIX_INFO_ADDR-1:0] dca_signal_45;
wire [`BW_DCA_MATRIX_INFO_STRIDE_LS3-1:0] dca_signal_06;
wire [`BW_DCA_MATRIX_INFO_NUM_ROW_M1-1:0] dca_signal_19;
wire [`BW_DCA_MATRIX_INFO_NUM_COL_M1-1:0] dca_signal_47;
wire [`BW_DCA_MATRIX_INFO_IS_SIGNED-1:0] dca_signal_04;
wire [`BW_DCA_MATRIX_INFO_IS_FLOAT-1:0] dca_signal_58;
wire [`BW_DCA_MATRIX_INFO_ADDR_LSA_P3-1:0] dca_signal_11;
wire [`BW_DCA_MATRIX_INFO_BIT_OFFSET-1:0] dca_signal_28;
wire [`BW_DCA_MATRIX_INFO_IS_BINARY-1:0] dca_signal_37;
wire [BW_LSU_PAD_INFO-1:0] dca_signal_25;
wire [3-1:0] dca_signal_12;
wire [MATRIX_NUM_COL-1:0] dca_signal_29;
wire [MATRIX_NUM_ROW-1:0] dca_signal_39;
wire [LOG2RU(MATRIX_NUM_COL)-1:0] dca_signal_23;
wire [3-1:0] dca_signal_26;
wire [LOG2RU(MATRIX_NUM_ROW)-1:0] dca_signal_54;

wire dca_signal_22;
wire [BW_BITADDR-1:0] dca_signal_18;
wire [BW_BITADDR-1:0] dca_signal_42;
wire [BW_BITADDR-1:0] dca_signal_43;
wire [`BW_DCA_MATRIX_INFO_NUM_COL_M1-1:0] dca_signal_49;
wire [`BW_DCA_MATRIX_INFO_NUM_ROW_M1-1:0] dca_signal_20;

wire dca_signal_16;
wire dca_signal_41;

localparam  DCA_LPARA_15 = 2;
localparam  DCA_LPARA_11 = 0;
localparam  DCA_LPARA_14 = 1;
localparam  DCA_LPARA_13 = 2;

reg [DCA_LPARA_15-1:0] dca_signal_15;
wire dca_signal_57;
wire dca_signal_02;

reg [MATRIX_NUM_COL-1:0] dca_signal_24;

localparam  DCA_LPARA_05 = 3;
localparam  DCA_LPARA_03 = 0;
localparam  DCA_LPARA_09 = 1;
localparam  DCA_LPARA_16 = 3;
localparam  DCA_LPARA_12 = 5;
localparam  DCA_LPARA_08 = 7;

reg [DCA_LPARA_05-1:0] dca_signal_59;
wire dca_signal_51;
wire dca_signal_09;

localparam  DCA_LPARA_17 = REQUIRED_BITWIDTH_INDEX(MATRIX_NUM_ROW);

reg [DCA_LPARA_17-1:0] dca_signal_48;
wire dca_signal_14;

reg [BW_BITADDR-1:0] dca_signal_46;
reg [BW_BITADDR-1:0] dca_signal_13;
wire [BW_BITADDR-1:0] dca_signal_03;

localparam  DCA_LPARA_06 = `BW_AXI_ALEN+BW_BITADDR_OFFSET;

wire [DCA_LPARA_06-1:0] dca_signal_35;
wire [DCA_LPARA_06-1:0] dca_signal_07;
wire [DCA_LPARA_06-1:0] dca_signal_31;

reg [`BW_AXI_ALEN-1:0] dca_signal_40;
wire [`BW_AXI_ALEN-1:0] dca_signal_17;

reg dca_signal_08;
reg dca_signal_36;
reg dca_signal_52;
reg dca_signal_30;
wire dca_signal_55;

wire dca_signal_44;
wire dca_signal_38;

wire dca_signal_10;
wire dca_signal_01;
wire [BW_TXN_INFO-1:0] dca_signal_53;

localparam  DCA_LPARA_10 = DCA_LPARA_06;
localparam  DCA_LPARA_04 = `BW_DCA_MATRIX_INFO_ADDR_LSA_P3;

wire [DCA_LPARA_10-1:0] dca_signal_21;
wire [DCA_LPARA_04-1:0] dca_signal_56;
wire [DCA_LPARA_10-1:0] dca_signal_33;

localparam  DCA_LPARA_07 = 1;
localparam  DCA_LPARA_00 = 0;
localparam  DCA_LPARA_02 = 1;

reg [DCA_LPARA_07-1:0] dca_signal_00;
wire dca_signal_34;
wire dca_signal_05;

reg [DCA_GPARA_0-1:0] dca_signal_32;
wire dca_signal_27;

assign {dca_signal_37, dca_signal_28, dca_signal_11, dca_signal_58, dca_signal_04, dca_signal_47, dca_signal_19, dca_signal_06, dca_signal_45, dca_signal_50} = dca_port_14;
assign dca_signal_25 = dca_port_14[`BW_DCA_MATRIX_LSU_INST_OPCODE+`BW_DCA_MATRIX_INFO_ALIGNED+:BW_LSU_PAD_INFO];
assign {dca_signal_39, dca_signal_54, dca_signal_26, dca_signal_23, dca_signal_12, dca_signal_29} = SUPPORT_PAD? dca_signal_25[MATRIX_NUM_ROW+LOG2RU(MATRIX_NUM_ROW)+3+LOG2RU(MATRIX_NUM_COL)+3+MATRIX_NUM_COL-1:0] : 0;

assign dca_signal_22 = (&dca_signal_29) | (&dca_signal_39);
assign dca_signal_18 = $unsigned(dca_signal_12) << dca_signal_11;
assign dca_signal_42 = $unsigned(dca_signal_26) * $unsigned(dca_signal_06);
assign dca_signal_43 = {dca_signal_45, dca_signal_28} + dca_signal_18 + dca_signal_42;
assign dca_signal_49 = SUPPORT_PAD? dca_signal_23 : dca_signal_47;
assign dca_signal_20 = SUPPORT_PAD? dca_signal_54 : dca_signal_19;

assign dca_signal_16 = (~dca_signal_50[`DCA_MATRIX_LSU_INST_OPCODE_INDEX_WRITE]);
assign dca_signal_41 = dca_signal_50[`DCA_MATRIX_LSU_INST_OPCODE_INDEX_WRITE];

always@(posedge dca_port_05, negedge dca_port_23)
begin
  if(dca_port_23==0)
    dca_signal_15 <= DCA_LPARA_11;
  else if(dca_port_21)
    case(dca_signal_15)
      DCA_LPARA_11:
        if(dca_port_28)
          dca_signal_15 <= DCA_LPARA_14;
      DCA_LPARA_14:
        if(dca_signal_57)
          dca_signal_15 <= DCA_LPARA_13;
      DCA_LPARA_13:
        if(dca_port_17)
          dca_signal_15 <= DCA_LPARA_11;
    endcase
end

always@(posedge dca_port_05, negedge dca_port_23)
begin
  if(dca_port_23==0)
    dca_signal_24 <= 0;
  else if(dca_port_28)
  begin
    for(i=0; i<MATRIX_NUM_COL; i=i+1)
      dca_signal_24[i] <= (i<=dca_signal_47);
  end
end

assign dca_signal_57 = dca_signal_16? dca_port_10 : dca_port_08;
assign dca_signal_02 = (dca_signal_15==DCA_LPARA_14);

assign dca_port_26 = dca_signal_16 & dca_signal_02;
assign dca_port_15 = {dca_port_14, dca_signal_24};
assign dca_port_29 = dca_signal_41 & dca_signal_02;
assign dca_port_03 = {dca_port_14, dca_signal_24};

always@(posedge dca_port_05, negedge dca_port_23)
begin
  if(dca_port_23==0)
    dca_signal_59 <= DCA_LPARA_03;
  else if(dca_port_21)
    case(dca_signal_59)
      DCA_LPARA_03:
        if(dca_port_28)
          dca_signal_59 <= dca_signal_22? DCA_LPARA_08 : DCA_LPARA_09;
      DCA_LPARA_09:
        dca_signal_59 <= DCA_LPARA_16;
      DCA_LPARA_16:
        dca_signal_59 <= DCA_LPARA_12;
      DCA_LPARA_12:
        if(dca_port_17)
          dca_signal_59 <= DCA_LPARA_03;
        else if(dca_signal_09)
          dca_signal_59 <= DCA_LPARA_08;
      DCA_LPARA_08:
        if(dca_port_17)
          dca_signal_59 <= DCA_LPARA_03;
    endcase
end

assign dca_port_17 = (dca_signal_15==DCA_LPARA_13) & (((dca_signal_59==DCA_LPARA_12) & dca_signal_09) | (dca_signal_59==DCA_LPARA_08));
assign dca_signal_51 = dca_signal_01 & dca_signal_10;
assign dca_signal_09 = dca_signal_51 & dca_signal_14;

always@(posedge dca_port_05, negedge dca_port_23)
begin
  if(dca_port_23==0)
    dca_signal_48 <= 0;
  else if(dca_port_21)
  begin
    if(dca_signal_09)
      dca_signal_48 <= 0;
    else if(dca_signal_51)
      dca_signal_48 <= dca_signal_48 + 1'b 1;
  end
end

assign dca_signal_14 = (dca_signal_48 == dca_signal_20[DCA_LPARA_17-1:0])? 1: 0;

always@(posedge dca_port_05 or negedge dca_port_23)
begin
  if(dca_port_23==0)
    dca_signal_46 <= 0;
  else if(dca_port_21)
    case(dca_signal_59)
      DCA_LPARA_16:
        dca_signal_46 <= dca_signal_13;
      DCA_LPARA_12:
        if(dca_signal_51)
          dca_signal_46 <= dca_signal_13;
    endcase
end

always@(posedge dca_port_05 or negedge dca_port_23)
begin
  if(dca_port_23==0)
    dca_signal_13 <= 0;
  else if(dca_port_21)
    case(dca_signal_59)
      DCA_LPARA_09:
        dca_signal_13 <= dca_signal_43;
      DCA_LPARA_16:
        dca_signal_13 <= dca_signal_03;
      DCA_LPARA_12:
        if(dca_signal_51)
          dca_signal_13 <= dca_signal_03;
    endcase
end
assign dca_signal_03 = dca_signal_13 + dca_signal_06;

ERVP_BARREL_SHIFTER
#(
  .BW_DATA(DCA_LPARA_10),
  .BW_SHIFT_AMOUNT(DCA_LPARA_04),
  .SIGNED_AMOUNT(0),
  .PLUS_TO_LEFT(1),
  .CIRCULAR_SHIFT(0),
  .LSB_FILL_VALUE(1)
)
i_dca_instance_0
(
  .data_input(dca_signal_21),
  .shift_amount(dca_signal_56),
  .data_output(dca_signal_33)
);

assign dca_signal_21 = $unsigned(dca_signal_49);
assign dca_signal_56 = dca_signal_11;
assign dca_signal_35 = dca_signal_33;

assign dca_signal_07 = $unsigned({dca_signal_13[BW_BITADDR_OFFSET-1:3],3'b 000});
assign dca_signal_31 = ($unsigned(dca_signal_07) + $unsigned(dca_signal_35)) >> 3;
assign dca_signal_17 = dca_signal_31 >> BW_AXI_ADDR_OFFSET;

always@(posedge dca_port_05 or negedge dca_port_23)
begin
  if(dca_port_23==0)
    dca_signal_40 <= 0;
  else if(dca_port_21)
    case(dca_signal_59)
      DCA_LPARA_16:
        dca_signal_40 <= dca_signal_17;
      DCA_LPARA_12:
        if(dca_signal_51)
          dca_signal_40 <= dca_signal_17;
    endcase
end

always@(posedge dca_port_05 or negedge dca_port_23)
begin
  if(dca_port_23==0)
    dca_signal_08 <= 0;
  else if(dca_port_21)
    case(dca_signal_59)
      DCA_LPARA_09:
        if(dca_signal_06[`BW_DCA_MATRIX_INFO_STRIDE_LS3-1:BW_BITADDR_OFFSET]==0)
          dca_signal_08 <= 1;
        else
          dca_signal_08 <= 0;
    endcase
end

always@(*)
begin
  dca_signal_36 = 0;
  if(dca_signal_08)
    if(dca_signal_13[BW_BITADDR_OFFSET]==dca_signal_46[BW_BITADDR_OFFSET])
      dca_signal_36 = 1;
end

always@(*)
begin
  dca_signal_52 = 0;
  if(dca_signal_17==dca_signal_40)
    dca_signal_52 = 1;
end

always@(posedge dca_port_05 or negedge dca_port_23)
begin
  if(dca_port_23==0)
    dca_signal_30 <= 0;
  else if(dca_port_21)
    case(dca_signal_59)
      DCA_LPARA_09:
        dca_signal_30 <= 0;
      DCA_LPARA_12:
        if(dca_signal_51)
          dca_signal_30 <= dca_signal_36 & dca_signal_52;
    endcase
end

always@(posedge dca_port_05 or negedge dca_port_23)
begin
  if(dca_port_23==0)
    dca_signal_00 <= DCA_LPARA_00;
  else if(dca_port_21)
  begin
    case(dca_signal_00)
      DCA_LPARA_00:
        if(dca_signal_34)
          dca_signal_00 <= DCA_LPARA_02;
      DCA_LPARA_02:
        if(dca_signal_34)
          dca_signal_00 <= DCA_LPARA_02;
        else if(dca_port_01)
          dca_signal_00 <= DCA_LPARA_00;
    endcase
  end
end

assign dca_signal_34 = dca_port_18 & dca_port_06 & dca_port_01;
assign dca_signal_05 = (dca_signal_00==DCA_LPARA_02) & dca_port_01;

always@(posedge dca_port_05 or negedge dca_port_23)
begin
  if(dca_port_23==0)
    dca_signal_32 <= 0;
  else if(dca_port_21)
  begin
    if(dca_port_28 && dca_signal_16 && dca_signal_05)
      ;
    else if(dca_signal_05)
      dca_signal_32 <= dca_signal_32>>1;
    else if(dca_port_28 && dca_signal_16)
      dca_signal_32 <= {dca_signal_32, 1'b 1};
  end
end

assign dca_signal_27 = dca_signal_16 & (~dca_signal_50[`DCA_MATRIX_LSU_INST_OPCODE_INDEX_OVERDRIVE]) & dca_signal_32[2];

assign dca_signal_55 = dca_port_20 & dca_signal_30;

assign dca_signal_44 = dca_signal_16 & dca_port_22  & (~dca_signal_27);
assign dca_signal_38 = dca_signal_41 & dca_port_19;

assign dca_signal_10 = dca_signal_44 | dca_signal_38;
assign dca_signal_01 = (dca_signal_59==DCA_LPARA_12);
assign dca_signal_53 = {dca_signal_55, dca_signal_14, dca_signal_40, dca_signal_46};

assign dca_port_12 = dca_signal_44 & dca_signal_01 & (~dca_signal_55);
assign dca_port_04 = dca_signal_53;

assign dca_port_25 = dca_signal_44 & dca_signal_01;
assign dca_port_11 = dca_signal_53;

assign dca_port_24 = dca_signal_38 & dca_signal_01 & (~dca_signal_55);
assign dca_port_27 = dca_signal_53;

assign dca_port_16 = dca_signal_38 & dca_signal_01;
assign dca_port_07 = dca_signal_53;

assign dca_port_02 = (dca_signal_59!=DCA_LPARA_03);

endmodule
