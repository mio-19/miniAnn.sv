`ifndef _SIMPLE_ANN_DEFS_H
`define _SIMPLE_ANN_DEFS_H

typedef enum {
    INIT, LEARN, LOAD, RUN
} neuron_state_t;

// 65 bits
typedef struct packed {
    bit sign;
    bit [31:0] i;
    bit [31:0] frac;
} real_t;
function real_t real_add(real_t x, real_t y);
    real_add = x+y;
endfunction
function real_t real_sub(real_t x, real_t y);
    real_sub = x-y;
endfunction
// behaviour is undefined if it overflows
function real_t real_mul(real_t x, real_t y);
    bit [128:0] unsigned_result = $unsigned({x.i,x.frac})*$unsigned({y.i,y.frac}); // 129 bits
    real_mul = {x.sign!=y.sign, unsigned_result[95:32]};
endfunction

typedef struct packed {
    bit [63:0] fraction;
} zero2one_t;
function zero2one_t zero2one_add(zero2one_t x, zero2one_t y);
    zero2one_add = x+y;
endfunction
function real_t zero2one_to_real(zero2one_t x);
    zero2one_to_real = {1'b1, 32'b0, x[63:32]};
endfunction

`endif