`include "defs.svh"
module zero2one_average #(
    parameter N = 16
) (
    input zero2one_t in [N-1:0],
    output zero2one_t out
);

    frac_t sum;
    assign out = unsigned_frac_to_zero2one_overflow_as_max(frac_unsigned_div_int(sum, N));

    always_comb begin
        sum = `frac_zero;
        foreach (in[i]) sum = frac_add(sum, zero2one_to_frac(in[i]));
    end

endmodule