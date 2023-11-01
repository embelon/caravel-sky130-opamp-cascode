module user_project_wrapper (user_clock2,
    vccd1,
    vccd2,
    vdda1,
    vdda2,
    vssa1,
    vssa2,
    vssd1,
    vssd2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    analog_io,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input vccd1;
 input vccd2;
 input vdda1;
 input vdda2;
 input vssa1;
 input vssa2;
 input vssd1;
 input vssd2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 inout [28:0] analog_io;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [127:0] la_data_in;
 output [127:0] la_data_out;
 input [127:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire \anton_io_oeb[4] ;
 wire \anton_io_out[0] ;
 wire \anton_io_out[1] ;
 wire \anton_io_out[2] ;
 wire \anton_io_out[3] ;
 wire \anton_io_out[4] ;
 wire \a0s[10] ;
 wire \a0s[11] ;
 wire \a0s[12] ;
 wire \a0s[13] ;
 wire \a0s[14] ;
 wire \a0s[15] ;
 wire \a0s[8] ;
 wire \a0s[9] ;
 wire \a1s[0] ;
 wire \a1s[10] ;
 wire \a1s[11] ;
 wire \a1s[12] ;
 wire \a1s[13] ;
 wire \a1s[14] ;
 wire \a1s[15] ;
 wire \a1s[1] ;
 wire \a1s[2] ;
 wire \a1s[3] ;
 wire \a1s[4] ;
 wire \a1s[5] ;
 wire \a1s[6] ;
 wire \a1s[7] ;
 wire \a1s[8] ;
 wire \a1s[9] ;
 wire \anton_gpout[4] ;
 wire \anton_gpout[5] ;
 wire anton_o_reset;

 analog_io_control aio_ctrl (.vccd1(vccd1),
    .vssd1(vssd1),
    .io_oeb({io_oeb[17],
    io_oeb[16],
    io_oeb[15],
    io_oeb[14],
    io_oeb[13],
    io_oeb[12]}));
 opamp_cascode opamp (.IN_P(analog_io[8]),
    .IN_M(analog_io[9]),
    .VCC(vccd1),
    .VSS(vssd1),
    .OUT(analog_io[10]),
    .VB_A(analog_io[5]),
    .VB_B(analog_io[6]),
    .IB(analog_io[7]));
 top_ew_algofoogle top_ew_algofoogle (.i_clk(user_clock2),
    .i_debug_map_overlay(la_data_in[98]),
    .i_debug_trace_overlay(la_data_in[91]),
    .i_debug_vec_overlay(la_data_in[75]),
    .i_la_invalid(la_oenb[64]),
    .i_reg_csb(la_data_in[76]),
    .i_reg_mosi(la_data_in[78]),
    .i_reg_sclk(la_data_in[77]),
    .i_reset_lock_a(la_data_in[64]),
    .i_reset_lock_b(la_data_in[65]),
    .i_vec_csb(la_data_in[66]),
    .i_vec_mosi(la_data_in[68]),
    .i_vec_sclk(la_data_in[67]),
    .o_hsync(\anton_io_out[0] ),
    .o_reset(anton_o_reset),
    .o_tex_csb(\anton_io_out[2] ),
    .o_tex_oeb0(\anton_io_oeb[4] ),
    .o_tex_out0(\anton_io_out[4] ),
    .o_tex_sclk(\anton_io_out[3] ),
    .o_vsync(\anton_io_out[1] ),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .i_gpout0_sel({la_data_in[74],
    la_data_in[73],
    la_data_in[72],
    la_data_in[71],
    la_data_in[70],
    la_data_in[69]}),
    .i_gpout1_sel({la_data_in[84],
    la_data_in[83],
    la_data_in[82],
    la_data_in[81],
    la_data_in[80],
    la_data_in[79]}),
    .i_gpout2_sel({la_data_in[90],
    la_data_in[89],
    la_data_in[88],
    la_data_in[87],
    la_data_in[86],
    la_data_in[85]}),
    .i_gpout3_sel({la_data_in[97],
    la_data_in[96],
    la_data_in[95],
    la_data_in[94],
    la_data_in[93],
    la_data_in[92]}),
    .i_gpout4_sel({la_data_in[104],
    la_data_in[103],
    la_data_in[102],
    la_data_in[101],
    la_data_in[100],
    la_data_in[99]}),
    .i_gpout5_sel({la_data_in[110],
    la_data_in[109],
    la_data_in[108],
    la_data_in[107],
    la_data_in[106],
    la_data_in[105]}),
    .i_mode({la_data_in[113],
    la_data_in[112],
    la_data_in[111]}),
    .i_tex_in({io_in[34],
    io_in[32],
    io_in[31],
    io_in[22]}),
    .o_gpout({\anton_gpout[5] ,
    \anton_gpout[4] ,
    io_out[26],
    io_out[25],
    io_out[24],
    io_out[23]}),
    .o_rgb({_NC1,
    _NC2,
    _NC3,
    _NC4,
    _NC5,
    _NC6,
    _NC7,
    _NC8,
    _NC9,
    _NC10,
    _NC11,
    _NC12,
    _NC13,
    _NC14,
    _NC15,
    _NC16,
    _NC17,
    _NC18,
    _NC19,
    _NC20,
    _NC21,
    _NC22,
    _NC23,
    _NC24}),
    .ones({\a1s[15] ,
    \a1s[14] ,
    \a1s[13] ,
    \a1s[12] ,
    \a1s[11] ,
    \a1s[10] ,
    \a1s[9] ,
    \a1s[8] ,
    \a1s[7] ,
    \a1s[6] ,
    \a1s[5] ,
    \a1s[4] ,
    \a1s[3] ,
    \a1s[2] ,
    \a1s[1] ,
    \a1s[0] }),
    .zeros({\a0s[15] ,
    \a0s[14] ,
    \a0s[13] ,
    \a0s[12] ,
    \a0s[11] ,
    \a0s[10] ,
    \a0s[9] ,
    \a0s[8] ,
    io_oeb[21],
    io_oeb[20],
    io_oeb[19],
    io_oeb[18],
    io_oeb[26],
    io_oeb[25],
    io_oeb[24],
    io_oeb[23]}));
 TOP_mixed top_mixed (.io_in__31(io_in[31]),
    .io_in__32(io_in[32]),
    .io_in__34(io_in[34]),
    .io_in__35(io_in[35]),
    .io_oeb__10(io_oeb[10]),
    .io_oeb__27(io_oeb[27]),
    .io_oeb__28(io_oeb[28]),
    .io_oeb__29(io_oeb[29]),
    .io_oeb__30(io_oeb[30]),
    .io_oeb__31(io_oeb[31]),
    .io_oeb__32(io_oeb[32]),
    .io_oeb__33(io_oeb[33]),
    .io_oeb__34(io_oeb[34]),
    .io_oeb__35(io_oeb[35]),
    .io_oeb__8(io_oeb[8]),
    .io_oeb__9(io_oeb[9]),
    .io_out__30(io_out[30]),
    .io_out__33(io_out[33]),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .io_out__29(io_out[29]),
    .analog_io__2(analog_io[2]),
    .analog_io__3(analog_io[3]),
    .io_out__28(io_out[28]),
    .io_out__27(io_out[27]),
    .analog_io__1(analog_io[1]),
    .la_data_in({la_data_in[1],
    la_data_in[0]}),
    .user_irq({user_irq[2],
    user_irq[1],
    user_irq[0]}),
    .wbs_adr_i({wbs_adr_i[31],
    wbs_adr_i[30],
    wbs_adr_i[29],
    wbs_adr_i[28],
    wbs_adr_i[27],
    wbs_adr_i[26],
    wbs_adr_i[25],
    wbs_adr_i[24],
    wbs_adr_i[23],
    wbs_adr_i[22],
    wbs_adr_i[21],
    wbs_adr_i[20],
    wbs_adr_i[19],
    wbs_adr_i[18],
    wbs_adr_i[17],
    wbs_adr_i[16],
    wbs_adr_i[15],
    wbs_adr_i[14],
    wbs_adr_i[13],
    wbs_adr_i[12],
    wbs_adr_i[11],
    wbs_adr_i[10],
    wbs_adr_i[9],
    wbs_adr_i[8],
    wbs_adr_i[7],
    wbs_adr_i[6],
    wbs_adr_i[5],
    wbs_adr_i[4],
    wbs_adr_i[3],
    wbs_adr_i[2],
    wbs_adr_i[1],
    wbs_adr_i[0]}),
    .wbs_dat_i({wbs_dat_i[31],
    wbs_dat_i[30],
    wbs_dat_i[29],
    wbs_dat_i[28],
    wbs_dat_i[27],
    wbs_dat_i[26],
    wbs_dat_i[25],
    wbs_dat_i[24],
    wbs_dat_i[23],
    wbs_dat_i[22],
    wbs_dat_i[21],
    wbs_dat_i[20],
    wbs_dat_i[19],
    wbs_dat_i[18],
    wbs_dat_i[17],
    wbs_dat_i[16],
    wbs_dat_i[15],
    wbs_dat_i[14],
    wbs_dat_i[13],
    wbs_dat_i[12],
    wbs_dat_i[11],
    wbs_dat_i[10],
    wbs_dat_i[9],
    wbs_dat_i[8],
    wbs_dat_i[7],
    wbs_dat_i[6],
    wbs_dat_i[5],
    wbs_dat_i[4],
    wbs_dat_i[3],
    wbs_dat_i[2],
    wbs_dat_i[1],
    wbs_dat_i[0]}),
    .wbs_dat_o({wbs_dat_o[31],
    wbs_dat_o[30],
    wbs_dat_o[29],
    wbs_dat_o[28],
    wbs_dat_o[27],
    wbs_dat_o[26],
    wbs_dat_o[25],
    wbs_dat_o[24],
    wbs_dat_o[23],
    wbs_dat_o[22],
    wbs_dat_o[21],
    wbs_dat_o[20],
    wbs_dat_o[19],
    wbs_dat_o[18],
    wbs_dat_o[17],
    wbs_dat_o[16],
    wbs_dat_o[15],
    wbs_dat_o[14],
    wbs_dat_o[13],
    wbs_dat_o[12],
    wbs_dat_o[11],
    wbs_dat_o[10],
    wbs_dat_o[9],
    wbs_dat_o[8],
    wbs_dat_o[7],
    wbs_dat_o[6],
    wbs_dat_o[5],
    wbs_dat_o[4],
    wbs_dat_o[3],
    wbs_dat_o[2],
    wbs_dat_o[1],
    wbs_dat_o[0]}));
 assign io_oeb[22] = \anton_io_oeb[4] ;
 assign io_out[18] = \anton_io_out[0] ;
 assign io_out[19] = \anton_io_out[1] ;
 assign io_out[20] = \anton_io_out[2] ;
 assign io_out[21] = \anton_io_out[3] ;
 assign io_out[22] = \anton_io_out[4] ;
endmodule
