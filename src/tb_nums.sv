`include "defs.svh"
module tb_nums;

    task automatic test_add_frac(frac_t a, frac_t b);
        frac_t c = frac_add(a, b);
        $display("%f + %f = %f", frac2real(a), frac2real(b), frac2real(c));
    endtask
    task automatic test_sub_frac(frac_t a, frac_t b);
        frac_t c = frac_sub(a, b);
        $display("%f - %f = %f", frac2real(a), frac2real(b), frac2real(c));
    endtask
    task automatic frac_mul_frac(frac_t a, frac_t b);
        frac_t c = frac_mul(a, b);
        $display("%f * %f = %f", frac2real(a), frac2real(b), frac2real(c));
    endtask

    initial begin
        test_add_frac(frac_from_int(12),frac_from_int(13));
        test_sub_frac(frac_from_int(12),frac_from_int(13));
        test_sub_frac(frac_from_int(12),frac_from_real(13.87));
        frac_mul_frac(frac_from_real(1.3),frac_from_real(1.5));
        frac_mul_frac(frac_from_real(2.5),frac_from_real(2.5));
    end

endmodule