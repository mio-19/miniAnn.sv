#!/bin/bash
set -e

part1() {
sed "s|@|$1|g" << 'EOF'
    neuron_learn #(.N(N)) instance@ (.clock(clock), .valid(valid), .learn(learn), .in(in), .out(out[@]), .weights(weights[@]), .activation_max(activation_max[@]), .activation_min(activation_min[@]), .expected_out(expected_out[@]), .expected_in(unavg_expected_in[@]));
EOF
}

mod() {
sed "s|*|$1|g" << 'EOF'
// generated, do not edit
`include "defs.svh"
module neuron_learn_layer* #(
    parameter N = 16
) (
    input bit clock,
    input bit valid,
    input bit learn,
    input zero2one_t in [N-1:0],
    output zero2one_t out [*-1:0],

    output frac_t weights [*-1:0][N-1:0],
    output frac_t activation_max [*-1:0],
    output frac_t activation_min [*-1:0],

    input zero2one_t expected_out [*-1:0],
    output zero2one_t expected_in [N-1:0]
);

    zero2one_t unavg_expected_in [*-1:0][N-1:0];
    zero2one_arr_average #(.N(*), .LEN(N)) avg (.in(unavg_expected_in), .out(expected_in));

EOF
local i=0
while [[ "$i" -lt "$1" ]]; do
    part1 "$i"
    (( i += 1 ))
done
cat << 'EOF'

endmodule
EOF
}

i=1
while [[ "$i" -le 64 ]]; do
    mod "$i" > neuron_learn_layer"$i".sv
    (( i += 1 ))
done
