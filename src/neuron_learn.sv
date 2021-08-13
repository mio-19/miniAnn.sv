`include "defs.svh"
module neuron_learn #(
    parameter N = 16
) (
    input bit valid,
    input bit learn, // 0 - freeze parameters, 1 - learn
    input zero2one_t in [N-1:0],
    output zero2one_t out,

    output frac_t weights [N-1:0],
    output frac_t activation_max,
    output frac_t activation_min,

    input zero2one_t expected_out,
    output zero2one_t expected_in [N-1:0]
);

    neuron_run #(.N(N)) neuron_run_instance(.in(in), .out(out), .weights(weights), .activation_max(activation_max), .activation_min(activation_min));

    bit [N-1:0] random_v0;
    bit [$clog2(`frac_t_size)-1:0] random_v1;
    bit [$clog2(N)-1:0] random_v2;
    always @(valid, learn, in, expected_out) begin
        if (!valid) begin
            // randomly generate some values
            random_v1[random_v0] <= random_v1[random_v0] ^ random_v0[~random_v2];
            foreach (random_v0[i]) begin
                random_v0[i] <= random_v0[i] ^ (random_v0[random_v2^i] ? weights[random_v2+i][random_v1-i] : in[random_v2-i][~random_v1+i]);
            end
            random_v2 <= random_v2 ^ ~random_v0;
            foreach (weights[i]) begin
                weights[i] <= weights[i+random_v0] ^ {in[i+random_v1], out + random_v2};
            end
            activation_max <= activation_max + (random_v2 ^ random_v1);
            activation_min <= activation_min - random_v0;
        end else begin
        end
    end

endmodule