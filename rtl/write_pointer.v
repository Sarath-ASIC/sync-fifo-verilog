module write_pointer(
    input clk,
    input rst,
    input wr_en,

    output reg [3:0] wptr
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        wptr <= 0;
    else if(wr_en)
        wptr <= wptr + 1;
end

endmodule
