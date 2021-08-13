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
} frac_t;
function frac_t frac_from_int(int i);
    frac_from_int = {i[15:0],16'b0};
endfunction
/* verilator lint_off REALCVT */
function frac_t frac_from_real(real x);
    frac_from_real = x * (1<<16);
endfunction
function real frac2real(frac_t x);
    frac2real = ($signed(x)*1.0)/(1<<16);
endfunction
function frac_t frac_add(frac_t x, frac_t y);
    frac_add = x+y;
endfunction
function frac_t frac_sub(frac_t x, frac_t y);
    frac_sub = x-y;
endfunction
// behaviour is undefined if it overflows
function bit [64:0] frac_mul_aux(bit [31:0] x, bit [31:0] y);
    frac_mul_aux  = $signed(x)*$signed(x);
endfunction
function frac_t frac_mul_aux1(bit [64:0] result);
    frac_mul_aux1 = {result[64], result[46:16]};
endfunction
function frac_t frac_mul(frac_t x, frac_t y);
    frac_mul = frac_mul_aux1(frac_mul_aux(x,y));
endfunction

typedef struct packed {
    bit [15:0] fraction;
} zero2one_t;
function zero2one_t zero2one_add(zero2one_t x, zero2one_t y);
    zero2one_add = x+y;
endfunction
function zero2one_t zero2one_from_real(real x);
    zero2one_from_real = x * (1<<16);
endfunction
function real zero2one_to_real(zero2one_t x);
    zero2one_to_real = ($unsigned(x)*1.0)/(1<<16);
endfunction
function frac_t zero2one_to_frac(zero2one_t x);
    zero2one_to_frac = {16'b0, x};
endfunction

`endif