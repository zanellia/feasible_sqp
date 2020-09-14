# Model tp003
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 10;
var x_2 >= 0;
let x_2 := 1;
minimize obj: x_2 + (1/100000)*(x_2 - x_1)^2;
solve;
display obj;
# End Model
