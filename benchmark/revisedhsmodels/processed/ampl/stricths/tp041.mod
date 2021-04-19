# Model tp041
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0, <= 1;
let x_1 := 2;
var x_2 >= 0, <= 1;
let x_2 := 2;
var x_3 >= 0, <= 1;
let x_3 := 2;
var x_4 >= 0, <= 2;
let x_4 := 2;
minimize obj: 2 - x_1*x_2*x_3;
subject to ce_1: x_1 + 2*x_2 + 2*x_3 - x_4 = 0;
solve;
display obj;
# End Model