`include "defs.svh"
module neuron_run #(
    parameter N = 16
) (
    input zero2one_t in [N-1:0],
    output zero2one_t out,

    input frac_t weights [N-1:0],
    input frac_t activation_max,
    input frac_t activation_min
);

    frac_t activation_space = frac_sub(activation_max, activation_min);

    frac_t sum;
    always_comb begin
        sum = 0;
        foreach (in[i]) sum += zero2one_mul_frac(in[i], weights[i]);
    end

    always_comb begin
        if (frac_lesser(sum, activation_min)) begin
            out = `zero2one_min;
        end else if (frac_bigger(sum, activation_max)) begin
            out = `zero2one_max;
        end else begin
            out = unsigned_frac_to_zero2one_overflow_as_max(frac_div(sum - activation_min, activation_space));
        end
    end

endmodule