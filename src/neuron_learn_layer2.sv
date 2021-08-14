// generated, do not edit
`include "defs.svh"
module neuron_learn_layer2 #(
    parameter N = 16
) (
    input bit clock,
    input bit valid,
    input bit learn,
    input unit_t in [N-1:0],
    output unit_t out [2-1:0],

    output frac_t weights [2-1:0][N-1:0],
    output frac_t activation_max [2-1:0],
    output frac_t activation_min [2-1:0],

    input unit_t expected_out [2-1:0],
    output unit_t expected_in [N-1:0]
);

    unit_t unavg_expected_in [2-1:0][N-1:0];
    unit_arr_average #(.N(2), .LEN(N)) avg (.in(unavg_expected_in), .out(expected_in));

    neuron_learn #(.N(N)) instance0 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[0]), .weights(weights[0]), .activation_max(activation_max[0]), .activation_min(activation_min[0]), .expected_out(expected_out[0]), .expected_in(unavg_expected_in[0]));
    neuron_learn #(.N(N)) instance1 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[1]), .weights(weights[1]), .activation_max(activation_max[1]), .activation_min(activation_min[1]), .expected_out(expected_out[1]), .expected_in(unavg_expected_in[1]));

endmodule
