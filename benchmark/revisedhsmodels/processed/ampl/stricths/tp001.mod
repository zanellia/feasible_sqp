# Model tp001
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := -2;
var x_2 >= -3/2;
let x_2 := 1;
minimize obj: 100*(x_2 - x_1^2)^2 + (1 - x_1)^2;
solve;
display obj;
# End Model