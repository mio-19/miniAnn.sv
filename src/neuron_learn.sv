`include "defs.svh"
module neuron_learn #(
    parameter N = 16
) (
    input neuron_learn_state_t state,
    input zero2one_t in [N-1:0],
    output zero2one_t out,

    output frac_t weights [N-1:0],
    output frac_t activation_max,
    output frac_t activation_min,

    input zero2one_t expected_out,
    output zero2one_t expected_in [N-1:0]
);
endmodule