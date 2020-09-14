# Model tp050
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 35;
var x_2;
let x_2 := -31;
var x_3;
let x_3 := 11;
var x_4;
let x_4 := 5;
var x_5;
let x_5 := -5;
minimize obj: (x_1 - x_2)^2 + (x_2 - x_3)^2 + (x_3 - x_4)^4 + (x_4 - x_5)^2;
subject to ce_1: x_1 + 2*x_2 + 3*x_3 - 6 = 0;
subject to ce_2: x_2 + 2*x_3 + 3*x_4 - 6 = 0;
subject to ce_3: x_3 + 2*x_4 + 3*x_5 - 6 = 0;
solve;
display obj;
# End Model
