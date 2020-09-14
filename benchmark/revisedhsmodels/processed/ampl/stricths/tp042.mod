# Model tp042
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 1;
var x_2;
let x_2 := 1;
var x_3;
let x_3 := 1;
var x_4;
let x_4 := 1;
minimize obj: (x_1 - 1)^2 + (x_2 - 2)^2 + (x_3 - 3)^2 + (x_4 - 4)^2;
subject to ce_1: x_1 - 2 = 0;
subject to ce_2: x_3^2 + x_4^2 - 2 = 0;
solve;
display obj;
# End Model
