# Model tp023
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= -50, <= 50;
let x_1 := 3;
var x_2 >= -50, <= 50;
let x_2 := 1;
minimize obj: x_1^2 + x_2^2;
subject to ci_1: x_1 + x_2 - 1 >= 0;
subject to ci_2: x_1^2 + x_2^2 - 1 >= 0;
subject to ci_3: 9*x_1^2 + x_2^2 - 9 >= 0;
subject to ci_4: x_1^2 - x_2 >= 0;
subject to ci_5: x_2^2 - x_1 >= 0;
solve;
display obj;
# End Model
