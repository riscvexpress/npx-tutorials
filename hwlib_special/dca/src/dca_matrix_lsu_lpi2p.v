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



module DCA_MATRIX_LSU_LPI2P
(
  clk,
  rstnn,
  clear,
  enable,
  busy,

  inst_wvalid,
  inst_wdata,
  inst_wready,
  inst_is_write,
  inst_decode_finish,
  inst_execute_finish,

  cache_flush,

  load_tensor_row_wvalid,
  load_tensor_row_wlast,
  load_tensor_row_wdata,
  load_tensor_row_wready,

  store_tensor_row_rvalid,
  store_tensor_row_rlast,
  store_tensor_row_rready,
  store_tensor_row_rdata,

  read_slqdready,
  read_slqvalid,
  read_slqhint,
  read_slqlast,
  read_slqafy,
  read_slqdata,
  read_slydready,
  read_slyvalid,
  read_slyhint,
  read_slylast,
  read_slydata,

  write_slqdready,
  write_slqvalid,
  write_slqhint,
  write_slqlast,
  write_slqafy,
  write_slqdata,
  write_slydready,
  write_slyvalid,
  write_slyhint,
  write_slylast,
  write_slydata
);



parameter LSU_PARA = 0;
parameter AXI_PARA = 32;
parameter BW_LPI_BURDEN = 1;
parameter MATRIX_SIZE_PARA = 4;
parameter TENSOR_PARA = 0;

`include "ervp_axi_lpara.vb"
`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_matrix_lsu_inst_lpara.vb"
`include "dca_tensor_scalar_lpara.vb"
`include "dca_tensor_dim_lpara.vb"

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam  BW_LPIXM_ADDR = BW_AXI_ADDR;
localparam  BW_LPIXM_DATA = BW_AXI_DATA;

`include "lpixm_lpara.vb"

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;
output wire busy;

localparam  DCA_LPARA_06 = BW_LSU_INST;

input wire inst_wvalid;
input wire [DCA_LPARA_06-1:0] inst_wdata;
output wire inst_wready;
output reg inst_is_write;
output wire inst_decode_finish;
output wire inst_execute_finish;

input wire cache_flush;

output wire load_tensor_row_wvalid;
output wire load_tensor_row_wlast;
output wire [BW_TENSOR_ROW-1:0] load_tensor_row_wdata;
input wire load_tensor_row_wready;

output wire store_tensor_row_rvalid;
output wire store_tensor_row_rlast;
input wire store_tensor_row_rready;
input wire [BW_TENSOR_ROW-1:0] store_tensor_row_rdata;

input wire [2-1:0] read_slqdready;
output wire read_slqvalid;
output wire read_slqhint;
output wire read_slqlast;
output wire read_slqafy;
output wire [BW_LPI_QDATA-1:0] read_slqdata;
output wire [2-1:0] read_slydready;
input wire read_slyvalid;
input wire read_slyhint;
input wire read_slylast;
input wire [BW_LPI_YDATA-1:0] read_slydata;

input wire [2-1:0] write_slqdready;
output wire write_slqvalid;
output wire write_slqhint;
output wire write_slqlast;
output wire write_slqafy;
output wire [BW_LPI_QDATA-1:0] write_slqdata;
output wire [2-1:0] write_slydready;
input wire write_slyvalid;
input wire write_slyhint;
input wire write_slylast;
input wire [BW_LPI_YDATA-1:0] write_slydata;

`include "dca_lsu_util.vb"
`include "dca_lsu_lpara.vb"
`include "motype_lpara.vb"

wire dca_signal_14;
wire dca_signal_25;
wire dca_signal_42;

wire dca_signal_55;

localparam  DCA_LPARA_00 = DCA_LPARA_06;
localparam  DCA_LPARA_01 = INST_FIFO_DEPTH;

wire dca_signal_49;
wire dca_signal_07;
wire [DCA_LPARA_00-1:0] dca_signal_17;
wire dca_signal_02;
wire dca_signal_53;
wire [DCA_LPARA_00-1:0] dca_signal_05;

