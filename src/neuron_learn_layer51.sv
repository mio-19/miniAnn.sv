// generated, do not edit
`include "defs.svh"
module neuron_learn_layer51 #(
    parameter N = 16
) (
    input bit clock,
    input bit valid,
    input bit learn,
    input unit_t in [N-1:0],
    output unit_t out [51-1:0],

    output frac_t weights [51-1:0][N-1:0],
    output frac_t activation_max [51-1:0],
    output frac_t activation_min [51-1:0],

    input unit_t expected_out [51-1:0],
    output unit_t expected_in [N-1:0]
);

    unit_t unavg_expected_in [51-1:0][N-1:0];
    unit_arr_average #(.N(51), .LEN(N)) avg (.in(unavg_expected_in), .out(expected_in));

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
    neuron_learn #(.N(N)) instance36 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[36]), .weights(weights[36]), .activation_max(activation_max[36]), .activation_min(activation_min[36]), .expected_out(expected_out[36]), .expected_in(unavg_expected_in[36]));
    neuron_learn #(.N(N)) instance37 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[37]), .weights(weights[37]), .activation_max(activation_max[37]), .activation_min(activation_min[37]), .expected_out(expected_out[37]), .expected_in(unavg_expected_in[37]));
    neuron_learn #(.N(N)) instance38 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[38]), .weights(weights[38]), .activation_max(activation_max[38]), .activation_min(activation_min[38]), .expected_out(expected_out[38]), .expected_in(unavg_expected_in[38]));
    neuron_learn #(.N(N)) instance39 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[39]), .weights(weights[39]), .activation_max(activation_max[39]), .activation_min(activation_min[39]), .expected_out(expected_out[39]), .expected_in(unavg_expected_in[39]));
    neuron_learn #(.N(N)) instance40 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[40]), .weights(weights[40]), .activation_max(activation_max[40]), .activation_min(activation_min[40]), .expected_out(expected_out[40]), .expected_in(unavg_expected_in[40]));
    neuron_learn #(.N(N)) instance41 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[41]), .weights(weights[41]), .activation_max(activation_max[41]), .activation_min(activation_min[41]), .expected_out(expected_out[41]), .expected_in(unavg_expected_in[41]));
    neuron_learn #(.N(N)) instance42 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[42]), .weights(weights[42]), .activation_max(activation_max[42]), .activation_min(activation_min[42]), .expected_out(expected_out[42]), .expected_in(unavg_expected_in[42]));
    neuron_learn #(.N(N)) instance43 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[43]), .weights(weights[43]), .activation_max(activation_max[43]), .activation_min(activation_min[43]), .expected_out(expected_out[43]), .expected_in(unavg_expected_in[43]));
    neuron_learn #(.N(N)) instance44 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[44]), .weights(weights[44]), .activation_max(activation_max[44]), .activation_min(activation_min[44]), .expected_out(expected_out[44]), .expected_in(unavg_expected_in[44]));
    neuron_learn #(.N(N)) instance45 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[45]), .weights(weights[45]), .activation_max(activation_max[45]), .activation_min(activation_min[45]), .expected_out(expected_out[45]), .expected_in(unavg_expected_in[45]));
    neuron_learn #(.N(N)) instance46 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[46]), .weights(weights[46]), .activation_max(activation_max[46]), .activation_min(activation_min[46]), .expected_out(expected_out[46]), .expected_in(unavg_expected_in[46]));
    neuron_learn #(.N(N)) instance47 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[47]), .weights(weights[47]), .activation_max(activation_max[47]), .activation_min(activation_min[47]), .expected_out(expected_out[47]), .expected_in(unavg_expected_in[47]));
    neuron_learn #(.N(N)) instance48 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[48]), .weights(weights[48]), .activation_max(activation_max[48]), .activation_min(activation_min[48]), .expected_out(expected_out[48]), .expected_in(unavg_expected_in[48]));
    neuron_learn #(.N(N)) instance49 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[49]), .weights(weights[49]), .activation_max(activation_max[49]), .activation_min(activation_min[49]), .expected_out(expected_out[49]), .expected_in(unavg_expected_in[49]));
    neuron_learn #(.N(N)) instance50 (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[50]), .weights(weights[50]), .activation_max(activation_max[50]), .activation_min(activation_min[50]), .expected_out(expected_out[50]), .expected_in(unavg_expected_in[50]));

endmodule
