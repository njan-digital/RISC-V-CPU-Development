// 2026-11-5
module DECODER (
    input logic [2:0] select,
    output logic [7:0] outputs

);
    always_comb begin
        outputs = 'b0; // Reset output to zero
        outputs[select] = 1'b1; // Set the selected output to 1
    end
endmodule
