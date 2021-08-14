`include "defs.svh"
module unit_average #(
    parameter N = 16
) (
    input unit_t in [N-1:0],
    output unit_t out
);

    frac_t sum;
    assign out = unsigned_frac_to_unit_overflow_as_max(frac_unsigned_div_int(sum, N));

    always_comb begin
        sum = `frac_zero;
        foreach (in[i]) sum = frac_add(sum, unit_to_frac(in[i]));
    end

endmodule