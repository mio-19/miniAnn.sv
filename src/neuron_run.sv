`include "defs.svh"
module neuron_run #(
    parameter N = 16
) (
    input unit_t in [N-1:0],
    output unit_t out,

    input unit_signed_t weights [N-1:0],
    input unit_signed_t activation_upper_bound,
    input unit_signed_t activation_lower_bound,

    // internal
    output unit_signed_t average,
    output bit average_too_big,
    output bit average_too_small,
    output unit_t activation_space
);

    assign activation_space = unit_signed_abs_unit(unit_signed_sub(activation_upper_bound, activation_lower_bound));

    assign average = frac_to_unit_signed_overflow_to_max_min(frac_signed_div_int(sum, N));
    frac_t sum;
    always_comb begin
        sum = `frac_zero;
        foreach (in[i]) sum = frac_add(sum, unit_mul_frac(in[i], weights[i]));
    end

    always_comb begin
        if (unit_signed_lesser(average, activation_lower_bound)) begin
            out = `unit_min;
            average_too_big = 1'b0;
            average_too_small = 1'b1;
        end else if (unit_signed_bigger(average, activation_upper_bound)) begin
            out = `unit_max;
            average_too_big = 1'b1;
            average_too_small = 1'b0;
        end else begin
            out = unit_signed_scale(average, activation_lower_bound, activation_space);
            average_too_big = 1'b0;
            average_too_small = 1'b0;
        end
    end

endmodule