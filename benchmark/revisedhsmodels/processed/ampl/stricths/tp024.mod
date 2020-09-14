# Model tp024
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0;
let x_1 := 1;
var x_2 >= 0;
let x_2 := 1/2;
minimize obj: (1/(27*sqrt(3)))*((x_1 - 3)^2 - 9)*x_2^3;
subject to ci_1: x_1/sqrt(3) - x_2 >= 0;
subject to ci_2: x_1 + sqrt(3)*x_2 >= 0;
subject to ci_3: (-1)*x_1 - sqrt(3)*x_2 + 6 >= 0;
solve;
display obj;
# End Model
