`include "defs.svh"
module neuron_run #(
    parameter N = 16
) (
    input zero2one_t in [N-1:0],
    output zero2one_t out,

    input frac_t weights [N-1:0],
    input frac_t activation_max,
    input frac_t activation_min
);
endmodule