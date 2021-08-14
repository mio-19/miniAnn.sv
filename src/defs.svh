`ifndef _SIMPLE_ANN_DEFS_H
`define _SIMPLE_ANN_DEFS_H

`define BITS 16

`define frac_t_size `BITS*2
typedef struct packed {
    bit sign;
    bit [`BITS-2:0] i;
    bit [`BITS-1:0] frac;
} frac_t;
function frac_t frac_from_int(int i);
    frac_from_int = {i[`BITS-1:0],`BITS'b0};
endfunction
/* verilator lint_off REALCVT */
function frac_t frac_from_real(real x);
    frac_from_real = x * (1<<`BITS);
endfunction
function real frac2real(frac_t x);
    frac2real = ($signed(x)*1.0)/(1<<`BITS);
endfunction
function frac_t frac_add(frac_t x, frac_t y);
    frac_add = x+y;
endfunction
function frac_t frac_sub(frac_t x, frac_t y);
    frac_sub = x-y;
endfunction
// behaviour is undefined if it overflows
function bit [`BITS*4:0] frac_mul_aux(bit [`BITS*2-1:0] x, bit [`BITS*2-1:0] y);
    frac_mul_aux = $signed(x)*$signed(y);
endfunction
function frac_t frac_mul_aux1(bit [`BITS*4:0] result);
    frac_mul_aux1 = {result[`BITS*4], result[`BITS*3-2:`BITS]};
endfunction
function frac_t frac_mul(frac_t x, frac_t y);
    frac_mul = frac_mul_aux1(frac_mul_aux(x,y));
endfunction
function frac_t frac_div(frac_t x, frac_t y);
    frac_div = frac_negative(x)==frac_negative(y) ? frac_abs_div(x, y) : frac_opposite(frac_abs_div(x, y));
endfunction
// behaviour is undefined if it overflows
function frac_t frac_unsigned_div_helper_aux(bit [`frac_t_size*2-1:0] x);
    frac_unsigned_div_helper_aux = {1'b0, x[`frac_t_size-2:0]};
endfunction
function frac_t frac_unsigned_div_helper(bit [`frac_t_size*2-1:0] x, bit [`frac_t_size*2-1:0] y);
    frac_unsigned_div_helper = frac_unsigned_div_helper_aux($unsigned(x) / $unsigned(y));
endfunction
function frac_t frac_abs_div(frac_t x, frac_t y);
    frac_abs_div = frac_unsigned_div(frac_abs(x), frac_abs(y));
endfunction
function frac_t frac_unsigned_div(frac_t x, frac_t y);
    frac_unsigned_div = frac_unsigned_div_helper({x, `BITS'b0, `BITS'b0}, {`BITS'b0, `BITS'b0, y});
endfunction
function bit frac_bigger(frac_t x, frac_t y);
    frac_bigger = x > y;
endfunction
function bit frac_lesser(frac_t x, frac_t y);
    frac_lesser = x < y;
endfunction
function bit frac_negative(frac_t x);
    frac_negative = x[`BITS*2-1];
endfunction
function bit frac_postive(frac_t x);
    frac_postive = !x[`BITS*2-1];
endfunction
function frac_t frac_opposite(frac_t x);
    frac_opposite = -x;
endfunction
function frac_t frac_abs(frac_t x);
    frac_abs = frac_negative(x) ? frac_opposite(x) : x;
endfunction
function frac_t frac_unsigned_div_int(frac_t x, int y);
    frac_unsigned_div_int = $unsigned(x) / y;
endfunction
`define frac_zero {`BITS'b0, `BITS'b0}

typedef struct packed {
    bit [`BITS-1:0] fraction;
} zero2one_t;
`define zero2one_max `BITS'hffff
`define zero2one_min `BITS'b0
function zero2one_t zero2one_tzero2one_add_aux(bit [`BITS:0] r);
    zero2one_tzero2one_add_aux =  r[`BITS] ? `zero2one_max : r[`BITS-1:0];
endfunction
function zero2one_t zero2one_add(zero2one_t x, zero2one_t y);
    zero2one_add = zero2one_tzero2one_add_aux($unsigned(x)+$unsigned(y));
endfunction
function zero2one_t zero2one_sub_overflow_as_min(zero2one_t x, zero2one_t y);
    zero2one_sub_overflow_as_min = x > y ? x-y : `zero2one_min;
endfunction
function zero2one_t zero2one_from_real(real x);
    zero2one_from_real = x * (1<<`BITS);
endfunction
/* verilator lint_off WIDTH */
function real zero2one_to_real(zero2one_t x);
    zero2one_to_real = ($unsigned(x)*1.0)/(1<<`BITS);
endfunction
function frac_t zero2one_to_frac(zero2one_t x);
    zero2one_to_frac = {`BITS'b0, x};
endfunction
function frac_t zero2one_mul_frac(zero2one_t x, frac_t y);
    zero2one_mul_frac = frac_mul(zero2one_to_frac(x), y);
endfunction
function zero2one_t unsigned_frac_to_zero2one_overflow_as_max(frac_t x);
    unsigned_frac_to_zero2one_overflow_as_max = (x[`BITS*2-1:`BITS] == 0) ? x[`BITS-1:0] : `zero2one_max;
endfunction
function zero2one_t zero2one_mul_aux(bit [`BITS*2:0] result);
    zero2one_mul_aux = result[`BITS*2-1:`BITS];
endfunction
function zero2one_t zero2one_mul(zero2one_t x, zero2one_t y);
    zero2one_mul = zero2one_mul_aux($unsigned(x)*$unsigned(y));
endfunction

typedef struct packed {
    zero2one_t i;
    bit sign;
} zero2one_signed_t;
function zero2one_signed_t zero2one_signed_from_zero2one(zero2one_t i);
    zero2one_signed_from_zero2one = {i, 1'b0};
endfunction
function zero2one_t zero2one_signed_abs_zero2one(zero2one_signed_t x);
    zero2one_signed_abs_zero2one = x.i;
endfunction
function zero2one_signed_t zero2one_sub_signed(zero2one_t x, zero2one_t y);
    zero2one_sub_signed = x>y ? {x-y, 1'b0} : {y-x, 1'b1};
endfunction
function bit zero2one_signed_negative(zero2one_signed_t x);
    zero2one_signed_negative = x.sign;
endfunction
function bit zero2one_signed_postive(zero2one_signed_t x);
    zero2one_signed_postive = !x.sign;
endfunction
function frac_t zero2one_abs_to_frac(zero2one_signed_t x);
    zero2one_abs_to_frac = zero2one_to_frac(x.i);
endfunction
function frac_t zero2one_signed_to_frac(zero2one_signed_t x);
    zero2one_signed_to_frac = x.sign ? frac_opposite(zero2one_abs_to_frac(x)) : zero2one_abs_to_frac(x);
endfunction
function frac_t zero2one_signed_mul_frac(zero2one_signed_t x, frac_t y);
    zero2one_signed_mul_frac = frac_mul(zero2one_signed_to_frac(x), y);
endfunction

`endif