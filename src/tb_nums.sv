`include "defs.svh"
module tb_nums;

    function real real2real(real_t x);
        int x_i = x;
        real v = x_i / (2^16);
        real2real = v;
    endfunction
    task test_add_real(real_t a, real_t b);
        real_t c = real_add(a, b);
        $display("%f + %f = %f", real2real(a), real2real(b), real2real(c));
    endtask

    initial begin
        test_add_real(real_from_int(12),real_from_int(13));
    end

endmodule