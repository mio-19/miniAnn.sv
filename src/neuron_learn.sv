`include "defs.svh"
module neuron_learn #(
    parameter N = 16
) (
    input bit clock,
    input bit valid,
    input bit learn, // 0 - freeze parameters, 1 - learn
    input zero2one_t in [N-1:0],
    output zero2one_t out,

    /* verilator lint_off UNOPTFLAT */
    output zero2one_signed_t weights [N-1:0],
    /* verilator lint_off UNOPTFLAT */
    output zero2one_signed_t activation_upper_bound,
    /* verilator lint_off UNOPTFLAT */
    output zero2one_signed_t activation_lower_bound,

    input zero2one_t expected_out,
    output zero2one_t expected_in [N-1:0]
);

    zero2one_signed_t average;
    bit average_too_big;
    bit average_too_small;
    zero2one_t activation_space;
    neuron_run #(.N(N)) neuron_run_instance(.in(in), .out(out), .weights(weights), .activation_upper_bound(activation_upper_bound), .activation_lower_bound(activation_lower_bound), .average(average), .average_too_big(average_too_big), .average_too_small(average_too_small), .activation_space(activation_space));

    zero2one_signed_t out_delta_signed = zero2one_sub_signed(expected_out, out);
    bit out_delta_postive = zero2one_signed_postive(out_delta_signed);
    bit out_delta_negative = zero2one_signed_negative(out_delta_signed);
    zero2one_t out_delta_abs = zero2one_signed_abs_zero2one(out_delta_signed);

    function frac_t out_delta_signed_times(frac_t x);
        out_delta_signed_times = zero2one_signed_mul_frac(out_delta_signed, x);
    endfunction

    function frac_t out_delta_abs_times(frac_t x);
        out_delta_abs_times = zero2one_mul_frac(out_delta_abs, x);
    endfunction

    function zero2one_signed_t out_delta_signed_mul(zero2one_signed_t x);
        out_delta_signed_mul = zero2one_signed_mul(out_delta_signed, x);
    endfunction

    /* verilator lint_off UNOPTFLAT */
    bit [N-1:0] random_v0;
    zero2one_signed_t random_v1;
    bit [N-1:0] random_v2;
    always_ff @(posedge clock, negedge valid) begin
        if (!valid) begin
            /* verilator lint_off WIDTH */
            // randomly generate some values
            foreach (weights[i]) begin
                if (random_v0[i]) weights[i] <= weights[i] - random_v1;
                if (random_v2[i]) random_v0[i] <= random_v0[i] ^ (^in[i]);
                else if (random_v0[i] ^ random_v2[i]) random_v0[i] <= random_v0[i] ^ (~^ expected_out);
            end
            if (random_v0[0]) activation_max <= activation_max + random_v1;
            if (random_v0[1]) activation_min <= activation_min ^ random_v1;
            random_v1 <= random_v0 - random_v1;
            random_v2 <= random_v0 + random_v1 - random_v2;
        end else if(learn) begin
            if (zero2one_signed_lesser(activation_max, activation_min)) {activation_max, activation_min} <= {activation_min, activation_max};
            else begin
                if (average_too_small && out_delta_postive) begin
                    activation_min <= zero2one_signed_sub(activation_min, out_delta_signed_mul(zero2one_signed_sub(activation_min, average)));
                end
                if (average_too_big && out_delta_negative) begin
                    activation_max <= zero2one_signed_add(activation_max, out_delta_signed_mul(zero2one_signed_sub(average, activation_max)));
                end
                foreach (expected_in[i]) begin
                    if (zero2one_signed_postive(weights[i])==out_delta_postive) begin
                        expected_in[i] <= zero2one_add(in[i], zero2one_mul(out_delta_abs, zero2one_mul(zero2one_signed_abs_zero2one(weights[i]), activation_space)));
                        weights[i] <= zero2one_signed_add(weights[i], out_delta_signed_mul(weights[i]));
                    end else begin
                        weights[i] <= zero2one_signed_sub(weights[i], out_delta_signed_mul(weights[i]));
                        expected_in[i] <= zero2one_sub_overflow_as_min(in[i], zero2one_mul(out_delta_abs, zero2one_mul(zero2one_signed_abs_zero2one(weights[i]), activation_space)));
                    end
                    // minimize activation_space
                    // activation_min <= ...
                    // activation_max <= ...
                end
            end
        end
    end

endmodule