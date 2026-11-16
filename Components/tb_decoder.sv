module tb_decoder;
    logic [2:0] select;
    logic [7:0] outputs;

    DECODER dut (.select(select), .outputs(outputs));

    initial begin
        $dumpfile("tb_decoder.vcd");
        $dumpvars(0, tb_decoder);
        for (int i = 0; i < 8; i++) begin
            select = i[2:0];
            #1;
            $display("select=%0d outputs=%b", select, outputs);
            assert (outputs == (8'b1 << i)) else $error("mismatch at select=%0d", i);
        end
        $finish;
    end
endmodule
