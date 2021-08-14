/* verilator lint_off MULTITOP */
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
function frac_t frac_signed_div_int(frac_t x, int y);
    frac_signed_div_int = $signed(x) / y;
endfunction
`define frac_zero {`BITS'b0, `BITS'b0}

typedef struct packed {
    bit [`BITS-1:0] fraction;
} unit_t;
`define unit_max `BITS'hffff
`define unit_min `BITS'b0
function unit_t unit_tunit_add_aux(bit [`BITS:0] r);
    unit_tunit_add_aux =  r[`BITS] ? `unit_max : r[`BITS-1:0];
endfunction
function unit_t unit_add(unit_t x, unit_t y);
    unit_add = unit_tunit_add_aux($unsigned(x)+$unsigned(y));
endfunction
function unit_t unit_sub_overflow_as_min(unit_t x, unit_t y);
    unit_sub_overflow_as_min = x > y ? x-y : `unit_min;
endfunction
function unit_t unit_from_real(real x);
    unit_from_real = x * (1<<`BITS);
endfunction
/* verilator lint_off WIDTH */
function real unit_to_real(unit_t x);
    unit_to_real = ($unsigned(x)*1.0)/(1<<`BITS);
endfunction
function frac_t unit_to_frac(unit_t x);
    unit_to_frac = {`BITS'b0, x};
endfunction
function frac_t unit_mul_frac(unit_t x, frac_t y);
    unit_mul_frac = frac_mul(unit_to_frac(x), y);
endfunction
function unit_t unsigned_frac_to_unit_overflow_as_max(frac_t x);
    unsigned_frac_to_unit_overflow_as_max = (x[`BITS*2-1:`BITS] == 0) ? x[`BITS-1:0] : `unit_max;
endfunction
function unit_t unit_mul_aux(bit [`BITS*2:0] result);
    unit_mul_aux = result[`BITS*2-1:`BITS];
endfunction
function unit_t unit_mul(unit_t x, unit_t y);
    unit_mul = unit_mul_aux($unsigned(x)*$unsigned(y));
endfunction

/*
typedef struct packed {
    unit_t i;
    bit sign;
} unit_signed_t;
`define unit_signed_min {`unit_max, 1'b1}
`define unit_signed_max {`unit_max, 1'b0}
function unit_signed_t unit_signed_from_unit(unit_t i);
    unit_signed_from_unit = {i, 1'b0};
endfunction
function unit_t unit_signed_abs_unit(unit_signed_t x);
    unit_signed_abs_unit = x.i;
endfunction
function unit_signed_t unit_sub_signed(unit_t x, unit_t y);
    unit_sub_signed = x>y ? {x-y, 1'b0} : {y-x, 1'b1};
endfunction
function bit unit_signed_negative(unit_signed_t x);
    unit_signed_negative = x.sign;
endfunction
function bit unit_signed_postive(unit_signed_t x);
    unit_signed_postive = !x.sign;
endfunction
function frac_t unit_abs_to_frac(unit_signed_t x);
    unit_abs_to_frac = unit_to_frac(x.i);
endfunction
function frac_t unit_signed_to_frac(unit_signed_t x);
    unit_signed_to_frac = x.sign ? frac_opposite(unit_abs_to_frac(x)) : unit_abs_to_frac(x);
endfunction
function unit_signed_t frac_to_unit_signed_overflow_to_max_min(frac_t x);
    frac_to_unit_signed_overflow_to_max_min = (x[`BITS*2-1:`BITS] == 0) ? {x[`BITS-1:0], 1'b0} : (x[`BITS*2-1:`BITS] == ~`BITS'0) ? {-x[`BITS-1:0], 1'b1} : x[`BITS*2-1] ? `unit_signed_min : `unit_signed_max;
endfunction
function frac_t unit_signed_mul_frac(unit_signed_t x, frac_t y);
    unit_signed_mul_frac = frac_mul(unit_signed_to_frac(x), y);
endfunction
function unit_t unit_signed_scale(unit_signed_t x, unit_signed_t base, unit_t space);
    unit_signed_scale = frac_to_unit_signed_overflow_to_max_min(frac_div(frac_sub(unit_signed_to_frac(x), unit_signed_to_frac(min)), unit_to_frac(space)));
endfunction
*/

// `BITS+1 bits
typedef struct packed {
    bit sign;
    bit [`BITS-1:0] fraction;
} unit_signed_t;
`define unit_signed_min {1'b1, `BITS'b0}
`define unit_signed_max {1'b0, ~`BITS'b0}
function unit_signed_t unit_signed_from_unit(unit_t i);
    unit_signed_from_unit = {1'b0, i};
endfunction
function bit unit_signed_negative(unit_signed_t x);
    unit_signed_negative = x.sign;
endfunction
function bit unit_signed_postive(unit_signed_t x);
    unit_signed_postive = !x.sign;
endfunction
function unit_t unit_signed_abs_unit(unit_signed_t x);
    unit_signed_abs_unit = x.sign ? -x.fraction : x.fraction;
endfunction
function frac_t unit_signed_to_frac(unit_signed_t x);
    unit_signed_to_frac = $signed(x);
endfunction
function unit_signed_t frac_to_unit_signed_overflow_to_max_min(frac_t x);
    frac_to_unit_signed_overflow_to_max_min = (x[`BITS*2-1:`BITS] == 0) ? {1'b0, x[`BITS-1:0]} : (x[`BITS*2-1:`BITS] == ~`BITS'0) ? {1'b1, x[`BITS-1:0]} : x[`BITS*2-1] ? `unit_signed_min : `unit_signed_max;
endfunction
function unit_t unit_signed_scale(unit_signed_t x, unit_signed_t base, unit_t space);
    unit_signed_scale = frac_to_unit_signed_overflow_to_max_min(frac_div(frac_sub(unit_signed_to_frac(x), unit_signed_to_frac(min)), unit_to_frac(space)));
endfunction


`endif