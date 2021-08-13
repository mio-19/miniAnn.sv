`ifndef _SIMPLE_ANN_DEFS_H
`define _SIMPLE_ANN_DEFS_H

typedef enum {
    INIT, LEARN, LOAD, RUN
} neuron_state_t;

// 32 bits
typedef struct packed {
    bit sign;
    bit [30:16] i;
    bit [15:0] frac;
} real_t;
function real_t real_from_int(int i);
    real_from_int = {i[15:0],16'b0};
endfunction
function real_t real_from_real(real x);
    real_from_real = x * (1<<16);
endfunction
function real_t real_add(real_t x, real_t y);
    real_add = x+y;
endfunction
function real_t real_sub(real_t x, real_t y);
    real_sub = x-y;
endfunction
// behaviour is undefined if it overflows
function real_t real_mul(real_t x, real_t y);
    bit [64:0] unsigned_result = $signed(x)*$signed(x); // 65 bits
    real_mul = {unsigned_result[64], unsigned_result[46:16]};
endfunction

typedef struct packed {
    bit [63:0] fraction;
} zero2one_t;
function zero2one_t zero2one_add(zero2one_t x, zero2one_t y);
    zero2one_add = x+y;
endfunction
function real_t zero2one_to_real(zero2one_t x);
    zero2one_to_real = {16'b0, x[63:48]};
endfunction

`endif