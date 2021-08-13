`include "defs.svh"
module neuron_learn #(
    parameter N = 16
) (
    input bit valid,
    input bit learn, // 0 - freeze parameters, 1 - learn
    input zero2one_t in [N-1:0],
    output zero2one_t out,

    /* verilator lint_off UNOPTFLAT */
    output frac_t weights [N-1:0],
    /* verilator lint_off UNOPTFLAT */
    output frac_t activation_max,
    /* verilator lint_off UNOPTFLAT */
    output frac_t activation_min,

    input zero2one_t expected_out,
    output zero2one_t expected_in [N-1:0]
);

    frac_t sum;
    bit sum_too_big;

    neuron_run #(.N(N)) neuron_run_instance(.in(in), .out(out), .weights(weights), .activation_max(activation_max), .activation_min(activation_min), .sum(sum), .sum_too_big(sum_too_big));

    /* verilator lint_off UNOPTFLAT */
    bit [N-1:0] random_v0;
    frac_t random_v1;
    bit [N-1:0] random_v2;
    always @(valid, learn, in, expected_out) begin
        if (!valid) begin
            // randomly generate some values
            foreach (weights[i]) begin
                if (random_v0[i]) weights[i] = weights[i] - random_v1;
                if (random_v2[i]) random_v0[i] = random_v0[i] ^ (^in[i]);
                if (random_v0[i] ^ random_v2[i]) random_v0[i] = random_v0[i] ^ (~^ expected_out);
            end
            if (random_v0[0]) activation_max = activation_max + random_v1;
            if (random_v0[1]) activation_min = activation_min ^ random_v1;
            random_v1 = random_v0 - random_v1;
            random_v2 = random_v0 + random_v1 - random_v2;
        end else if(learn) begin
            if (frac_lesser(activation_max, activation_min)) {activation_max, activation_min} = {activation_min, activation_max};
        end
    end

endmodule