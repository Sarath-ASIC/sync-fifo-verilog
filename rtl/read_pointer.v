module read_pointer(
    input clk,
    input rst,
    input rd_en,

    output reg [3:0] rptr
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        rptr <= 0;
    else if(rd_en)
        rptr <= rptr + 1;
end

endmodule
