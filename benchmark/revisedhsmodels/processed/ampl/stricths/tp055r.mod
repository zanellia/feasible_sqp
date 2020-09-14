# Model tp055r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param lbx3hs := 0;
param lbx3r := 1;
param lbx3 := lbx3hs;
var x_1 >= 0, <= 1;
let x_1 := 1;
var x_2 >= 0;
let x_2 := 2;
var x_3 >= lbx3;
let x_3 := 0;
var x_4 >= 0, <= 1;
let x_4 := 0;
var x_5 >= 0;
let x_5 := 0;
var x_6 >= 0;
let x_6 := 2;
minimize obj: x_1 + 2*x_2 + 4*x_5 + exp(x_1*x_4);
subject to ce_1: x_1 + 2*x_2 + 5*x_5 - 6 = 0;
subject to ce_2: x_1 + x_2 + x_3 - 3 = 0;
subject to ce_3: x_4 + x_5 + x_6 - 2 = 0;
subject to ce_4: x_1 + x_4 - 1 = 0;
subject to ce_5: x_2 + x_5 - 2 = 0;
subject to ce_6: x_3 + x_6 - 2 = 0;
solve;
display obj;
# End Model
