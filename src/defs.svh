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
/* verilator lint_off REALCVT */
function real_t real_from_real(real x);
    real_from_real = x * (1<<16);
endfunction
function real real2real(real_t x);
    real2real = ($signed(x)*1.0)/(1<<16);
endfunction
function real_t real_add(real_t x, real_t y);
    real_add = x+y;
endfunction
function real_t real_sub(real_t x, real_t y);
    real_sub = x-y;
endfunction
// behaviour is undefined if it overflows
function bit [64:0] real_mul_aux(bit [31:0] x, bit [31:0] y);
    real_mul_aux  = $signed(x)*$signed(x);
endfunction
function real_t real_mul_aux1(bit [64:0] result);
    real_mul_aux1 = {result[64], result[46:16]};
endfunction
function real_t real_mul(real_t x, real_t y);
    real_mul = real_mul_aux1(real_mul_aux(x,y));
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