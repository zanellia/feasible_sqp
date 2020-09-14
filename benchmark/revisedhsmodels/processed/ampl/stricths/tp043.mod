# Model tp043
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1;
let x_1 := 0;
var x_2;
let x_2 := 0;
var x_3;
let x_3 := 0;
var x_4;
let x_4 := 0;
minimize obj: x_1^2 + x_2^2 + 2*x_3^2 + x_4^2 - 5*x_1 - 5*x_2 - 21*x_3 + 7*x_4;
subject to ci_1: 8 - x_1^2 - x_2^2 - x_3^2 - x_4^2 - x_1 + x_2 - x_3 + x_4 >= 0;
subject to ci_2: 10 - x_1^2 - 2*x_2^2 - x_3^2 - 2*x_4^2 + x_1 + x_4 >= 0;
subject to ci_3: 5 - 2*x_1^2 - x_2^2 - x_3^2 - 2*x_1 + x_2 + x_4 >= 0;
solve;
display obj;
# End Model
