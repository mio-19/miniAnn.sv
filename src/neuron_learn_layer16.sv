// generated, do not edit
`include "defs.svh"
module neuron_learn_layer16 #(
    parameter N = 16
) (
    input bit clock,
    input bit valid,
    input bit learn,
    input unit_t in [N-1:0],
    output unit_t out [16-1:0],

    output unit_signed_t weights [16-1:0][N-1:0],
    output unit_signed_t activation_upper_bound [16-1:0],
    output unit_signed_t activation_lower_bound [16-1:0],

    input unit_t expected_out [16-1:0],
    output unit_t expected_in [N-1:0]
);

    unit_t unavg_expected_in [16-1:0][N-1:0];
    unit_arr_average #(.N(16), .LEN(N)) avg (.in(unavg_expected_in), .out(expected_in));

    neuron_learn #(.N(N)) instance0 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[0]), .weights(weights[0]), .activation_upper_bound(activation_upper_bound[0]), .activation_lower_bound(activation_lower_bound[0]), .expected_out(expected_out[0]), .expected_in(unavg_expected_in[0]));
    neuron_learn #(.N(N)) instance1 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[1]), .weights(weights[1]), .activation_upper_bound(activation_upper_bound[1]), .activation_lower_bound(activation_lower_bound[1]), .expected_out(expected_out[1]), .expected_in(unavg_expected_in[1]));
    neuron_learn #(.N(N)) instance2 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[2]), .weights(weights[2]), .activation_upper_bound(activation_upper_bound[2]), .activation_lower_bound(activation_lower_bound[2]), .expected_out(expected_out[2]), .expected_in(unavg_expected_in[2]));
    neuron_learn #(.N(N)) instance3 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[3]), .weights(weights[3]), .activation_upper_bound(activation_upper_bound[3]), .activation_lower_bound(activation_lower_bound[3]), .expected_out(expected_out[3]), .expected_in(unavg_expected_in[3]));
    neuron_learn #(.N(N)) instance4 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[4]), .weights(weights[4]), .activation_upper_bound(activation_upper_bound[4]), .activation_lower_bound(activation_lower_bound[4]), .expected_out(expected_out[4]), .expected_in(unavg_expected_in[4]));
    neuron_learn #(.N(N)) instance5 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[5]), .weights(weights[5]), .activation_upper_bound(activation_upper_bound[5]), .activation_lower_bound(activation_lower_bound[5]), .expected_out(expected_out[5]), .expected_in(unavg_expected_in[5]));
    neuron_learn #(.N(N)) instance6 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[6]), .weights(weights[6]), .activation_upper_bound(activation_upper_bound[6]), .activation_lower_bound(activation_lower_bound[6]), .expected_out(expected_out[6]), .expected_in(unavg_expected_in[6]));
    neuron_learn #(.N(N)) instance7 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[7]), .weights(weights[7]), .activation_upper_bound(activation_upper_bound[7]), .activation_lower_bound(activation_lower_bound[7]), .expected_out(expected_out[7]), .expected_in(unavg_expected_in[7]));
    neuron_learn #(.N(N)) instance8 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[8]), .weights(weights[8]), .activation_upper_bound(activation_upper_bound[8]), .activation_lower_bound(activation_lower_bound[8]), .expected_out(expected_out[8]), .expected_in(unavg_expected_in[8]));
    neuron_learn #(.N(N)) instance9 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[9]), .weights(weights[9]), .activation_upper_bound(activation_upper_bound[9]), .activation_lower_bound(activation_lower_bound[9]), .expected_out(expected_out[9]), .expected_in(unavg_expected_in[9]));
    neuron_learn #(.N(N)) instance10 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[10]), .weights(weights[10]), .activation_upper_bound(activation_upper_bound[10]), .activation_lower_bound(activation_lower_bound[10]), .expected_out(expected_out[10]), .expected_in(unavg_expected_in[10]));
    neuron_learn #(.N(N)) instance11 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[11]), .weights(weights[11]), .activation_upper_bound(activation_upper_bound[11]), .activation_lower_bound(activation_lower_bound[11]), .expected_out(expected_out[11]), .expected_in(unavg_expected_in[11]));
    neuron_learn #(.N(N)) instance12 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[12]), .weights(weights[12]), .activation_upper_bound(activation_upper_bound[12]), .activation_lower_bound(activation_lower_bound[12]), .expected_out(expected_out[12]), .expected_in(unavg_expected_in[12]));
    neuron_learn #(.N(N)) instance13 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[13]), .weights(weights[13]), .activation_upper_bound(activation_upper_bound[13]), .activation_lower_bound(activation_lower_bound[13]), .expected_out(expected_out[13]), .expected_in(unavg_expected_in[13]));
    neuron_learn #(.N(N)) instance14 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[14]), .weights(weights[14]), .activation_upper_bound(activation_upper_bound[14]), .activation_lower_bound(activation_lower_bound[14]), .expected_out(expected_out[14]), .expected_in(unavg_expected_in[14]));
    neuron_learn #(.N(N)) instance15 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[15]), .weights(weights[15]), .activation_upper_bound(activation_upper_bound[15]), .activation_lower_bound(activation_lower_bound[15]), .expected_out(expected_out[15]), .expected_in(unavg_expected_in[15]));

endmodule
