`include "defs.svh"
module tb_nums;

    function real real2real(real_t x);
        real v = x;
        real2real = v / (2^32);
    endfunction
    task test_add_real(real_t a, real_t b);
        real_t c = real_add(a, b);
        $display("%f + %f = %f", real2real(a), real2real(b), real2real(c));
    endtask

    initial begin
        test_add_real(real_from_i(12),real_from_i(13));
    end

endmodule