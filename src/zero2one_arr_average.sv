`include "defs.svh"
module zero2one_arr_average #(
    parameter N = 16,
    parameter LEN = 32
) (
    input zero2one_t in [N-1:0][LEN-1:0],
    output zero2one_t out [LEN-1:0]
);

    frac_t sum [LEN-1:0];

    always_comb begin
        foreach (out[i]) out[i] = unsigned_frac_to_zero2one_overflow_as_max(frac_unsigned_div_int(sum[i], N));
    end

    always_comb begin
        foreach (sum[i]) sum[i] = `frac_zero;
        foreach (in[k]) begin
            foreach (sum[i]) sum[i] = frac_add(sum[i], zero2one_to_frac(in[k][i]));
        end
    end

endmodule