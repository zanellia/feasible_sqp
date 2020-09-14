# Model tp059
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param c20a := -0.12694;
param c20b := 0;
param c12a := -3.4054e-4;
param c12b := -3.405e-4;
param c20 := c20a;
param c12 := c12a;
var x_1 >= 0, <= 75;
let x_1 := 90;
var x_2 >= 0, <= 65;
let x_2 := 10;
minimize obj: (-75.196) + 3.8112*x_1 + c20*x_1^2 + 0.0020567*x_1^3 - 1.0345e-5*x_1^4 + 6.8306*x_2 -
0.030234*x_1*x_2 + 1.28134e-3*x_2*x_1^2 + 2.266e-7*x_1^4*x_2 - 0.25645*x_2^2 + 0.0034604*x_2^3 -
1.3514e-5*x_2^4 + 28.106/(x_2 + 1) + 5.2375e-6*x_1^2*x_2^2 + 6.3e-8*x_1^3*x_2^2 - 7e-10*x_1^3*x_2^3 +
c12*x_1*x_2^2 + 1.6638e-6*x_1*x_2^3 + 2.8673*exp(0.0005*x_1*x_2) - 3.5256e-5*x_1^3*x_2;
subject to ci_1: x_1*x_2 - 700 >= 0;
subject to ci_2: x_2 - x_1^2/125 >= 0;
subject to ci_3: (x_2 - 50)^2 - 5*(x_1 - 55) >= 0;
solve;
display obj;
# End Model
