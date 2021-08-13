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
    task automatic test_mul_frac(frac_t a, frac_t b);
        frac_t c = frac_mul(a, b);
        $display("%f (%b) * %f (%b) = %f (%b)", frac2real(a), a, frac2real(b), b, frac2real(c), c);
    endtask

    initial begin
        $display("frac");
        test_add_frac(frac_from_int(12),frac_from_int(13));
        test_sub_frac(frac_from_int(12),frac_from_int(13));
        test_sub_frac(frac_from_int(12),frac_from_real(13.87));
        test_mul_frac(frac_from_real(1.3),frac_from_real(1.5));
        test_mul_frac(frac_from_real(2.5),frac_from_real(2.5));
        test_mul_frac(frac_from_real(12),frac_from_real(1)); // broken
        test_mul_frac(frac_from_real(1),frac_from_real(12)); // broken
        test_mul_frac(frac_from_real(2.5),frac_from_real(9.8)); // broken
    end

    task automatic test_zero2one_add(real a, real b);
        zero2one_t x = zero2one_from_real(a);
        zero2one_t y = zero2one_from_real(b);
        zero2one_t c = zero2one_add(x,y);
        $display("%f + %f = %f", zero2one_to_real(x),zero2one_to_real(y),zero2one_to_real(c));
    endtask
    task automatic test_zero2one_frac(real a);
        zero2one_t x = zero2one_from_real(a);
        frac_t x_f = zero2one_to_frac(x);
        $display("%f %f", zero2one_to_real(x),frac2real(x_f));
    endtask

    initial begin
        $display("zero2one");
        test_zero2one_add(0.1,0.2);
        test_zero2one_add(0.1,0.9);
        test_zero2one_frac(0.1);
        test_zero2one_frac(0.9);
        test_zero2one_frac(0.875);
    end

endmodule