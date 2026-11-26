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

`include "dca_matrix_info.vh"
`include "dca_module_memorymap_offset.vh"




module DCA_MODULE_01
(
  dca_port_33,
  dca_port_15,
  dca_port_14,
  dca_port_16,
  dca_port_07,

  dca_port_12,
  dca_port_26,
  dca_port_00,
  dca_port_32,
  dca_port_25,
  dca_port_37,
  dca_port_23,
  dca_port_28,

  dca_port_31,
  dca_port_19,
  dca_port_36,
  dca_port_18,
  dca_port_43,
  dca_port_34,
  dca_port_42,
  dca_port_44,
  dca_port_24,
  dca_port_11,

  dca_port_35,
  dca_port_10,
  dca_port_06,
  dca_port_04,
  dca_port_40,
  dca_port_45,
  dca_port_30,
  dca_port_38,
  dca_port_05,
  dca_port_17,

  dca_port_22,
  dca_port_02,
  dca_port_01,
  dca_port_41,
  dca_port_21,
  dca_port_08,
  dca_port_13,
  dca_port_46,
  dca_port_29,
  dca_port_39,
  dca_port_03,
  dca_port_27,
  dca_port_09,
  dca_port_20
);




parameter MATRIX_SIZE_PARA = 8;
parameter TENSOR_PARA = 0;

`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_matrix_lsu_inst_lpara.vb"
`include "dca_include_2.vh"
`include "dca_tensor_scalar_lpara.vb"
`include "dca_tensor_dim_lpara.vb"

input wire dca_port_33;
input wire dca_port_15;
input wire dca_port_14;
input wire dca_port_16;
output wire dca_port_07;

