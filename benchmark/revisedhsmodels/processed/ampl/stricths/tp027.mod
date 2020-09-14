# Model tp027
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 2;
var x_2;
let x_2 := 2;
var x_3;
let x_3 := 2;
minimize obj: (1/100)*(x_1 - 1)^2 + (x_2 - x_1^2)^2;
subject to ce_1: x_1 + x_3^2 + 1 = 0;
solve;
display obj;
# End Model