localparam  DCA_LPARA_03 = BW_TXN_INFO;
localparam  DCA_LPARA_09 = MATRIX_NUM_COL;

wire dca_signal_03;
wire dca_signal_13;
wire [DCA_LPARA_03-1:0] dca_signal_45;
wire dca_signal_22;
wire dca_signal_52;
wire [DCA_LPARA_03-1:0] dca_signal_33;

wire dca_signal_63;
wire dca_signal_57;
wire [DCA_LPARA_03-1:0] dca_signal_51;
wire dca_signal_18;
wire dca_signal_65;
wire [DCA_LPARA_03-1:0] dca_signal_38;

wire dca_signal_21;
wire dca_signal_59;
wire [DCA_LPARA_03-1:0] dca_signal_11;
wire dca_signal_24;
wire dca_signal_19;
wire [DCA_LPARA_03-1:0] dca_signal_48;

wire dca_signal_06;
wire dca_signal_64;
wire [DCA_LPARA_03-1:0] dca_signal_34;
wire dca_signal_29;
wire dca_signal_36;
wire [DCA_LPARA_03-1:0] dca_signal_56;

localparam  DCA_LPARA_10 = BW_RRESP_INFO;
localparam  DCA_LPARA_07 = 2;

wire dca_signal_62;
wire dca_signal_04;
wire [DCA_LPARA_10-1:0] dca_signal_01;
wire dca_signal_54;
wire dca_signal_47;
wire [DCA_LPARA_10-1:0] dca_signal_08;

localparam  DCA_LPARA_12 = BW_WDATA_INFO;
localparam  DCA_LPARA_08 = 4;

wire dca_signal_20;
wire dca_signal_61;
wire [DCA_LPARA_12-1:0] dca_signal_27;
wire dca_signal_46;
wire dca_signal_26;
wire [DCA_LPARA_12-1:0] dca_signal_39;

wire dca_signal_15;
wire dca_signal_16;
wire [BW_AXI_DATA-1:0] dca_signal_12;
wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] dca_signal_30;
wire dca_signal_50;
wire dca_signal_35;

localparam  DCA_LPARA_04 = 2;
localparam  DCA_LPARA_05 = 0;
localparam  DCA_LPARA_02 = 1;
localparam  DCA_LPARA_11 = 2;

reg [DCA_LPARA_04-1:0] dca_signal_09;
wire dca_signal_60;
wire [DCA_LPARA_06-1:0] dca_signal_44;

