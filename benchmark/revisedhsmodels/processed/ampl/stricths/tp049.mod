# Model tp049
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 10;
var x_2;
let x_2 := 7;
var x_3;
let x_3 := 2;
var x_4;
let x_4 := -3;
var x_5;
let x_5 := 0.8;
minimize obj: (x_1 - x_2)^2 + (x_3 - 1)^2 + (x_4 - 1)^4 + (x_5 - 1)^6;
subject to ce_1: x_1 + x_2 + x_3 + 4*x_4 - 7 = 0;
subject to ce_2: x_3 + 5*x_5 - 6 = 0;
solve;
display obj;
# End Model