localparam  DCA_LPARA_4 = `BW_DCA_NEUGEMM_INST;
localparam  DCA_LPARA_1 = `BW_DCA_NEUGEMM_LOG;
localparam  DCA_LPARA_2 = `BW_DCA_NEUGEMM_STATUS;

input wire dca_port_12;
input wire [DCA_LPARA_4-1:0] dca_port_26;
output wire dca_port_00;
output wire dca_port_32;
input wire dca_port_25;
output wire dca_port_37;
output wire [DCA_LPARA_1-1:0] dca_port_23;
output wire [DCA_LPARA_2-1:0] dca_port_28;

input wire dca_port_31;
output wire dca_port_19;
output wire [BW_LSU_INST-1:0] dca_port_36;
input wire dca_port_18;
input wire dca_port_43;
input wire dca_port_34;

output wire dca_port_42;
input wire dca_port_44;
input wire dca_port_24;
input wire [BW_TENSOR_ROW-1:0] dca_port_11;

input wire dca_port_35;
output wire dca_port_10;
output wire [BW_LSU_INST-1:0] dca_port_06;
input wire dca_port_04;
input wire dca_port_40;
input wire dca_port_45;

output wire dca_port_30;
input wire dca_port_38;
input wire dca_port_05;
input wire [BW_TENSOR_ROW-1:0] dca_port_17;

input wire dca_port_22;
output wire dca_port_02;
output wire [BW_LSU_INST-1:0] dca_port_01;
input wire dca_port_41;
input wire dca_port_21;
input wire dca_port_08;

output wire dca_port_13;
input wire dca_port_46;
input wire dca_port_29;
input wire [BW_TENSOR_ROW-1:0] dca_port_39;
input wire dca_port_03;
output wire dca_port_27;
input wire dca_port_09;
output wire [BW_TENSOR_ROW-1:0] dca_port_20;

localparam  DCA_LPARA_0 = BW_BLOCKED_STEP_INST;
localparam  DCA_LPARA_3 = 4;

wire dca_signal_39;
wire dca_signal_49;
wire [DCA_LPARA_0-1:0] dca_signal_28;
wire dca_signal_55;
wire dca_signal_38;
wire [DCA_LPARA_0-1:0] dca_signal_57;

localparam  DCA_LPARA_6 = BW_TENSOR_ROW;
localparam  DCA_LPARA_5 = TENSOR_ZERO;

wire dca_signal_14;
wire [DCA_LPARA_6-1:0] dca_signal_62;
wire dca_signal_56;
wire [DCA_LPARA_6-1:0] dca_signal_61;
wire dca_signal_18;
wire dca_signal_30;
wire dca_signal_59;
wire [BW_TENSOR_MATRIX-1:0] dca_signal_22;
wire [BW_TENSOR_ROW-1:0] dca_signal_16;

wire dca_signal_48;
wire dca_signal_20;
wire dca_signal_33;

wire dca_signal_44;
wire [DCA_LPARA_6-1:0] dca_signal_31;
wire dca_signal_09;
wire [DCA_LPARA_6-1:0] dca_signal_23;
wire dca_signal_40;
wire dca_signal_36;
wire dca_signal_35;
wire [BW_TENSOR_MATRIX-1:0] dca_signal_00;
wire [BW_TENSOR_ROW-1:0] dca_signal_42;

wire dca_signal_41;
wire dca_signal_58;
wire dca_signal_50;

wire dca_signal_53;
wire dca_signal_54;
wire [DCA_LPARA_6-1:0] dca_signal_03;
wire dca_signal_17;
wire [DCA_LPARA_6-1:0] dca_signal_19;
wire [MATRIX_NUM_ELEMENT-1:0] dca_signal_12;
wire [BW_TENSOR_MATRIX-1:0] dca_signal_27;
wire [BW_TENSOR_MATRIX-1:0] dca_signal_13;

wire dca_signal_43;
wire dca_signal_37;
wire dca_signal_52;

wire dca_signal_05;
wire dca_signal_04;
wire dca_signal_10;

wire dca_signal_47;
wire dca_signal_24;
wire [DCA_LPARA_6-1:0] dca_signal_46;
wire dca_signal_01;
wire [DCA_LPARA_6-1:0] dca_signal_15;
wire [MATRIX_NUM_ELEMENT-1:0] dca_signal_60;
wire [BW_TENSOR_MATRIX-1:0] dca_signal_26;
wire [BW_TENSOR_MATRIX-1:0] dca_signal_51;

wire dca_signal_07;
wire [BW_TENSOR_SCALAR-1:0] dca_signal_45;
wire [BW_TENSOR_MATRIX-1:0] dca_signal_21;
wire [BW_TENSOR_ROW-1:0] dca_signal_06;

wire dca_signal_11;
wire dca_signal_25;
wire [BW_BLOCKED_STEP_INST-1:0] dca_signal_34;
wire dca_signal_08;
wire dca_signal_02;
wire dca_signal_32;
wire dca_signal_29;

wire dca_signal_63;

ERVP_FIFO
#(
  .BW_DATA(DCA_LPARA_0),
  .DEPTH(DCA_LPARA_3)
)
i_dca_instance_07
(
	.clk(dca_port_33),
  .rstnn(dca_port_15),
	.enable(dca_port_16),
  .clear(dca_port_14),
	.wready(dca_signal_39),
	.wfull(),
	.wrequest(dca_signal_49),
	.wdata(dca_signal_28),
	.wnum(),
	.rready(dca_signal_55),
	.rempty(),
	.rrequest(dca_signal_38),
	.rdata(dca_signal_57),
	.rnum()
);

DCA_MODULE_06
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_08
(
	.dca_port_05(dca_port_33),
	.dca_port_08(dca_port_15),
  .dca_port_22(dca_port_14),
  .dca_port_04(dca_port_16),
  .dca_port_13(),

  .dca_port_00(dca_port_12),
  .dca_port_02(dca_port_26),
  .dca_port_10(dca_port_00),
  .dca_port_09(dca_signal_02),
  .dca_port_14(dca_signal_32),
  .dca_port_06(dca_signal_29),

  .dca_port_20(dca_signal_39),
  .dca_port_03(dca_signal_49),
  .dca_port_18(dca_signal_28),
  .dca_port_11(dca_port_18),
  .dca_port_01(dca_port_19),
  .dca_port_12(dca_port_36),
  .dca_port_15(dca_port_04),
  .dca_port_07(dca_port_10),
  .dca_port_17(dca_port_06),
  .dca_port_19(dca_port_41),
  .dca_port_16(dca_port_02),
  .dca_port_21(dca_port_01)
);

DCA_MATRIX_REGISTER_TYPE3
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .BW_TENSOR_SCALAR(BW_TENSOR_SCALAR),
  .BW_MOVE_DATA(DCA_LPARA_6),
  .RESET_VALUE(DCA_LPARA_5)
)
i_dca_instance_09
(
  .clk(dca_port_33),
  .rstnn(dca_port_15),

  .move_wenable(dca_signal_14),
  .move_wdata_list(dca_signal_62),
  .move_renable(dca_signal_56),
  .move_rdata_list(dca_signal_61),
  
  .shift_up(dca_signal_18),
  .shift_left(dca_signal_30),
  .transpose(dca_signal_59),
  
  .all_rdata_list2d(dca_signal_22),
  .upmost_rdata_list1d(dca_signal_16)
);

assign dca_signal_56 = 0;
assign dca_signal_59 = 0;

DCA_MATRIX_LOAD2MREG
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .TENSOR_PARA(TENSOR_PARA)
)
i_dca_instance_11
(
  .clk(dca_port_33),
  .rstnn(dca_port_15),
  .clear(dca_port_14),
  .enable(dca_port_16),
  .busy(dca_signal_48),

  .load_tensor_row_wready(dca_port_42),
  .load_tensor_row_wvalid(dca_port_44),
  .load_tensor_row_wlast(dca_port_24),
  .load_tensor_row_wdata(dca_port_11),

  .mreg_move_wenable(dca_signal_14),
  .mreg_move_wdata_list1d(dca_signal_62),

  .loadreg_rready(dca_signal_20),
  .loadreg_rrequest(dca_signal_33)
);

DCA_MATRIX_REGISTER_TYPE3
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .BW_TENSOR_SCALAR(BW_TENSOR_SCALAR),
  .BW_MOVE_DATA(DCA_LPARA_6),
  .RESET_VALUE(DCA_LPARA_5)
)
i_dca_instance_12
(
  .clk(dca_port_33),
  .rstnn(dca_port_15),

  .move_wenable(dca_signal_44),
  .move_wdata_list(dca_signal_31),
  .move_renable(dca_signal_09),
  .move_rdata_list(dca_signal_23),
  
  .shift_up(dca_signal_40),
  .shift_left(dca_signal_36),
  .transpose(dca_signal_35),
  
  .all_rdata_list2d(dca_signal_00),
  .upmost_rdata_list1d(dca_signal_42)
);

assign dca_signal_09 =0;
assign dca_signal_35 = 0;

DCA_MATRIX_LOAD2MREG
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .TENSOR_PARA(TENSOR_PARA)
)
i_dca_instance_04
(
  .clk(dca_port_33),
  .rstnn(dca_port_15),
  .clear(dca_port_14),
  .enable(dca_port_16),
  .busy(dca_signal_41),

  .load_tensor_row_wready(dca_port_30),
  .load_tensor_row_wvalid(dca_port_38),
  .load_tensor_row_wlast(dca_port_05),
  .load_tensor_row_wdata(dca_port_17),

  .mreg_move_wenable(dca_signal_44),
  .mreg_move_wdata_list1d(dca_signal_31),

  .loadreg_rready(dca_signal_58),
  .loadreg_rrequest(dca_signal_50)
);

DCA_MATRIX_REGISTER_TYPE5
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .BW_TENSOR_SCALAR(BW_TENSOR_SCALAR),
  .RESET_VALUE(DCA_LPARA_5)
)
i_dca_instance_06
(
  .clk(dca_port_33),
  .rstnn(dca_port_15),

  .init(dca_signal_53),

  .move_wenable(dca_signal_54),
  .move_wdata_list(dca_signal_03),
  .move_renable(dca_signal_17),
  .move_rdata_list(dca_signal_19),

  .all_wenable_list2d(dca_signal_12),
  .all_wdata_list2d(dca_signal_27),
  .all_rdata_list2d(dca_signal_13)
);

DCA_MATRIX_LOAD2MREG
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .TENSOR_PARA(TENSOR_PARA)
)
i_dca_instance_02
(
  .clk(dca_port_33),
  .rstnn(dca_port_15),
  .clear(dca_port_14),
  .enable(dca_port_16),
  .busy(dca_signal_43),

  .load_tensor_row_wready(dca_port_13),
  .load_tensor_row_wvalid(dca_port_46),
  .load_tensor_row_wlast(dca_port_29),
  .load_tensor_row_wdata(dca_port_39),

  .mreg_move_wenable(dca_signal_54),
  .mreg_move_wdata_list1d(dca_signal_03),

  .loadreg_rready(dca_signal_37),
  .loadreg_rrequest(dca_signal_52)
);

DCA_MATRIX_MREG2STORE
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .BW_TENSOR_SCALAR(BW_TENSOR_SCALAR)
)
i_dca_instance_00
(
  .clk(dca_port_33),
  .rstnn(dca_port_15),
  .clear(dca_port_14),
  .enable(dca_port_16),
  .busy(dca_signal_05),

  .storereg_wready(dca_signal_04),
  .storereg_wrequest(dca_signal_10),

  .mreg_move_renable(dca_signal_17),
  .mreg_move_rdata_list1d(dca_signal_19),

  .store_tensor_row_rvalid(dca_port_03),
  .store_tensor_row_rready(dca_port_27),
  .store_tensor_row_rlast(dca_port_09),
  .store_tensor_row_rdata(dca_port_20)
);

DCA_MATRIX_REGISTER_TYPE5
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .BW_TENSOR_SCALAR(BW_TENSOR_SCALAR),
  .RESET_VALUE(DCA_LPARA_5)
)
i_dca_instance_05
(
  .clk(dca_port_33),
  .rstnn(dca_port_15),

  .init(dca_signal_47),

  .move_wenable(dca_signal_24),
  .move_wdata_list(dca_signal_46),
  .move_renable(dca_signal_01),
  .move_rdata_list(dca_signal_15),

  .all_wenable_list2d(dca_signal_60),
  .all_wdata_list2d(dca_signal_26),
  .all_rdata_list2d(dca_signal_51)
);

assign dca_signal_24 = 0;
assign dca_signal_46 = 0;
assign dca_signal_01 = 0;

DCA_MATRIX_REGISTER_CONSTANT
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .BW_TENSOR_SCALAR(BW_TENSOR_SCALAR)
)
i_dca_instance_03
(
  .clk(dca_port_33),
  .rstnn(dca_port_15),

  .scalar_wenable(dca_signal_07),
  .scalar_wdata(dca_signal_45),
  
  .all_rdata_list2d(dca_signal_21),
  .upmost_rdata_list1d(dca_signal_06)
);

assign dca_signal_45 = dca_signal_42[BW_TENSOR_SCALAR-1-:BW_TENSOR_SCALAR];

DCA_MODULE_20
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .TENSOR_PARA(TENSOR_PARA)
)
i_dca_instance_01
(
  .dca_port_14(dca_port_33),
  .dca_port_00(dca_port_15),
  .dca_port_21(dca_port_14),
  .dca_port_03(dca_port_16),
  .dca_port_22(dca_signal_11),

  .dca_port_11(dca_signal_25),
  .dca_port_07(dca_signal_34),
  .dca_port_08(dca_signal_08),

  .dca_port_13(dca_signal_22),
  .dca_port_01(dca_signal_18),
  .dca_port_09(dca_signal_30),

  .dca_port_05(dca_signal_00),
  .dca_port_10(dca_signal_40),
  .dca_port_20(dca_signal_36),

  .dca_port_06(dca_signal_07),
  .dca_port_16(dca_signal_21),

  .dca_port_17(dca_signal_13),
  .dca_port_15(dca_signal_53),
  .dca_port_19(dca_signal_12),
  .dca_port_18(dca_signal_27),

  .dca_port_02(dca_signal_51),
  .dca_port_04(dca_signal_60),
  .dca_port_12(dca_signal_26)
);

DCA_MODULE_07
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_10
(
  .dca_port_10(dca_port_33),
  .dca_port_11(dca_port_15),
  .dca_port_02(dca_port_14),
  .dca_port_15(dca_port_16),
  .dca_port_00(dca_signal_63),

  .dca_port_08(dca_signal_55),
  .dca_port_24(dca_signal_57),
  .dca_port_22(dca_signal_38),

  .dca_port_09(dca_signal_20),
  .dca_port_18(dca_signal_33),
  .dca_port_14(dca_signal_58),
  .dca_port_05(dca_signal_50),
  .dca_port_13(dca_signal_37),
  .dca_port_21(dca_signal_52),
  .dca_port_12(dca_signal_04),
  .dca_port_20(dca_signal_04),
  .dca_port_19(dca_signal_10),
  .dca_port_16(dca_port_08),

  .dca_port_04(dca_signal_25),
  .dca_port_03(dca_signal_34),
  .dca_port_07(dca_signal_08),

  .dca_port_17(dca_signal_02),
  .dca_port_01(dca_signal_32),
  .dca_port_06(dca_signal_29),
  .dca_port_23(dca_port_32)
);

assign dca_port_37 = 0;
assign dca_port_23 = 0;
assign dca_port_28 = 0;
assign dca_port_07 = dca_port_12 | dca_signal_55 | dca_signal_63;

endmodule
