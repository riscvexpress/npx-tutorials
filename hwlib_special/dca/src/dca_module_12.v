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





module DCA_MODULE_12
(
  dca_port_23,
  dca_port_04,
  dca_port_22,
  dca_port_11,

  dca_port_00,

  dca_port_17,
  dca_port_25,
  dca_port_03,
  dca_port_26,
  dca_port_18,
  dca_port_02,

  dca_port_19,
  dca_port_10,
  dca_port_16,
  dca_port_15,
  dca_port_08,

  dca_port_21,
  dca_port_14,
  dca_port_09,
  dca_port_07,
  dca_port_01,
  dca_port_12,

  dca_port_20,
  dca_port_24,
  dca_port_06,
  dca_port_05,
  dca_port_13
);





parameter DCA_GPARA_2 = 32;
parameter DCA_GPARA_1 = 32;
parameter DCA_GPARA_0 = 4;

`include "lpi_burden_para.vb"

`include "lpit_function.vb"
`include "lpixs_function.vb"

localparam  BW_LPIXS_ADDR = DCA_GPARA_2;
localparam  BW_LPIXS_DATA = DCA_GPARA_1;

`include "lpixs_lpara.vb"

input wire dca_port_23;
input wire dca_port_04;
input wire dca_port_22;
input wire dca_port_11;

input wire dca_port_00;

output wire [2-1:0] dca_port_17;
input wire dca_port_25;
input wire dca_port_03;
input wire dca_port_26;
input wire dca_port_18;
input wire [BW_LPI_QDATA-1:0] dca_port_02;

input wire [2-1:0] dca_port_19;
output reg dca_port_10;
output wire dca_port_16;
output wire dca_port_15;
output wire [BW_LPI_YDATA-1:0] dca_port_08;

input wire [2-1:0] dca_port_21;
output wire dca_port_14;
output wire dca_port_09;
output wire dca_port_07;
output wire dca_port_01;
output wire [BW_LPI_QDATA-1:0] dca_port_12;

output wire [2-1:0] dca_port_20;
input wire dca_port_24;
input wire dca_port_06;
input wire dca_port_05;
input wire [BW_LPI_YDATA-1:0] dca_port_13;

wire [BW_LPI_BURDEN_NZ-1:0] dca_signal_31;
wire [BW_LPI_QPARCEL-1:0] dca_signal_07;

wire dca_signal_26;
wire dca_signal_10;
wire [`BW_AXI_ALEN-1:0] dca_signal_35;
wire [`BW_AXI_ASIZE-1:0] dca_signal_42;
wire [`BW_AXI_ABURST-1:0] dca_signal_11;
wire [`NUM_BYTE(DCA_GPARA_1)-1:0] dca_signal_17;
wire [DCA_GPARA_1-1:0] dca_signal_29;
wire [DCA_GPARA_2-1:0] dca_signal_57;

wire dca_signal_51;
wire [`BW_AXI_ALEN-1:0] dca_signal_53;
wire [`BW_AXI_ASIZE-1:0] dca_signal_01;
wire [`BW_AXI_ABURST-1:0] dca_signal_54;
wire [DCA_GPARA_2-1:0] dca_signal_61;
wire dca_signal_40;
wire dca_signal_19;
wire [DCA_GPARA_2-1:0] dca_signal_37;
wire dca_signal_60;
wire dca_signal_56;
wire [`BW_AXI_ALEN-1:0] dca_signal_46;
reg dca_signal_08;

localparam  DCA_LPARA_5 = 3;
localparam  DCA_LPARA_0 = 0;
localparam  DCA_LPARA_4 = 1;
localparam  DCA_LPARA_1 = 2;
localparam  DCA_LPARA_6 = 3;

reg [DCA_LPARA_5-1:0] dca_signal_15;
wire dca_signal_06;
wire dca_signal_30;

wire [BW_LPI_BURDEN_NZ-1:0] dca_signal_58;
wire [BW_LPI_QPARCEL-1:0] dca_signal_13;

wire dca_signal_59;
wire dca_signal_05;
wire dca_signal_09;
wire dca_signal_27;
wire [DCA_GPARA_2-1:0] dca_signal_28;
wire dca_signal_24;
wire dca_signal_55;
wire [DCA_GPARA_0-1:0] dca_signal_63;
wire dca_signal_00;
wire [DCA_GPARA_0-1:0] dca_signal_38;
wire dca_signal_22;
wire [DCA_GPARA_1-1:0] dca_signal_21;
wire dca_signal_36;
wire [DCA_GPARA_1-1:0] dca_signal_02;
wire dca_signal_04;

