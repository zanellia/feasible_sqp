# Model tp056r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param mypi := 4*atan(1);
param c7 := 7;
param c42 := 42;
param c72 := 72;
param a := asin(sqrt(10/c42));
param b := asin(sqrt(50/c72));
param c := asin(sqrt(4/c7));
param d := asin(sqrt(2/c7));
param e := mypi/2;
param eps := 10^(-6);
var x_1;
let x_1 := 1;
var x_2;
let x_2 := 1;
var x_3;
let x_3 := 1;
var x_4;
let x_4 := a;
var x_5;
let x_5 := a;
var x_6;
let x_6 := a;
var x_7;
let x_7 := b;
minimize obj: (-1)*x_1*x_2*x_3;
subject to ce_1: x_1 - 4.2*sin(x_4)^2 = 0;
subject to ce_2: x_2 - 4.2*sin(x_5)^2 = 0;
subject to ce_3: x_3 - 4.2*sin(x_6)^2 = 0;
subject to ce_4: x_1 + 2*x_2 + 2*x_3 - 7.2*sin(x_7)^2 = 0;
solve;
display obj;
# End Model
