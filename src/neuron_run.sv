`include "defs.svh"
module neuron_run #(
    parameter N = 16
) (
    input zero2one_t in [N-1:0],
    output zero2one_t out,

    input zero2one_signed_t weights [N-1:0],
    input zero2one_signed_t activation_upper_bound,
    input zero2one_signed_t activation_lower_bound,

    // internal
    output zero2one_signed_t average,
    output bit average_too_big,
    output bit average_too_small,
    output zero2one_t activation_space
);

    assign activation_space = zero2one_signed_abs_zero2one(zero2one_signed_sub(activation_max, activation_min));

    assign average = frac_to_zero2one_signed_overflow_to_max_min(frac_signed_div_int(sum, N));
    frac_t sum;
    always_comb begin
        sum = `frac_zero;
        foreach (in[i]) sum = frac_add(sum, zero2one_mul_frac(in[i], weights[i]));
    end

    always_comb begin
        if (zero2one_signed_lesser(average, activation_lower_bound)) begin
            out = `zero2one_min;
            average_too_big = 1'b0;
            average_too_small = 1'b1;
        end else if (zero2one_signed_bigger(average, activation_upper_bound)) begin
            out = `zero2one_max;
            average_too_big = 1'b1;
            average_too_small = 1'b0;
        end else begin
            out = zero2one_signed_scale(average, activation_lower_bound, activation_space);
            average_too_big = 1'b0;
            average_too_small = 1'b0;
        end
    end

endmodule