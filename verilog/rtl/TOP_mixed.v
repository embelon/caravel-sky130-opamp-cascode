//NOTE:  SPECAL  config.json   NEEDED:      DESIGN_IS_CORE=1  --- which means it will use metal5 for rotuing
`default_nettype none
module TOP_mixed (

`ifdef USE_POWER_PINS
    inout vccd1,  // User area 1 1.8V power
    inout vssd1,  // User area 1 digital ground
`endif

    output io_out__27,
    output io_out__28,
    output io_out__29,
    inout analog_io__1,
    inout analog_io__2,
    inout analog_io__3,
    input io_in__31,
    input io_in__32,
    input io_in__34,
    input io_in__35,
    output io_oeb__10,
    output io_oeb__27,
    output io_oeb__28,
    output io_oeb__29,
    output io_oeb__30,
    output io_oeb__31,
    output io_oeb__32,
    output io_oeb__33,
    output io_oeb__34,
    output io_oeb__35,
    output io_oeb__8,
    output io_oeb__9,
    output io_out__30,
    output io_out__33,
    input wb_clk_i,
    input wb_rst_i,
    output wbs_ack_o,
    input wbs_cyc_i,
    input wbs_stb_i,
    input wbs_we_i,
    input [1:0] la_data_in,
    output [2:0] user_irq,
    input [31:0] wbs_adr_i,
    input [31:0] wbs_dat_i,
    output [31:0] wbs_dat_o,
    input [3:0] wbs_sel_i
);

endmodule

`default_nettype wire
