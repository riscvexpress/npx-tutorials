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



module DCA_PADDED_MATRIX_SPLITER
(
  clk,
  rstnn,
  clear,
  enable,

  matrix_info,
  matrix_pad_option,
  init,
  is_col_first,
  iterate,
  go_next_base,

  block_info,
  is_first_x,
  is_last_x,
  is_first_y,
  is_last_y,
  is_first_element,
  is_last_element,
  valid_row_list,
  valid_col_list,
  block_pad_info
);



parameter MATRIX_SIZE_PARA = 8;

`include "dca_matrix_dim_util.vb"
`include "dca_matrix_dim_lpara.vb"
`include "dca_matrix_lsu_inst_lpara.vb"

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;

input wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] matrix_info;
input wire [`BW_DCA_PAD_OPTION-1:0] matrix_pad_option;
input wire init;
input wire is_col_first;
input wire iterate;
input wire go_next_base;

output wire [`BW_DCA_MATRIX_INFO_ALIGNED-1:0] block_info;
output wire is_first_x;
output wire is_last_x;
output wire is_first_y;
output wire is_last_y;
output wire is_first_element;
output wire is_last_element;

output wire [MATRIX_NUM_ROW-1:0] valid_row_list;
output wire [MATRIX_NUM_COL-1:0] valid_col_list;
output wire [BW_LSU_PAD_INFO-1:0] block_pad_info;

genvar i;

`include "ervp_log_util.vf"

wire dca_signal_29;
wire dca_signal_14;
wire dca_signal_31;
wire dca_signal_16;

wire [`BW_DCA_MATRIX_INFO_ADDR-1:0] dca_signal_18;
wire [`BW_DCA_MATRIX_INFO_STRIDE_LS3-1:0] dca_signal_28;
wire [`BW_DCA_MATRIX_INFO_NUM_ROW_M1-1:0] dca_signal_10;
wire [`BW_DCA_MATRIX_INFO_NUM_COL_M1-1:0] dca_signal_07;
wire [`BW_DCA_MATRIX_INFO_IS_SIGNED-1:0] dca_signal_15;
wire [`BW_DCA_MATRIX_INFO_IS_FLOAT-1:0] dca_signal_04;
wire [`BW_DCA_MATRIX_INFO_ADDR_LSA_P3-1:0] dca_signal_12;
wire [`BW_DCA_MATRIX_INFO_BIT_OFFSET-1:0] dca_signal_30;
wire [`BW_DCA_MATRIX_INFO_IS_BINARY-1:0] dca_signal_02;

reg [`BW_DCA_MATRIX_INFO_NUM_COL_M1+1-1:0] dca_signal_23;
reg [`BW_DCA_MATRIX_INFO_NUM_COL_M1+1-1:0] dca_signal_01;
reg [`BW_DCA_MATRIX_INFO_NUM_ROW_M1+1-1:0] dca_signal_32;
reg [`BW_DCA_MATRIX_INFO_NUM_ROW_M1+1-1:0] dca_signal_03;

wire [MATRIX_NUM_COL-1:0] dca_signal_25;
wire [MATRIX_NUM_COL-1:0] dca_signal_24;
wire [MATRIX_NUM_COL-1:0] dca_signal_06;
wire [MATRIX_NUM_ROW-1:0] dca_signal_00;
wire [MATRIX_NUM_ROW-1:0] dca_signal_27;
wire [MATRIX_NUM_ROW-1:0] dca_signal_33;
wire [3-1:0] dca_signal_13;
wire [LOG2RU(MATRIX_NUM_COL)-1:0] dca_signal_09;
wire [LOG2RU(MATRIX_NUM_COL)-1:0] dca_signal_05;
wire [3-1:0] dca_signal_21;
wire [LOG2RU(MATRIX_NUM_ROW)-1:0] dca_signal_20;
wire [LOG2RU(MATRIX_NUM_ROW)-1:0] dca_signal_26;

wire [3-1:0] dca_signal_19;
wire [3-1:0] dca_signal_11;
wire [3-1:0] dca_signal_17;
wire [3-1:0] dca_signal_08;
wire [4-1:0] dca_signal_22;

DCA_MATRIX_SPLITER
#(
  .MATRIX_SIZE_PARA(MATRIX_SIZE_PARA)
)
i_dca_instance_0
(
  .clk(clk),
  .rstnn(rstnn),
  .clear(clear),
  .enable(enable),

  .matrix_info(matrix_info),
  .init(init),
  .is_col_first(is_col_first),
  .iterate(iterate),
  .go_next_base(go_next_base),

  .block_info(block_info),
  .is_first_x(is_first_x),
  .is_last_x(is_last_x),
  .is_first_y(is_first_y),
  .is_last_y(is_last_y),
  .is_first_element(is_first_element),
  .is_last_element(is_last_element),
  .valid_row_list(valid_row_list),
  .valid_col_list(valid_col_list)
);

assign dca_signal_29 = is_col_first? is_first_y : is_first_x;
assign dca_signal_14 = is_col_first? is_last_y : is_last_x;
assign dca_signal_31 = is_col_first? is_first_x : is_first_y;
assign dca_signal_16 = is_col_first? is_last_x : is_last_y;

assign {dca_signal_02, dca_signal_30, dca_signal_12, dca_signal_04, dca_signal_15, dca_signal_07, dca_signal_10, dca_signal_28, dca_signal_18} = matrix_info;
assign {dca_signal_22, dca_signal_08, dca_signal_17, dca_signal_11, dca_signal_19} = matrix_pad_option;

always@(posedge clk, negedge rstnn)
begin
  if(rstnn==0)
  begin
    dca_signal_23 <= 0;
    dca_signal_01 <= 0;
    dca_signal_32 <= 0;
    dca_signal_03 <= 0;
  end
  else if(clear)
  begin
    dca_signal_23 <= 0;
    dca_signal_01 <= 0;
    dca_signal_32 <= 0;
    dca_signal_03 <= 0;
  end
  else if(enable)
  begin
    if(init)
    begin
      dca_signal_23 <= dca_signal_08;
      dca_signal_01 <= dca_signal_07 - dca_signal_17;
      dca_signal_32 <= dca_signal_11;
      dca_signal_03 <= dca_signal_10 - dca_signal_19;
    end
    else if(is_col_first)
    begin
      if(go_next_base)
      begin
        dca_signal_23 <= dca_signal_08;
        dca_signal_01 <= dca_signal_07 - dca_signal_17;
        if(is_last_y)
        begin
          dca_signal_32 <= dca_signal_11;
          dca_signal_03 <= dca_signal_10 - dca_signal_19;
        end
        else
        begin
          dca_signal_32 <= dca_signal_32 - MATRIX_NUM_ROW;
          dca_signal_03 <= dca_signal_03 - MATRIX_NUM_ROW;
        end
      end
      else if(iterate)
      begin
        if(is_last_x)
        begin
          dca_signal_23 <= dca_signal_08;
          dca_signal_01 <= dca_signal_07 - dca_signal_17;
        end
        else
        begin
          dca_signal_23 <= dca_signal_23 - MATRIX_NUM_COL;
          dca_signal_01 <= dca_signal_01 - MATRIX_NUM_COL;
        end
      end
    end
  end
end

generate
  for(i=0; i<MATRIX_NUM_COL; i=i+1)
  begin : i_gen_pad_col_list
    assign dca_signal_25[i] = (i < $signed(dca_signal_23));
    assign dca_signal_24[i] = (i > $signed(dca_signal_01));
  end
  for(i=0; i<MATRIX_NUM_ROW; i=i+1)
  begin : i_gen_pad_row_list
    assign dca_signal_00[i] = (i < $signed(dca_signal_32));
    assign dca_signal_27[i] = (i > $signed(dca_signal_03));
  end
endgenerate

assign dca_signal_06 = dca_signal_25 | dca_signal_24;
assign dca_signal_13 = ($signed(dca_signal_23)>0)? dca_signal_23 : 0;
assign dca_signal_09 = ($signed(dca_signal_01) > (MATRIX_NUM_COL-1))? (MATRIX_NUM_COL-1) : dca_signal_01;
assign dca_signal_05 = dca_signal_09 - dca_signal_13;

assign dca_signal_21 = ($signed(dca_signal_32)>0)? dca_signal_32 : 0;
assign dca_signal_20 = ($signed(dca_signal_03) > (MATRIX_NUM_ROW-1))? (MATRIX_NUM_ROW-1) : dca_signal_03;
assign dca_signal_26 = dca_signal_20 - dca_signal_21;
assign dca_signal_33 = dca_signal_00 | dca_signal_27;

assign block_pad_info = {dca_signal_33, dca_signal_26, dca_signal_21, dca_signal_05, dca_signal_13, dca_signal_06};

endmodule
