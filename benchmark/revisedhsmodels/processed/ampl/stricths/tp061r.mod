# Model tp061r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 0;
var x_2;
let x_2 := 0;
var x_3;
let x_3 := 0;
minimize obj: 4*x_1^2 + 2*x_2^2 + 2*x_3^2 - 33*x_1 + 16*x_2 - 24*x_3;
subject to ce_1: 3*x_1 - 2*x_2^2 - 7 = 0;
subject to ce_2: 4*x_1 - x_3^2 - 11 = 0;
solve;
display obj;
# End Model
