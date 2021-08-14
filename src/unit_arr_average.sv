`include "defs.svh"
module unit_arr_average #(
    parameter N = 16,
    parameter LEN = 32
) (
    input unit_t in [N-1:0][LEN-1:0],
    output unit_t out [LEN-1:0]
);

    frac_t sum [LEN-1:0];

    always_comb begin
        foreach (out[i]) out[i] = unsigned_frac_to_unit_overflow_as_max(frac_unsigned_div_int(sum[i], N));
    end

    always_comb begin
        foreach (sum[i]) sum[i] = `frac_zero;
        foreach (in[k]) begin
            foreach (sum[i]) sum[i] = frac_add(sum[i], unit_to_frac(in[k][i]));
        end
    end

endmodule