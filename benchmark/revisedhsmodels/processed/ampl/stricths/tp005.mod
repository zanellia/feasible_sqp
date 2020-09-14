# Model tp005
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= -1.5, <= 4;
let x_1 := 0;
var x_2 >= -3, <= 3;
let x_2 := 0;
minimize obj: sin(x_1 + x_2) + (x_1 - x_2)^2 - 1.5*x_1 + 2.5*x_2 + 1;
solve;
display obj;
# End Model
