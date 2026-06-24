`timescale 1ns/1ps

module uart_rx_tb;

reg clk;
reg rst;
reg rx;

wire [7:0] data_out;

uart_rx uut(

    .clk(clk),
    .rst(rst),
    .rx(rx),
    .data_out(data_out)

);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;
    rx = 1;

    #10 rst = 0;

    // Send 10101010

    rx = 0; #10;
    rx = 1; #10;
    rx = 0; #10;
    rx = 1; #10;
    rx = 0; #10;
    rx = 1; #10;
    rx = 0; #10;
    rx = 1; #10;

    #20;

    $finish;

end

endmodule
