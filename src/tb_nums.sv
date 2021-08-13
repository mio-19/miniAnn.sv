`include "defs.svh"
module tb_nums;

    function real real2real(real_t x);
        real2real = ($signed(x)*1.0)/(1<<16);
    endfunction
    task automatic test_add_real(real_t a, real_t b);
        real_t c = real_add(a, b);
        $display("%f + %f = %f", real2real(a), real2real(b), real2real(c));
    endtask
    task automatic test_sub_real(real_t a, real_t b);
        real_t c = real_sub(a, b);
        $display("%f + %f = %f", real2real(a), real2real(b), real2real(c));
    endtask

    initial begin
        test_add_real(real_from_int(12),real_from_int(13));
        test_sub_real(real_from_int(12),real_from_int(13));
        test_sub_real(real_from_int(12),real_from_real(13.87));
    end

endmodule