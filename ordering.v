`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2025 03:30:33 PM
// Design Name: 
// Module Name: qs_fifo 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "qs_fifo.v" 

module ordering (
  input   wire        clk,
  input   wire        reset,

  // RX side interface
  input   wire        rx_valid_i,
  input   wire [2:0]  rx_id_i,
  input   wire [15:0] rx_payload_i,
  input   wire        rx_order_i,
  output  wire        rx_ready_o,

  // RX retire interface
  input   wire        rx_ret_i,
  input   wire [2:0]  rx_ret_id_i,

  // TX side interface
  output  wire        tx_valid_o,
  output  wire [2:0]  tx_id_o,
  output  wire [15:0] tx_payload_o,
  input   wire        tx_ready_i

);
  // Write your logic here
  parameter CAT_W = 19;
  
  wire [CAT_W-1:0] ord_dout;
  wire [CAT_W-1:0] unord_dout;
  
  qs_fifo #(
    .DATA_W(CAT_W),
    .DEPTH (8)
  ) ORD_FIFO (
    .clk        (clk                                ),
    .reset      (reset                              ),
    .push_i     (rx_valid_i & rx_order_i            ),
    .push_data_i({rx_order_i, rx_id_i, rx_payload_i}),
    .pop_i      (
    .pop_data_o (ord_dout
    .empty_o    (
    .full_o     (
  );
  
  qs_fifo #(
    .DATA_W(CAT_W),
    .DEPTH (8)
  ) UNORD_FIFO (
    .clk        (clk                                ),
    .reset      (reset                              ),
    .push_i     (rx_valid_i & ~rx_order_i           ),
    .push_data_i({rx_order_i, rx_id_i, rx_payload_i}),
    .pop_i      (rx_ret_i
    .pop_data_o (unord_dout
    .empty_o    (
    .full_o     (
  );

endmodule