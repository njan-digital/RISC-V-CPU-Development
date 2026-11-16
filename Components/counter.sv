module counter (
    input logic clk,
    input logic rst,
    output logic [3:0] ones,
    output logic [3:0] tens,
    output logic carry_out
);

always_ff @(posedge clk or posedge rst) begin
    if (ones >= 10)
    begin
        ones <= 4'b0;
        tens <= tens + 1;
        carry_out <= (tens == 4'b1001);
    end
    else begin
        ones <= ones + 1;
    end
end

endmodule

module tb_counter;
    logic clk;
    logic rst_init = 1;
    logic rst;
    logic [3:0] ones;
    logic [3:0] tens;
    logic carry;
    logic carry_out;
    counter dut ( .clk(clk), .rst(rst), .ones(ones), .tens(tens), .carry(carry), .carry_out(carry_out));
    always #5 clk = ~clk;
    assign rst = rst_init | (ones >= 10);
    initial begin
        $dumpfile("tb_counter.vcd");
        $dumpvars(0, tb_counter);
        #12 rst_init = 0; tens = 0; ones = 0;
        repeat(100) begin
            @(posedge clk); #1;
            $display("t=%0t ones=%0d tens=%0d rst=%b carry=%b carry_out=%b", $time, ones, tens, rst, carry, carry_out);
        end
        $finish;
    end
endmodule