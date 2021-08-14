// generated, do not edit
`include "defs.svh"
module neuron_learn_layer36 #(
    parameter N = 16
) (
    input bit clock,
    input bit valid,
    input bit learn,
    input zero2one_t in [N-1:0],
    output zero2one_t out [36-1:0],

    output frac_t weights [36-1:0][N-1:0],
    output frac_t activation_max [36-1:0],
    output frac_t activation_min [36-1:0],

    input zero2one_t expected_out [36-1:0],
    output zero2one_t expected_in [N-1:0]
);

    zero2one_t unavg_expected_in [36-1:0][N-1:0];
    zero2one_arr_average #(.N(36), .LEN(N)) avg (.in(unavg_expected_in), .out(expected_in));

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
    neuron_learn #(.N(N)) instance13 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[13]), .weights(weights[13]), .activation_max(activation_max[13]), .activation_min(activation_min[13]), .expected_out(expected_out[13]), .expected_in(unavg_expected_in[13]));
    neuron_learn #(.N(N)) instance14 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[14]), .weights(weights[14]), .activation_max(activation_max[14]), .activation_min(activation_min[14]), .expected_out(expected_out[14]), .expected_in(unavg_expected_in[14]));
    neuron_learn #(.N(N)) instance15 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[15]), .weights(weights[15]), .activation_max(activation_max[15]), .activation_min(activation_min[15]), .expected_out(expected_out[15]), .expected_in(unavg_expected_in[15]));
    neuron_learn #(.N(N)) instance16 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[16]), .weights(weights[16]), .activation_max(activation_max[16]), .activation_min(activation_min[16]), .expected_out(expected_out[16]), .expected_in(unavg_expected_in[16]));
    neuron_learn #(.N(N)) instance17 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[17]), .weights(weights[17]), .activation_max(activation_max[17]), .activation_min(activation_min[17]), .expected_out(expected_out[17]), .expected_in(unavg_expected_in[17]));
    neuron_learn #(.N(N)) instance18 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[18]), .weights(weights[18]), .activation_max(activation_max[18]), .activation_min(activation_min[18]), .expected_out(expected_out[18]), .expected_in(unavg_expected_in[18]));
    neuron_learn #(.N(N)) instance19 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[19]), .weights(weights[19]), .activation_max(activation_max[19]), .activation_min(activation_min[19]), .expected_out(expected_out[19]), .expected_in(unavg_expected_in[19]));
    neuron_learn #(.N(N)) instance20 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[20]), .weights(weights[20]), .activation_max(activation_max[20]), .activation_min(activation_min[20]), .expected_out(expected_out[20]), .expected_in(unavg_expected_in[20]));
    neuron_learn #(.N(N)) instance21 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[21]), .weights(weights[21]), .activation_max(activation_max[21]), .activation_min(activation_min[21]), .expected_out(expected_out[21]), .expected_in(unavg_expected_in[21]));
    neuron_learn #(.N(N)) instance22 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[22]), .weights(weights[22]), .activation_max(activation_max[22]), .activation_min(activation_min[22]), .expected_out(expected_out[22]), .expected_in(unavg_expected_in[22]));
    neuron_learn #(.N(N)) instance23 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[23]), .weights(weights[23]), .activation_max(activation_max[23]), .activation_min(activation_min[23]), .expected_out(expected_out[23]), .expected_in(unavg_expected_in[23]));
    neuron_learn #(.N(N)) instance24 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[24]), .weights(weights[24]), .activation_max(activation_max[24]), .activation_min(activation_min[24]), .expected_out(expected_out[24]), .expected_in(unavg_expected_in[24]));
    neuron_learn #(.N(N)) instance25 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[25]), .weights(weights[25]), .activation_max(activation_max[25]), .activation_min(activation_min[25]), .expected_out(expected_out[25]), .expected_in(unavg_expected_in[25]));
    neuron_learn #(.N(N)) instance26 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[26]), .weights(weights[26]), .activation_max(activation_max[26]), .activation_min(activation_min[26]), .expected_out(expected_out[26]), .expected_in(unavg_expected_in[26]));
    neuron_learn #(.N(N)) instance27 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[27]), .weights(weights[27]), .activation_max(activation_max[27]), .activation_min(activation_min[27]), .expected_out(expected_out[27]), .expected_in(unavg_expected_in[27]));
    neuron_learn #(.N(N)) instance28 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[28]), .weights(weights[28]), .activation_max(activation_max[28]), .activation_min(activation_min[28]), .expected_out(expected_out[28]), .expected_in(unavg_expected_in[28]));
    neuron_learn #(.N(N)) instance29 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[29]), .weights(weights[29]), .activation_max(activation_max[29]), .activation_min(activation_min[29]), .expected_out(expected_out[29]), .expected_in(unavg_expected_in[29]));
    neuron_learn #(.N(N)) instance30 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[30]), .weights(weights[30]), .activation_max(activation_max[30]), .activation_min(activation_min[30]), .expected_out(expected_out[30]), .expected_in(unavg_expected_in[30]));
    neuron_learn #(.N(N)) instance31 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[31]), .weights(weights[31]), .activation_max(activation_max[31]), .activation_min(activation_min[31]), .expected_out(expected_out[31]), .expected_in(unavg_expected_in[31]));
    neuron_learn #(.N(N)) instance32 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[32]), .weights(weights[32]), .activation_max(activation_max[32]), .activation_min(activation_min[32]), .expected_out(expected_out[32]), .expected_in(unavg_expected_in[32]));
    neuron_learn #(.N(N)) instance33 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[33]), .weights(weights[33]), .activation_max(activation_max[33]), .activation_min(activation_min[33]), .expected_out(expected_out[33]), .expected_in(unavg_expected_in[33]));
    neuron_learn #(.N(N)) instance34 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[34]), .weights(weights[34]), .activation_max(activation_max[34]), .activation_min(activation_min[34]), .expected_out(expected_out[34]), .expected_in(unavg_expected_in[34]));
    neuron_learn #(.N(N)) instance35 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[35]), .weights(weights[35]), .activation_max(activation_max[35]), .activation_min(activation_min[35]), .expected_out(expected_out[35]), .expected_in(unavg_expected_in[35]));

endmodule
