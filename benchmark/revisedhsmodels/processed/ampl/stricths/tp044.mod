# Model tp044
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0;
let x_1 := 0;
var x_2 >= 0;
let x_2 := 0;
var x_3 >= 0;
let x_3 := 0;
var x_4 >= 0;
let x_4 := 0;
minimize obj: x_1 - x_2 - x_3 - x_1*x_3 + x_1*x_4 + x_2*x_3 - x_2*x_4;
subject to ci_1: 8 - x_1 - 2*x_2 >= 0;
subject to ci_2: 12 - 4*x_1 - x_2 >= 0;
subject to ci_3: 12 - 3*x_1 - 4*x_2 >= 0;
subject to ci_4: 8 - 2*x_3 - x_4 >= 0;
subject to ci_5: 8 - x_3 - 2*x_4 >= 0;
subject to ci_6: 5 - x_3 - x_4 >= 0;
solve;
display obj;
# End Model
