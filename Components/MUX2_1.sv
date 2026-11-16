// 2026-11-5
module MUX2_1 (
    input logic a, b, sel,
    output logic y
);

assign y = sel ? b : a;

endmodule

module testbench;
    logic a, b, sel, y;

    MUX2_1 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        a = 0; b = 0; sel = 0; #10;
        $display("a=%0b b=%0b sel=%0b y=%0b", a, b, sel, y);

        a = 0; b = 1; sel = 0; #10;
        $display("a=%0b b=%0b sel=%0b y=%0b", a, b, sel, y);

        a = 1; b = 0; sel = 1; #10;
        $display("a=%0b b=%0b sel=%0b y=%0b", a, b, sel, y);

        a = 1; b = 1; sel = 1; #10;
        $display("a=%0b b=%0b sel=%0b y=%0b", a, b, sel, y);

        $finish;
    end
endmodule
