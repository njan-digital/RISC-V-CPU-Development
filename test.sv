// A simple SystemVerilog example: a two-input AND gate.
module and_gate (
	input  logic a,
	input  logic b,
	output logic y
);
	// Combinational logic: y updates whenever a or b changes.
	assign y = a & b;
endmodule

// Small testbench to try the AND gate.
module testbench;
	logic a;
	logic b;
	logic y;

	and_gate dut (
		.a(a),
		.b(b),
		.y(y)
	);

	initial begin
		a = 0; b = 0; #10;
		$display("a=%0b b=%0b y=%0b", a, b, y);

		a = 0; b = 1; #10;
		$display("a=%0b b=%0b y=%0b", a, b, y);

		a = 1; b = 0; #10;
		$display("a=%0b b=%0b y=%0b", a, b, y);

		a = 1; b = 1; #10;
		$display("a=%0b b=%0b y=%0b", a, b, y);

		$finish;
	end
endmodule
