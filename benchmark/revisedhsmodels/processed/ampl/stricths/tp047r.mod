# Model tp047r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param lbx5 := 6/5;
var x_1;
let x_1 := 2;
var x_2;
let x_2 := sqrt(2);
var x_3;
let x_3 := -1;
var x_4;
let x_4 := 2 - sqrt(2);
var x_5;
let x_5 := 1/2;
minimize obj: (x_1 - x_2)^2 + (x_2 - x_3)^3 + (x_3 - x_4)^4 + (x_4 - x_5)^4;
subject to ce_1: x_1 + x_2^2 + x_3^3 - 3 = 0;
subject to ce_2: x_2 - x_3^2 + x_4 - 1 = 0;
subject to ce_3: x_1*x_5 - 1 = 0;
solve;
display obj;
# End Model
