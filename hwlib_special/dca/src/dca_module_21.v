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
`include "fpir_define.vh"




module DCA_MODULE_21
(
  dca_port_1,
  dca_port_7,
  dca_port_4,
  dca_port_5,

  dca_port_3,
  dca_port_6,
  dca_port_8,
  dca_port_2,
  dca_port_0
);




parameter TENSOR_PARA = 0;

`include "dca_tensor_scalar_lpara.vb"

input wire dca_port_1, dca_port_7;
input wire dca_port_4;
input wire dca_port_5;

input wire dca_port_3;
input wire [BW_TENSOR_SCALAR-1:0] dca_port_6;
input wire [BW_TENSOR_SCALAR-1:0] dca_port_8;
output wire dca_port_2;
output wire [BW_TENSOR_SCALAR-1:0] dca_port_0;

localparam  DCA_LPARA_4 = TENSOR_BW_EXPONENT + 1;
localparam  DCA_LPARA_2 = TENSOR_BW_SIGNIFICAND; 
localparam  DCA_LPARA_0 = 2*DCA_LPARA_2-1;

`ifdef PACT_SUPPORT_FLOAT32
localparam  DCA_LPARA_5 = `MAX(TENSOR_BW_INTEGER, (DCA_LPARA_2+1));
`else
localparam  DCA_LPARA_5 = TENSOR_BW_INTEGER;
`endif
localparam  DCA_LPARA_1 = 2*DCA_LPARA_5;

wire dca_signal_05;
reg  [DCA_LPARA_5-1:0] dca_signal_22;
reg  [DCA_LPARA_5-1:0] dca_signal_15;
wire dca_signal_21;
wire dca_signal_19;
wire [DCA_LPARA_1-1:0] dca_signal_07;

wire signed [TENSOR_BW_INTEGER-1:0] dca_signal_09;
wire signed [TENSOR_BW_INTEGER-1:0] dca_signal_01;
wire signed [TENSOR_BW_INTEGER-1:0] dca_signal_04;
wire dca_signal_18;

wire dca_signal_17;
wire dca_signal_02;
wire [`BW_FPIR_TYPE-1:0] dca_signal_20;
wire [TENSOR_BW_SIGNIFICAND-1:0] dca_signal_25;
wire [TENSOR_BW_SIGNIFICAND-1:0] dca_signal_12;
wire [DCA_LPARA_4-1:0] dca_signal_16;

wire dca_signal_00;
wire dca_signal_23;
wire [`BW_FPIR_TYPE-1:0] dca_signal_13;
wire [DCA_LPARA_4-1:0] dca_signal_03;
wire dca_signal_11;

wire [DCA_LPARA_2-1:0] dca_signal_06;
wire [DCA_LPARA_2-1:0] dca_signal_08;
wire [DCA_LPARA_0-1:0] dca_signal_14;

wire dca_signal_24;
wire [BW_TENSOR_SCALAR-1:0] dca_signal_10;

ERVP_PIPELINED_MULTIPLIER
#(
  .BW_INPUT(DCA_LPARA_5),
  .BW_OUTPUT(DCA_LPARA_1),
  .USE_LIBRARY(0)
)
i_dca_instance_2
(
  .clk(dca_port_1),
  .rstnn(dca_port_7),
  .enable(dca_port_4),
  .stall(1'b 0),

  .input_wvalid(dca_signal_05),
  .input_wready(),
  .input_left(dca_signal_22),
  .input_right(dca_signal_15),

  .output_rvalid(dca_signal_21),
  .output_rready(dca_signal_19),
  .output_result(dca_signal_07),
  .output_upper(),
  .output_lower()
);

assign dca_signal_05 = dca_port_5? dca_signal_02 : dca_port_3;
assign dca_signal_19 = 1;

always@(*)
begin
  dca_signal_22 = $signed(dca_signal_09);
  dca_signal_15 = $signed(dca_signal_01);
  if(dca_port_5)
  begin
    dca_signal_22 = $unsigned(dca_signal_06);
    dca_signal_15 = $unsigned(dca_signal_08);
  end
  else
  begin
    dca_signal_22 = $signed(dca_signal_09);
    dca_signal_15 = $signed(dca_signal_01);
  end
end

assign dca_signal_09 = dca_port_6;
assign dca_signal_01 = dca_port_8;
assign dca_signal_18 = dca_signal_21;
assign dca_signal_04 = dca_signal_07;

`ifdef PACT_SUPPORT_FLOAT32

PACT_FMULTIPLIER_PIPELINE1
i_dca_instance_0
(
  .clk(dca_port_1),
  .rstnn(dca_port_7),
  .enable(dca_port_4),

  .in_valid(dca_port_3),
  .in_input0_float(dca_port_6),
  .in_input1_float(dca_port_8),

  .out_valid_early_case(dca_signal_17),
  .out_valid_normal_case(dca_signal_02),

  .out_early_special_case(dca_signal_20),
  .out_input0_significand(dca_signal_25),
  .out_input1_significand(dca_signal_12),
  .out_added_exponent(dca_signal_16)
);

PACT_FMULTIPLIER_PIPELINE2
i_dca_instance_1
(
  .clk(dca_port_1),
  .rstnn(dca_port_7),  
  .enable(dca_port_4),

  .in_valid_early_case(dca_signal_17),
  .in_valid_normal_case(dca_signal_02),
  .in_early_special_case(dca_signal_20),
  .in_input0_significand(dca_signal_25),
  .in_input1_significand(dca_signal_12),
  .in_added_exponent(dca_signal_16),

  .out_multiplier_input0(dca_signal_06),
  .out_multiplier_input1(dca_signal_08),

  .out_valid_early_case(dca_signal_00),
  .out_valid_normal_case(dca_signal_23),
  .out_early_special_case(dca_signal_13),
  .out_added_exponent(dca_signal_03),
  .out_multiplied_sign(dca_signal_11)
);

PACT_FMULTIPLIER_PIPELINE3
i_dca_instance_3
(
  .clk(dca_port_1),
  .rstnn(dca_port_7),
  .enable(dca_port_4),

  .in_valid_early_case(dca_signal_00),
  .in_valid_normal_case(dca_signal_23),
  .in_early_special_case(dca_signal_13),
  .in_added_exponent(dca_signal_03),
  .in_multiplied_sign(dca_signal_11),

  .in_multiplier_output0(dca_signal_14),

  .out_valid(dca_signal_24),
  .out_result(dca_signal_10)
);

assign dca_signal_14 = dca_signal_07;

`endif 

assign dca_port_2 = (dca_port_5)? dca_signal_24 : dca_signal_18;
assign dca_port_0 = (dca_port_5)? dca_signal_10 : $unsigned(dca_signal_04);

endmodule
