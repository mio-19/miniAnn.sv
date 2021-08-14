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
        //$display("%f (%b %d) * %f (%b %d) = %f (%b %d)", frac2real(a), a, a, frac2real(b), b, b, frac2real(c), c, c);
        $display("%f * %f = %f", frac2real(a), frac2real(b), frac2real(c));
    endtask

    initial begin
        $display("frac");
        test_add_frac(frac_from_int(12),frac_from_int(13));
        test_sub_frac(frac_from_int(12),frac_from_int(13));
        test_sub_frac(frac_from_int(12),frac_from_real(13.87));
        test_mul_frac(frac_from_real(1.3),frac_from_real(1.5));
        test_mul_frac(frac_from_real(2.5),frac_from_real(2.5));
        test_mul_frac(frac_from_real(12),frac_from_real(1));
        test_mul_frac(frac_from_real(1),frac_from_real(12));
        test_mul_frac(frac_from_real(2.5),frac_from_real(9.8));
        test_mul_frac(frac_from_real(454.697),frac_from_real(8.500));
    end

    task automatic test_unit_add(real a, real b);
        unit_t x = unit_from_real(a);
        unit_t y = unit_from_real(b);
        unit_t c = unit_add(x,y);
        $display("%f + %f = %f", unit_to_real(x),unit_to_real(y),unit_to_real(c));
    endtask
    task automatic test_unit_frac(real a);
        unit_t x = unit_from_real(a);
        frac_t x_f = unit_to_frac(x);
        $display("%f %f", unit_to_real(x),frac2real(x_f));
    endtask

    initial begin
        $display("unit");
        test_unit_add(0.1,0.2);
        test_unit_add(0.1,0.9);
        test_unit_frac(0.1);
        test_unit_frac(0.9);
        test_unit_frac(0.875);
    end

endmodule