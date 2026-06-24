`timescale 1ns / 1ps
module uart_tx(
    input clk,
    input rst,
    input tx_start,
    input [7:0] data_in,

    output reg tx
);

reg [3:0] count;
reg [9:0] data;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        tx <= 1'b1;
        count <= 0;
    end

    else if(tx_start)
    begin
        data <= {1'b1, data_in, 1'b0}; // Stop, Data, Start
        count <= 0;
    end

    else if(count < 10)
    begin
        tx <= data[count];
        count <= count + 1;
    end
end

endmodule