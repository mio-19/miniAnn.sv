`include "defs.svh"
module neuron_learn #(
    parameter N = 16
) (
    input bit valid,
    input bit learn, // 0 - freeze parameters, 1 - learn
    input zero2one_t in [N-1:0],
    output zero2one_t out,

    output frac_t weights [N-1:0],
    output frac_t activation_max,
    output frac_t activation_min,

    input zero2one_t expected_out,
    output zero2one_t expected_in [N-1:0]
);

    neuron_run #(.N(N)) neuron_run_instance(.in(in), .out(out), .weights(weights), .activation_max(activation_max), .activation_min(activation_min));

    always @* begin
    end

endmodule