`default_nettype none
`timescale 1ns / 1ps

// This is the top wrapper for the algofoogle (Anton Maurovic) raybox-zero design
// that is intended to be included as a GDS macro in the EllenWood chipIgnite
// Caravel submission.
//
// It defines the expected digital ports that will ultimately be needed.
// Some will be wired up to external IOs (or muxed), some to LA, some to a DAC circuit,
// and others like CLK and RESET might be common or otherwise internal.


module top_ew_algofoogle(
`ifdef USE_POWER_PINS
    inout vccd1,
    inout vssd1,
`endif

    input   wire            i_clk,            // Internal clock source signal.
    input   wire            i_la_invalid,     // Check a la_oenb bit; if 1, LAs are misconfigured (i.e. they're not being driven by the SoC).
    input   wire            i_reset_lock_a,   // Pair must have opposing values to release reset.
    input   wire            i_reset_lock_b,   // Pair must have opposing values to release reset.
    output  wire            o_reset,          // Actual reset state, internally, for debugging.

    // Provides constant sources of '0' and '1' values that can be used for wiring up different
    // combinations of constants as required inside a user_project_wrapper (where only wires are
    // allowed, and no cells OR instantiation of contants).
    // I'm not certain, but I think providing multiple (i.e. vectors) like this is a good idea
    // so we can conveniently do index ranges, but *also* so we don't get fanout problems from
    // single constant driver cells...?
    output  wire    [15:0]  zeros,
    output  wire    [15:0]  ones,

    // RAW VGA outputs:
    output  wire            o_hsync,          // 
    output  wire            o_vsync,          // 
    output  wire    [23:0]  o_rgb,            // INTERNAL: rgb is BGR888, which go to DACs.
    // Only upper 2 bits of each channel used normally, but full range (if supported) can do depth shading.

    // SPI controller for external texture memory:
    output  wire            o_tex_csb,        // /CS
    output  wire            o_tex_sclk,       // SCLK
    // SPI Quad IOs, including ports for different directions.
    //NOTE: We actually only switch io[0] (MOSI in single SPI mode) between OUTPUT and INPUT
    // when doing QSPI. The rest remain as inputs.
    output  wire            o_tex_oeb0,       // IO pad dir select. 0=output 1=input.
    output  wire            o_tex_out0,       // IO pad output path. Maps to SPI io[0] (typically MOSI).
    input   wire    [3:0]   i_tex_in,         // This includes i_tex_in[0] which is the above bi-dir IO pad's input path. Maps to SPI io[2:0]. io[3] as yet unused.

    // SPI peripheral 1: View vectors, to be controlled by LA:
    input   wire            i_vec_csb,        // 
    input   wire            i_vec_sclk,       // 
    input   wire            i_vec_mosi,       // 

    // SPI peripheral 2: General registers, to be controlled by LA:
    input   wire            i_reg_csb,        // 
    input   wire            i_reg_sclk,       // 
    input   wire            i_reg_mosi,       // 

    input   wire            i_debug_vec_overlay,
    input   wire            i_debug_map_overlay,
    input   wire            i_debug_trace_overlay,

    // Up to 6 'gpout's, actual source selectable from many, by 'i_gpout*_sel's...
    output  wire    [5:0]   o_gpout,
    input   wire    [5:0]   i_gpout0_sel,
    input   wire    [5:0]   i_gpout1_sel,
    input   wire    [5:0]   i_gpout2_sel,
    input   wire    [5:0]   i_gpout3_sel,
    input   wire    [5:0]   i_gpout4_sel,
    input   wire    [5:0]   i_gpout5_sel,

    input   wire            i_reg_outs_enb,     // Should our main display outputs be registered (0) or direct (1)?
    input   wire            i_spare_0,          // Reserved.
    input   wire            i_spare_1,          // Reserved.

    // "Mode": Other stuff to control the design generally, e.g. demo mode.
    input   wire    [2:0]   i_mode
);

endmodule