wire [`BW_DCA_MATRIX_LSU_INST_OPCODE-1:0] dca_signal_40;

reg dca_signal_10;

wire dca_signal_31;
wire dca_signal_28;
wire dca_signal_41;
wire dca_signal_23;
wire dca_signal_00;
wire dca_signal_58;
wire dca_signal_37;
wire dca_signal_43;
wire dca_signal_32;

assign dca_signal_14 = (INCLUDE_INST_FIFO==1) & enable;
assign dca_signal_25 = READ_SUPPORTED & enable;
assign dca_signal_42 = WRITE_SUPPORTED & enable;

ERVP_FIFO
#(
  .BW_DATA(DCA_LPARA_00),
  .DEPTH(DCA_LPARA_01)
)
i_dca_instance_01
(
  .clk(clk),
  .rstnn(rstnn),
  .enable(dca_signal_14),
  .clear(clear),

  .wready(dca_signal_49),
  .wfull(),
  .wrequest(dca_signal_07),
  .wdata(dca_signal_17),
  .wnum(),
  .rready(dca_signal_02),
  .rempty(),
  .rrequest(dca_signal_53),
  .rdata(dca_signal_05),
  .rnum()
);

assign dca_signal_07 = inst_wvalid;
assign dca_signal_17 = inst_wdata;
assign dca_signal_53 = inst_decode_finish;

always@(posedge clk, negedge rstnn)
begin
  if(rstnn==0)
  begin
    dca_signal_09 <= DCA_LPARA_05;
    inst_is_write <= 0;
  end
  else if(enable)
    case(dca_signal_09)
      DCA_LPARA_05:
        if(dca_signal_60)
          dca_signal_09 <= DCA_LPARA_02;
      DCA_LPARA_02:
        if(dca_signal_10)
        begin
          dca_signal_09 <= DCA_LPARA_11;
          inst_is_write <= (dca_signal_40==LSU_INST_OPCODE_WRITE);
        end
      DCA_LPARA_11:
        if(inst_decode_finish)
          dca_signal_09 <= DCA_LPARA_05;
    endcase
end

assign dca_signal_60 = (INCLUDE_INST_FIFO==0)? inst_wvalid : dca_signal_02;
assign dca_signal_44 = (INCLUDE_INST_FIFO==0)? inst_wdata : dca_signal_05;
assign inst_wready = (INCLUDE_INST_FIFO==0)? inst_decode_finish : dca_signal_49;

assign dca_signal_40 = dca_signal_44;

always@(*)
begin
  dca_signal_10 = 0;
  if(dca_signal_09==DCA_LPARA_02)
    case(dca_signal_40)
      LSU_INST_OPCODE_READ:
        dca_signal_10 = ~dca_signal_37;
      LSU_INST_OPCODE_WRITE:
        dca_signal_10 = ~dca_signal_41;
    endcase
end

DCA_MODULE_10
#(
  .LSU_PARA(LSU_PARA),
  .AXI_PARA(AXI_PARA),
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .DCA_GPARA_0(DCA_LPARA_09)
)
i_dca_instance_03
(
  .dca_port_05(clk),
  .dca_port_23(rstnn),
  .dca_port_09(clear),
  .dca_port_21(enable),
  .dca_port_02(dca_signal_31),

  .dca_port_20(dca_signal_55),

  .dca_port_28(dca_signal_10),
  .dca_port_14(dca_signal_44),
  .dca_port_17(),

  .dca_port_00(dca_signal_03),
  .dca_port_12(dca_signal_13),
  .dca_port_04(dca_signal_45),

  .dca_port_22(dca_signal_63),
  .dca_port_25(dca_signal_57),
  .dca_port_11(dca_signal_51),

  .dca_port_13(dca_signal_21),
  .dca_port_24(dca_signal_59),
  .dca_port_27(dca_signal_11),

  .dca_port_19(dca_signal_06),
  .dca_port_16(dca_signal_64),
  .dca_port_07(dca_signal_34),

  .dca_port_10(dca_signal_62),
  .dca_port_26(dca_signal_04),
  .dca_port_15(dca_signal_01),

  .dca_port_08(dca_signal_20),
  .dca_port_29(dca_signal_61),
  .dca_port_03(dca_signal_27),

  .dca_port_18(load_tensor_row_wvalid),
  .dca_port_06(load_tensor_row_wlast),
  .dca_port_01(load_tensor_row_wready)
);

assign dca_signal_55 = 1;

ERVP_FIFO
#(
  .BW_DATA(DCA_LPARA_03),
  .DEPTH(DCA_LPARA_09)
)
i_dca_instance_09
(
  .clk(clk),
  .rstnn(rstnn),
  .enable(dca_signal_25),
  .clear(clear),

  .wready(dca_signal_03),
  .wfull(),
  .wrequest(dca_signal_13),
  .wdata(dca_signal_45),
  .wnum(),
  .rready(dca_signal_22),
  .rempty(),
  .rrequest(dca_signal_52),
  .rdata(dca_signal_33),
  .rnum()
);

ERVP_FIFO
#(
  .BW_DATA(DCA_LPARA_03),
  .DEPTH(DCA_LPARA_09)
)
i_dca_instance_12
(
  .clk(clk),
  .rstnn(rstnn),
  .enable(dca_signal_25),
  .clear(clear),

  .wready(dca_signal_63),
  .wfull(),
  .wrequest(dca_signal_57),
  .wdata(dca_signal_51),
  .wnum(),
  .rready(dca_signal_18),
  .rempty(),
  .rrequest(dca_signal_65),
  .rdata(dca_signal_38),
  .rnum()
);

ERVP_FIFO
#(
  .BW_DATA(DCA_LPARA_03),
  .DEPTH(DCA_LPARA_09)
)
i_dca_instance_06
(
  .clk(clk),
  .rstnn(rstnn),
  .enable(dca_signal_42),
  .clear(clear),

  .wready(dca_signal_21),
  .wfull(),
  .wrequest(dca_signal_59),
  .wdata(dca_signal_11),
  .wnum(),
  .rready(dca_signal_24),
  .rempty(),
  .rrequest(dca_signal_19),
  .rdata(dca_signal_48),
  .rnum()
);

DCA_MODULE_15
#(
  .LSU_PARA(LSU_PARA),
  .AXI_PARA(AXI_PARA),
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .DCA_GPARA_0(DCA_LPARA_09)
)
i_dca_instance_08
(
  .dca_port_05(clk),
  .dca_port_07(rstnn),
  .dca_port_04(dca_signal_42),
  .dca_port_08(clear),

  .dca_port_02(dca_signal_06),
  .dca_port_00(dca_signal_64),
  .dca_port_03(dca_signal_34),
  .dca_port_06(dca_signal_29),
  .dca_port_09(dca_signal_36),
  .dca_port_01(dca_signal_56)
);

ERVP_FIFO
#(
  .BW_DATA(DCA_LPARA_10),
  .DEPTH(DCA_LPARA_07)
)
i_dca_instance_02
(
  .clk(clk),
  .rstnn(rstnn),
  .enable(dca_signal_25),
  .clear(clear),

  .wready(dca_signal_62),
  .wfull(),
  .wrequest(dca_signal_04),
  .wdata(dca_signal_01),
  .wnum(),
  .rready(dca_signal_54),
  .rempty(),
  .rrequest(dca_signal_47),
  .rdata(dca_signal_08),
  .rnum()
);

ERVP_FIFO
#(
  .BW_DATA(DCA_LPARA_12),
  .DEPTH(DCA_LPARA_08)
)
i_dca_instance_04
(
  .clk(clk),
  .rstnn(rstnn),
  .enable(dca_signal_42),
  .clear(clear),

  .wready(dca_signal_20),
  .wfull(),
  .wrequest(dca_signal_61),
  .wdata(dca_signal_27),
  .wnum(),
  .rready(dca_signal_46),
  .rempty(),
  .rrequest(dca_signal_26),
  .rdata(dca_signal_39),
  .rnum()
);

DCA_MODULE_23
#(
  .LSU_PARA(LSU_PARA),
  .AXI_PARA(AXI_PARA),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_10
(
  .dca_port_12(clk),
  .dca_port_11(rstnn),
  .dca_port_14(clear),
  .dca_port_06(dca_signal_25),
  .dca_port_09(dca_signal_28),

  .dca_port_08(dca_signal_44),

  .dca_port_01(dca_signal_22),
  .dca_port_10(dca_signal_33),
  .dca_port_03(dca_signal_52),

  .dca_port_02(read_slqdready),
  .dca_port_04(read_slqvalid),
  .dca_port_00(read_slqhint),
  .dca_port_13(read_slqlast),
  .dca_port_07(read_slqafy),
  .dca_port_05(read_slqdata)
);

assign inst_decode_finish = (dca_signal_09==DCA_LPARA_11) & (~dca_signal_31) & (~dca_signal_22) & (~dca_signal_24);

DCA_MODULE_09
#(
  .LSU_PARA(LSU_PARA),
  .AXI_PARA(AXI_PARA),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .TENSOR_PARA(TENSOR_PARA)
)
i_dca_instance_05
(
  .dca_port_16(clk),
  .dca_port_14(rstnn),
  .dca_port_03(clear),
  .dca_port_00(dca_signal_25),
  .dca_port_15(dca_signal_41),

  .dca_port_18(dca_signal_23),

  .dca_port_05(dca_signal_54),
  .dca_port_19(dca_signal_08),
  .dca_port_20(dca_signal_47),

  .dca_port_01(dca_signal_18),
  .dca_port_13(dca_signal_38),
  .dca_port_07(dca_signal_65),

  .dca_port_08(read_slydready),
  .dca_port_10(read_slyvalid),
  .dca_port_06(read_slyhint),
  .dca_port_09(read_slylast),
  .dca_port_17(read_slydata),

  .dca_port_11(load_tensor_row_wvalid),
  .dca_port_04(load_tensor_row_wlast),
  .dca_port_12(load_tensor_row_wdata),
  .dca_port_02(load_tensor_row_wready)
);

DCA_MODULE_00
#(
  .LSU_PARA(LSU_PARA),
  .AXI_PARA(AXI_PARA),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .TENSOR_PARA(TENSOR_PARA)
)
i_dca_instance_00
(
  .dca_port_05(clk),
  .dca_port_17(rstnn),
  .dca_port_20(clear),
  .dca_port_19(dca_signal_42),
  .dca_port_10(dca_signal_58),

  .dca_port_02(dca_signal_46),
  .dca_port_13(dca_signal_39),
  .dca_port_03(dca_signal_26),

  .dca_port_07(dca_signal_29),
  .dca_port_06(dca_signal_56),
  .dca_port_12(dca_signal_36),

  .dca_port_08(store_tensor_row_rvalid),
  .dca_port_01(store_tensor_row_rlast),
  .dca_port_15(store_tensor_row_rready),
  .dca_port_09(store_tensor_row_rdata),

  .dca_port_00(dca_signal_15),
  .dca_port_14(dca_signal_16),
  .dca_port_11(dca_signal_12),
  .dca_port_16(dca_signal_30),
  .dca_port_04(dca_signal_50),
  .dca_port_18(dca_signal_35)
);

DCA_MODULE_02
#(
  .LSU_PARA(LSU_PARA),
  .AXI_PARA(AXI_PARA),
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .DCA_GPARA_0(DCA_LPARA_08)
)
i_dca_instance_11
(
  .dca_port_09(clk),
  .dca_port_14(rstnn),
  .dca_port_01(clear),
  .dca_port_06(dca_signal_42),
  .dca_port_07(dca_signal_37),

  .dca_port_13(dca_signal_43),
  .dca_port_02(dca_signal_32),

  .dca_port_10(dca_signal_15),
  .dca_port_04(dca_signal_16),
  .dca_port_15(dca_signal_50),
  .dca_port_08(dca_signal_35),

  .dca_port_11(write_slydready),
  .dca_port_05(write_slyvalid),
  .dca_port_00(write_slyhint),
  .dca_port_12(write_slylast),
  .dca_port_03(write_slydata)
);

assign dca_signal_43 = dca_signal_23;

DCA_MODULE_13
#(
  .LSU_PARA(LSU_PARA),
  .AXI_PARA(AXI_PARA),
  .BW_LPI_BURDEN(BW_LPI_BURDEN),
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_07
(
  .dca_port_01(clk),
  .dca_port_20(rstnn),
  .dca_port_00(clear),
  .dca_port_13(dca_signal_42),
  .dca_port_10(dca_signal_00),

  .dca_port_18(dca_signal_44),

  .dca_port_02(dca_signal_24),
  .dca_port_03(dca_signal_48),
  .dca_port_11(dca_signal_19),

  .dca_port_17(dca_signal_15),
  .dca_port_14(dca_signal_16),
  .dca_port_06(dca_signal_12),
  .dca_port_08(dca_signal_30),
  .dca_port_19(dca_signal_50),
  .dca_port_15(dca_signal_35),

  .dca_port_05(write_slqdready),
  .dca_port_04(write_slqvalid),
  .dca_port_12(write_slqhint),
  .dca_port_07(write_slqlast),
  .dca_port_09(write_slqafy),
  .dca_port_16(write_slqdata)
);

assign inst_execute_finish = dca_signal_23 | dca_signal_32;
assign busy = dca_signal_02 | (dca_signal_09!=DCA_LPARA_05) | dca_signal_31 | dca_signal_41 | dca_signal_58 | dca_signal_37;

endmodule
