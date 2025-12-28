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

endmodule