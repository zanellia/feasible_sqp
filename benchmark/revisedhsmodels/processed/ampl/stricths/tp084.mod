# Model tp084
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param a_1 := -24345;
param a_2 := -8720288.849;
param a_3 := 150512.5253;
param a_4 := -156.6950325;
param a_5 := 476470.3222;
param a_6 := 729482.8271;
param a_7 := -145421.402;
param a_8 := 2931.1506;
param a_9 := -40.427932;
param a_10 := 5106.192;
param a_11 := 15711.36;
param a_12 := -155011.1084;
param a_13 := 4360.53352;
param a_14 := 12.9492344;
param a_15 := 10236.884;
param a_16 := 13176.786;
param a_17 := -326669.5104;
param a_18 := 7390.68412;
param a_19 := -27.8986976;
param a_20 := 16643.076;
param a_21 := 30988.146;
var x_1 >= 0, <= 1000;
let x_1 := 2.52;
var x_2 >= 1.2, <= 2.4;
let x_2 := 2;
var x_3 >= 20, <= 60;
let x_3 := 37.5;
var x_4 >= 9, <= 9.3;
let x_4 := 9.25;
var x_5 >= 6.5, <= 7;
let x_5 := 6.8;
var t_1 = a_7*x_1 + a_8*x_1*x_2 + a_9*x_1*x_3 + a_10*x_1*x_4 + a_11*x_1*x_5;
var t_2 = a_12*x_1 + a_13*x_1*x_2 + a_14*x_1*x_3 + a_15*x_1*x_4 + a_16*x_1*x_5;
var t_3 = a_17*x_1 + a_18*x_1*x_2 + a_19*x_1*x_3 + a_20*x_1*x_4 + a_21*x_1*x_5;
minimize obj: (-1)*a_1 - a_2*x_1 - a_3*x_1*x_2 - a_4*x_1*x_3 - a_5*x_1*x_4 - a_6*x_1*x_5;
subject to ci_1: 294000 - t_1 >= 0;
subject to ci_2: t_1 >= 0;
subject to ci_3: 294000 - t_2 >= 0;
subject to ci_4: t_2 >= 0;
subject to ci_5: 277200 - t_3 >= 0;
subject to ci_6: t_3 >= 0;
solve;
display obj;
# End Model
