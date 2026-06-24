module uart_rx(

    input clk,
    input rst,
    input rx,

    output reg [7:0] data_out

);

reg [2:0] count;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        count <= 0;
        data_out <= 0;
    end

    else
    begin

        data_out[count] <= rx;

        count <= count + 1;

    end

end

endmodule
