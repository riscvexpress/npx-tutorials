// dca_matrix_info.vh
// dca_module_memorymap_offset.vh

localparam BW_LSU_PAD_INFO = 64;
localparam BW_LSU_INST = BW_LSU_PAD_INFO + `BW_DCA_MATRIX_LSU_INST_OPCODE + `BW_DCA_MATRIX_INFO_ALIGNED;

localparam LSU_INST_OPCODE_READ = 0;
localparam LSU_INST_OPCODE_WRITE = `DCA_MATRIX_LSU_INST_OPCODE_WRITE;
