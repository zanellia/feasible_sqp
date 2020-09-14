# Model tp011
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 4.9;
var x_2;
let x_2 := 0.1;
minimize obj: (x_1 - 5)^2 + x_2^2 - 25;
subject to ci_1: (-1)*x_1^2 + x_2 >= 0;
solve;
display obj;
# End Model
