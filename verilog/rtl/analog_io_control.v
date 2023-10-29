// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * analog_io_control
 *
 * This is an simple digital block,
 * only providing signals tied to High 
 * to be connected to OEB of I/O pads used only as analog I/O
 *
 *-------------------------------------------------------------
 */

module analog_io_control #(
    parameter BITS = 6
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // IOs
    output [BITS-1:0] io_out,
    output [BITS-1:0] io_oeb
);
    assign io_out = {(BITS){1'b1}};
    assign io_oeb = {(BITS){1'b1}};

endmodule
`default_nettype wire
