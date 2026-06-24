module fifo_mem
(
    input clk,
    input wr_en,
    input rd_en,

    input [7:0] din,

    input [3:0] wptr,
    input [3:0] rptr,

    output reg [7:0] dout
);

reg [7:0] mem [0:15];

always @(posedge clk)
begin
    if(wr_en)
        mem[wptr] <= din;

    if(rd_en)
        dout <= mem[rptr];
end

endmodule
