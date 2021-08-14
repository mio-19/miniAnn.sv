// generated, do not edit
`include "defs.svh"
module neuron_learn_layer1 #(
    parameter N = 16
) (
    input bit clock,
    input bit valid,
    input bit learn,
    input unit_t in [N-1:0],
    output unit_t out [1-1:0],

    output unit_signed_t weights [1-1:0][N-1:0],
    output unit_signed_t activation_upper_bound [1-1:0],
    output unit_signed_t activation_lower_bound [1-1:0],

    input unit_t expected_out [1-1:0],
    output unit_t expected_in [N-1:0]
);

    unit_t unavg_expected_in [1-1:0][N-1:0];
    unit_arr_average #(.N(1), .LEN(N)) avg (.in(unavg_expected_in), .out(expected_in));

    neuron_learn #(.N(N)) instance0 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[0]), .weights(weights[0]), .activation_upper_bound(activation_upper_bound[0]), .activation_lower_bound(activation_lower_bound[0]), .expected_out(expected_out[0]), .expected_in(unavg_expected_in[0]));

endmodule
