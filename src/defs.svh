`ifndef _SIMPLE_ANN_DEFS_H
`define _SIMPLE_ANN_DEFS_H

typedef enum {
    INIT, LEARN, LOAD, RUN
} neuron_state_t;

// 64 bits
typedef struct packed {
    bit sign;
    bit [31:0] i;
    bit [30:0] frac;
} real_t;
function real_t real_from_i(bit [31:0] i);
    longint unsigned a = {1'b0, i[31:0], 31'b0};
    real_from_i = a;
endfunction
function real_t real_add(real_t x, real_t y);
    longint unsigned x_i = x;
    longint unsigned y_i = y;
    longint unsigned r = x_i+y_i;
    real_add = r;
endfunction
function real_t real_sub(real_t x, real_t y);
    longint unsigned x_i = x;
    longint unsigned y_i = y;
    longint unsigned r = x_i-x_i;
    real_sub = r;
endfunction
// behaviour is undefined if it overflows
function real_t real_mul(real_t x, real_t y);
    bit [126:0] unsigned_result = $unsigned({x.i,x.frac})*$unsigned({y.i,y.frac}); // 127 bits
    real_mul = {x.sign!=y.sign, unsigned_result[93:31]};
endfunction

typedef struct packed {
    bit [63:0] fraction;
} zero2one_t;
function zero2one_t zero2one_add(zero2one_t x, zero2one_t y);
    zero2one_add = x+y;
endfunction
function real_t zero2one_to_real(zero2one_t x);
    zero2one_to_real = {1'b1, 32'b0, x[63:33]};
endfunction

`endif