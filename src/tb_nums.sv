`include "defs.svh"
module tb_nums;

    task test_add_real(real_t a, real_t b);
        real_t c = real_add(a, b);
        $display("");
    endtask

    initial begin
    end

endmodule