localparam  DCA_LPARA_2 = BW_LPI_BURDEN_NZ + DCA_GPARA_0 + 1 + 1 + 1; 
localparam  DCA_LPARA_3 = 4;

wire dca_signal_43;
wire dca_signal_23;
wire [DCA_LPARA_2-1:0] dca_signal_18;
wire dca_signal_39;
wire dca_signal_52;
wire [DCA_LPARA_2-1:0] dca_signal_25;

reg [BW_LPI_BURDEN_NZ-1:0] dca_signal_48;
wire dca_signal_44;
wire dca_signal_50;

wire [BW_LPI_BURDEN_NZ-1:0] dca_signal_12;
wire [DCA_GPARA_0-1:0] dca_signal_45;
wire dca_signal_47;
wire dca_signal_32;
wire dca_signal_34;

wire [BW_LPI_BURDEN_NZ-1:0] dca_signal_33;
wire [BW_LPI_YPARCEL-1:0] dca_signal_16;

wire dca_signal_03;
wire dca_signal_14;
wire [`BW_AXI_RESP-1:0] dca_signal_41;
wire [DCA_GPARA_1-1:0] dca_signal_49;

wire [`BW_AXI_RESP-1:0] dca_signal_62;
wire [DCA_GPARA_1-1:0] dca_signal_20;

assign {dca_signal_31,dca_signal_07} = dca_port_02;
assign {dca_signal_26,dca_signal_10,dca_signal_35,dca_signal_42,dca_signal_11,dca_signal_17,dca_signal_29,dca_signal_57} = dca_signal_07;

