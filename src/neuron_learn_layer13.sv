// generated, do not edit
`include "defs.svh"
module neuron_learn_layer13 #(
    parameter N = 16
) (
    input bit clock,
    input bit valid,
    input bit learn,
    input zero2one_t in [N-1:0],
    output zero2one_t out [13-1:0],

    output frac_t weights [13-1:0][N-1:0],
    output frac_t activation_max [13-1:0],
    output frac_t activation_min [13-1:0],

    input zero2one_t expected_out [13-1:0],
    output zero2one_t expected_in [N-1:0]
);

    zero2one_t unavg_expected_in [13-1:0][N-1:0];
    zero2one_arr_average #(.N(13), .LEN(N)) avg (.in(unavg_expected_in), .out(expected_in));

    neuron_learn #(.N(N)) instance0 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[0]), .weights(weights[0]), .activation_max(activation_max[0]), .activation_min(activation_min[0]), .expected_out(expected_out[0]), .expected_in(unavg_expected_in[0]));
    neuron_learn #(.N(N)) instance1 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[1]), .weights(weights[1]), .activation_max(activation_max[1]), .activation_min(activation_min[1]), .expected_out(expected_out[1]), .expected_in(unavg_expected_in[1]));
    neuron_learn #(.N(N)) instance2 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[2]), .weights(weights[2]), .activation_max(activation_max[2]), .activation_min(activation_min[2]), .expected_out(expected_out[2]), .expected_in(unavg_expected_in[2]));
    neuron_learn #(.N(N)) instance3 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[3]), .weights(weights[3]), .activation_max(activation_max[3]), .activation_min(activation_min[3]), .expected_out(expected_out[3]), .expected_in(unavg_expected_in[3]));
    neuron_learn #(.N(N)) instance4 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[4]), .weights(weights[4]), .activation_max(activation_max[4]), .activation_min(activation_min[4]), .expected_out(expected_out[4]), .expected_in(unavg_expected_in[4]));
    neuron_learn #(.N(N)) instance5 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[5]), .weights(weights[5]), .activation_max(activation_max[5]), .activation_min(activation_min[5]), .expected_out(expected_out[5]), .expected_in(unavg_expected_in[5]));
    neuron_learn #(.N(N)) instance6 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[6]), .weights(weights[6]), .activation_max(activation_max[6]), .activation_min(activation_min[6]), .expected_out(expected_out[6]), .expected_in(unavg_expected_in[6]));
    neuron_learn #(.N(N)) instance7 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[7]), .weights(weights[7]), .activation_max(activation_max[7]), .activation_min(activation_min[7]), .expected_out(expected_out[7]), .expected_in(unavg_expected_in[7]));
    neuron_learn #(.N(N)) instance8 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[8]), .weights(weights[8]), .activation_max(activation_max[8]), .activation_min(activation_min[8]), .expected_out(expected_out[8]), .expected_in(unavg_expected_in[8]));
    neuron_learn #(.N(N)) instance9 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[9]), .weights(weights[9]), .activation_max(activation_max[9]), .activation_min(activation_min[9]), .expected_out(expected_out[9]), .expected_in(unavg_expected_in[9]));
    neuron_learn #(.N(N)) instance10 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[10]), .weights(weights[10]), .activation_max(activation_max[10]), .activation_min(activation_min[10]), .expected_out(expected_out[10]), .expected_in(unavg_expected_in[10]));
    neuron_learn #(.N(N)) instance11 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[11]), .weights(weights[11]), .activation_max(activation_max[11]), .activation_min(activation_min[11]), .expected_out(expected_out[11]), .expected_in(unavg_expected_in[11]));
    neuron_learn #(.N(N)) instance12 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[12]), .weights(weights[12]), .activation_max(activation_max[12]), .activation_min(activation_min[12]), .expected_out(expected_out[12]), .expected_in(unavg_expected_in[12]));

endmodule