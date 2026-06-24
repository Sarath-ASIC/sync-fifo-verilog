module fifo_top(
    input clk,
    input rst,

    input wr_en,
    input rd_en,

    input [7:0] din,

    output [7:0] dout,
    output full,
    output empty
);

wire [3:0] wptr;
wire [3:0] rptr;

fifo_mem MEM(
    .clk(clk),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .din(din),
    .wptr(wptr),
    .rptr(rptr),
    .dout(dout)
);

write_pointer WP(
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .wptr(wptr)
);

read_pointer RP(
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .rptr(rptr)
);

fifo_status ST(
    .wptr(wptr),
    .rptr(rptr),
    .full(full),
    .empty(empty)
);

endmodule
