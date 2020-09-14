# Model tp118
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 8, <= 21;
let x_1 := 20;
var x_2 >= 43, <= 57;
let x_2 := 55;
var x_3 >= 3, <= 16;
let x_3 := 15;
var x_4 >= 0, <= 90;
let x_4 := 20;
var x_5 >= 0, <= 120;
let x_5 := 60;
var x_6 >= 0, <= 60;
let x_6 := 20;
var x_7 >= 0, <= 90;
let x_7 := 20;
var x_8 >= 0, <= 120;
let x_8 := 60;
var x_9 >= 0, <= 60;
let x_9 := 20;
var x_10 >= 0, <= 90;
let x_10 := 20;
var x_11 >= 0, <= 120;
let x_11 := 60;
var x_12 >= 0, <= 60;
let x_12 := 20;
var x_13 >= 0, <= 90;
let x_13 := 20;
var x_14 >= 0, <= 120;
let x_14 := 60;
var x_15 >= 0, <= 60;
let x_15 := 20;
minimize obj: 2.3*x_1 + 0.0001*x_1^2 + 2.3*x_4 + 0.0001*x_4^2 + 2.3*x_7 + 0.0001*x_7^2 + 2.3*x_10 +
0.0001*x_10^2 + 2.3*x_13 + 0.0001*x_13^2 + 1.7*x_2 + 0.0001*x_2^2 + 1.7*x_5 + 0.0001*x_5^2 + 1.7*x_8 +
0.0001*x_8^2 + 1.7*x_11 + 0.0001*x_11^2 + 1.7*x_14 + 0.0001*x_14^2 + 2.2*x_3 + 0.00015*x_3^2 + 2.2*x_6 +
0.00015*x_6^2 + 2.2*x_9 + 0.00015*x_9^2 + 2.2*x_12 + 0.00015*x_12^2 + 2.2*x_15 + 0.00015*x_15^2;
subject to ci_1: 7 + x_4 - x_1 >= 0;
subject to ci_2: 6 - x_4 + x_1 >= 0;
subject to ci_3: 7 + x_7 - x_4 >= 0;
subject to ci_4: 6 - x_7 + x_4 >= 0;
subject to ci_5: 7 + x_10 - x_7 >= 0;
subject to ci_6: 6 - x_10 + x_7 >= 0;
subject to ci_7: 7 + x_13 - x_10 >= 0;
subject to ci_8: 6 - x_13 + x_10 >= 0;
subject to ci_9: 7 + x_5 - x_2 >= 0;
subject to ci_10: 7 - x_5 + x_2 >= 0;
subject to ci_11: 7 + x_8 - x_5 >= 0;
subject to ci_12: 7 - x_8 + x_5 >= 0;
subject to ci_13: 7 + x_11 - x_8 >= 0;
subject to ci_14: 7 - x_11 + x_8 >= 0;
subject to ci_15: 7 + x_14 - x_11 >= 0;
subject to ci_16: 7 - x_14 + x_11 >= 0;
subject to ci_17: 7 + x_6 - x_3 >= 0;
subject to ci_18: 6 - x_6 + x_3 >= 0;
subject to ci_19: 7 + x_9 - x_6 >= 0;
subject to ci_20: 6 - x_9 + x_6 >= 0;
subject to ci_21: 7 + x_12 - x_9 >= 0;
subject to ci_22: 6 - x_12 + x_9 >= 0;
subject to ci_23: 7 + x_15 - x_12 >= 0;
subject to ci_24: 6 - x_15 + x_12 >= 0;
subject to ci_25: x_1 + x_2 + x_3 - 60 >= 0;
subject to ci_26: x_4 + x_5 + x_6 - 50 >= 0;
subject to ci_27: x_7 + x_8 + x_9 - 70 >= 0;
subject to ci_28: x_10 + x_11 + x_12 - 85 >= 0;
subject to ci_29: x_13 + x_14 + x_15 - 100 >= 0;
solve;
display obj;
# End Model