ERVP_BURST_ADDR_GENERATOR
#(
  .BW_ADDR(DCA_GPARA_2),
  .BW_ALEN(`BW_AXI_ALEN)
)
i_dca_instance_0
(
  .clk(dca_port_23),
  .rstnn(dca_port_04),
  .clear(dca_port_22),
  .enable(dca_port_11),

  .burst_wrequest(dca_signal_51),
  .burst_alen(dca_signal_53),
  .burst_asize(dca_signal_01),
  .burst_aburst(dca_signal_54),
  .burst_first_addr(dca_signal_61),
  .burst_wready(dca_signal_40),

  .single_rready(dca_signal_19),
  .single_addr(dca_signal_37),
  .single_is_first(dca_signal_60),
  .single_is_last(dca_signal_56),
  .single_remain_alen(dca_signal_46),
  .single_rrequest(dca_signal_08)
);

assign dca_signal_51 = dca_port_25 & (dca_signal_15==DCA_LPARA_0);
assign dca_signal_53 = dca_signal_35;
assign dca_signal_01 = dca_signal_42;
assign dca_signal_54 = dca_signal_11;
assign dca_signal_61 = dca_signal_57;
always@(*)
begin
  dca_signal_08 = 0;
  if(dca_signal_43 & dca_signal_24)
  begin
    if((dca_signal_15==DCA_LPARA_4) & dca_signal_55)
      dca_signal_08 = 1;
    if(dca_signal_15==DCA_LPARA_6)
      dca_signal_08 = 1;
  end
end

always@(posedge dca_port_23, negedge dca_port_04)
begin
  if (dca_port_04 == 0)
    dca_signal_15 <= DCA_LPARA_0;
  else
  begin
    case(dca_signal_15)
      DCA_LPARA_0:
      begin
        if(dca_signal_51 & dca_signal_40)
          dca_signal_15 <= DCA_LPARA_4;
        
      end
      DCA_LPARA_4:
      begin
        if(dca_signal_06)
          dca_signal_15 <= DCA_LPARA_0;
        else if(dca_signal_19 & (~dca_signal_55))
          dca_signal_15 <= DCA_LPARA_1;
      end
      DCA_LPARA_1:
      begin
        if(dca_signal_30)
          dca_signal_15 <= DCA_LPARA_6;
      end
      DCA_LPARA_6:
      begin
        if(dca_signal_06)
          dca_signal_15 <= DCA_LPARA_0;
      end
    endcase
  end
end

assign dca_signal_06 = dca_signal_19 & dca_signal_08 & dca_signal_56;

assign dca_signal_30 = dca_port_14 & dca_port_21[0];

assign dca_port_17[1] = 0;
assign dca_port_17[0] = ((dca_signal_15==DCA_LPARA_1) & dca_port_21[0]) | ((dca_signal_15==DCA_LPARA_4) & dca_signal_06);

assign dca_port_14 = (dca_signal_15==DCA_LPARA_1);
assign dca_port_09 = dca_port_03;
assign dca_port_07 = dca_port_26;
assign dca_port_01 = dca_port_18;
assign dca_port_12 = {dca_signal_58, dca_signal_13};
assign dca_signal_58 = dca_signal_31;
assign dca_signal_13 = {dca_signal_26,dca_signal_10,dca_signal_46,dca_signal_42,dca_signal_11,dca_signal_17,dca_signal_29,dca_signal_37};

DCA_MODULE_16
#(
  .DCA_GPARA_0(DCA_GPARA_2),
  .DCA_GPARA_2(DCA_GPARA_1),
  .DCA_GPARA_1(DCA_GPARA_0)
)
i_dca_instance_1
(
  .dca_port_12(dca_port_23),
  .dca_port_09(dca_port_04),
  .dca_port_10(dca_port_22),
  .dca_port_13(dca_port_11),

  .dca_port_18(dca_signal_59),

  .dca_port_07(dca_signal_05),
  .dca_port_15(dca_signal_09),
  .dca_port_06(dca_signal_27),
  .dca_port_00(dca_signal_28),
  .dca_port_05(dca_signal_24),
  .dca_port_14(dca_signal_55),
  .dca_port_03(dca_signal_63),

  .dca_port_17(dca_signal_00),
  .dca_port_16(dca_signal_38),
  .dca_port_01(dca_signal_22),
  .dca_port_11(dca_signal_21),

  .dca_port_08(dca_signal_36),
  .dca_port_04(dca_signal_02),
  .dca_port_02(dca_signal_04)
);

assign dca_signal_59 = dca_port_00;
assign dca_signal_05 = dca_signal_19 & dca_signal_08;
assign dca_signal_09 = (dca_signal_15==DCA_LPARA_6);
assign dca_signal_27 = (dca_signal_15==DCA_LPARA_4);
assign dca_signal_28 = dca_signal_37;

assign dca_signal_00 = dca_signal_39 & dca_signal_47 & dca_port_19[0];
assign dca_signal_38 = dca_signal_45;

assign dca_signal_36 = dca_port_24 & dca_port_20[0] & dca_signal_32;
assign dca_signal_02 = dca_port_13;

always@(posedge dca_port_23, negedge dca_port_04)
begin
  if (dca_port_04 == 0)
    dca_signal_48 <= 0;
  else if(dca_signal_51 & dca_signal_40)
    dca_signal_48 <= dca_signal_31;
end

ERVP_SMALL_FIFO
#(
  .BW_DATA(DCA_LPARA_2),
  .DEPTH(DCA_LPARA_3)
)
i_dca_instance_2
(
  .clk(dca_port_23),
  .rstnn(dca_port_04),
  .enable(dca_port_11),
  .clear(dca_port_22),
  .wready(dca_signal_43),
  .wrequest(dca_signal_23),
  .wdata(dca_signal_18),
  .wfull(),
  .rready(dca_signal_39),
  .rrequest(dca_signal_52),
  .rdata(dca_signal_25),
  .rempty()
);

assign dca_signal_23 = dca_signal_19 & dca_signal_08;
assign dca_signal_18 = {dca_signal_48, dca_signal_63, dca_signal_44, dca_signal_50, dca_signal_56};

assign dca_signal_44 = dca_signal_27 & dca_signal_55;
assign dca_signal_50 = dca_signal_09 & (~dca_signal_55);

assign dca_signal_52 = dca_port_10 & dca_port_19[0]; 

assign {dca_signal_12, dca_signal_45, dca_signal_47, dca_signal_32, dca_signal_34} = dca_signal_25;

always@(*)
begin
  dca_port_10 = 0;
  if(dca_signal_39)
  begin
    if(dca_signal_47)
      dca_port_10 = dca_signal_22;
    else
      dca_port_10 = dca_port_24 & dca_port_20[0];
  end
end

assign dca_port_16 = dca_signal_39 & (dca_signal_47? 0 : dca_port_06);
assign dca_port_15 = dca_signal_34;
assign dca_port_08 = {dca_signal_33, dca_signal_16};

assign dca_signal_33 = dca_signal_12;
assign dca_signal_16 = {dca_signal_03,dca_signal_14,dca_signal_41,dca_signal_49};

assign dca_signal_03 = dca_signal_34;
assign dca_signal_14 = 0;
assign {dca_signal_41,dca_signal_49} = dca_signal_47? {dca_signal_62, dca_signal_20} : dca_port_13;

assign dca_signal_62 = `AXI_RESPONSE_OKAY;
assign dca_signal_20 = dca_signal_21;

assign dca_port_20[1] = 0;
assign dca_port_20[0] = dca_signal_39 & (~dca_signal_47) & dca_port_19[0] & (dca_signal_32? dca_signal_04 : 1);

endmodule
