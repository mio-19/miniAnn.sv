// generated, do not edit
`include "defs.svh"
module neuron_learn_layer28 #(
    parameter N = 16
) (
    input bit clock,
    input bit valid,
    input bit learn,
    input unit_t in [N-1:0],
    output unit_t out [28-1:0],

    output unit_signed_t weights [28-1:0][N-1:0],
    output unit_signed_t activation_upper_bound [28-1:0],
    output unit_signed_t activation_lower_bound [28-1:0],

    input unit_t expected_out [28-1:0],
    output unit_t expected_in [N-1:0]
);

    unit_t unavg_expected_in [28-1:0][N-1:0];
    unit_arr_average #(.N(28), .LEN(N)) avg (.in(unavg_expected_in), .out(expected_in));

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
    neuron_learn #(.N(N)) instance16 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[16]), .weights(weights[16]), .activation_upper_bound(activation_upper_bound[16]), .activation_lower_bound(activation_lower_bound[16]), .expected_out(expected_out[16]), .expected_in(unavg_expected_in[16]));
    neuron_learn #(.N(N)) instance17 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[17]), .weights(weights[17]), .activation_upper_bound(activation_upper_bound[17]), .activation_lower_bound(activation_lower_bound[17]), .expected_out(expected_out[17]), .expected_in(unavg_expected_in[17]));
    neuron_learn #(.N(N)) instance18 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[18]), .weights(weights[18]), .activation_upper_bound(activation_upper_bound[18]), .activation_lower_bound(activation_lower_bound[18]), .expected_out(expected_out[18]), .expected_in(unavg_expected_in[18]));
    neuron_learn #(.N(N)) instance19 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[19]), .weights(weights[19]), .activation_upper_bound(activation_upper_bound[19]), .activation_lower_bound(activation_lower_bound[19]), .expected_out(expected_out[19]), .expected_in(unavg_expected_in[19]));
    neuron_learn #(.N(N)) instance20 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[20]), .weights(weights[20]), .activation_upper_bound(activation_upper_bound[20]), .activation_lower_bound(activation_lower_bound[20]), .expected_out(expected_out[20]), .expected_in(unavg_expected_in[20]));
    neuron_learn #(.N(N)) instance21 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[21]), .weights(weights[21]), .activation_upper_bound(activation_upper_bound[21]), .activation_lower_bound(activation_lower_bound[21]), .expected_out(expected_out[21]), .expected_in(unavg_expected_in[21]));
    neuron_learn #(.N(N)) instance22 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[22]), .weights(weights[22]), .activation_upper_bound(activation_upper_bound[22]), .activation_lower_bound(activation_lower_bound[22]), .expected_out(expected_out[22]), .expected_in(unavg_expected_in[22]));
    neuron_learn #(.N(N)) instance23 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[23]), .weights(weights[23]), .activation_upper_bound(activation_upper_bound[23]), .activation_lower_bound(activation_lower_bound[23]), .expected_out(expected_out[23]), .expected_in(unavg_expected_in[23]));
    neuron_learn #(.N(N)) instance24 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[24]), .weights(weights[24]), .activation_upper_bound(activation_upper_bound[24]), .activation_lower_bound(activation_lower_bound[24]), .expected_out(expected_out[24]), .expected_in(unavg_expected_in[24]));
    neuron_learn #(.N(N)) instance25 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[25]), .weights(weights[25]), .activation_upper_bound(activation_upper_bound[25]), .activation_lower_bound(activation_lower_bound[25]), .expected_out(expected_out[25]), .expected_in(unavg_expected_in[25]));
    neuron_learn #(.N(N)) instance26 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[26]), .weights(weights[26]), .activation_upper_bound(activation_upper_bound[26]), .activation_lower_bound(activation_lower_bound[26]), .expected_out(expected_out[26]), .expected_in(unavg_expected_in[26]));
    neuron_learn #(.N(N)) instance27 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[27]), .weights(weights[27]), .activation_upper_bound(activation_upper_bound[27]), .activation_lower_bound(activation_lower_bound[27]), .expected_out(expected_out[27]), .expected_in(unavg_expected_in[27]));

endmodule
