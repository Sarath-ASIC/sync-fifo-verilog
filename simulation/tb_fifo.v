`timescale 1ns/1ps

module tb_fifo;

    reg clk;
    reg rst;

    reg wr_en;
    reg rd_en;

    reg [7:0] din;

    wire [7:0] dout;
    wire full;
    wire empty;

    // DUT
    fifo_top DUT (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Waveform dump
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_fifo);

        // Initialization
        clk   = 0;
        rst   = 1;
        wr_en = 0;
        rd_en = 0;
        din   = 8'h00;

        // Reset
        #20;
        rst = 0;

        //--------------------------------
        // Write 5 data values
        //--------------------------------

        #10;
        wr_en = 1;

        din = 8'h11; #10;
        din = 8'h22; #10;
        din = 8'h33; #10;
        din = 8'h44; #10;
        din = 8'h55; #10;

        wr_en = 0;

        //--------------------------------
        // Read 5 data values
        //--------------------------------

        #20;

        rd_en = 1;

        #50;

        rd_en = 0;

        //--------------------------------
        // Simultaneous Read/Write
        //--------------------------------

        #20;

        wr_en = 1;
        rd_en = 1;

        din = 8'hAA; #10;
        din = 8'hBB; #10;
        din = 8'hCC; #10;

        wr_en = 0;
        rd_en = 0;

        //--------------------------------
        // Finish
        //--------------------------------

        #50;

        $finish;

    end

    // Monitor

    initial begin
        $monitor(
            "Time=%0t | wr_en=%b rd_en=%b din=%h dout=%h full=%b empty=%b",
            $time, wr_en, rd_en, din, dout, full, empty
        );
    end

endmodule
