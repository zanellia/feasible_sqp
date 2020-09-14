# Model tp019
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 13, <= 100;
let x_1 := 20.1;
var x_2 >= 0, <= 100;
let x_2 := 5.84;
minimize obj: (x_1 - 10)^3 + (x_2 - 20)^3;
subject to ci_1: (x_1 - 5)^2 + (x_2 - 5)^2 - 100 >= 0;
subject to ci_2: (-1)*(x_2 - 5)^2 - (x_1 - 6)^2 + 82.81 >= 0;
solve;
display obj;
# End Model
