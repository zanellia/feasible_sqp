# Model tp096
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param b_1 := 4.97;
param b_2 := -1.88;
param b_3 := -69.08;
param b_4 := -118.02;
var x_1 >= 0, <= 0.31;
let x_1 := 0;
var x_2 >= 0, <= 0.046;
let x_2 := 0;
var x_3 >= 0, <= 0.068;
let x_3 := 0;
var x_4 >= 0, <= 0.042;
let x_4 := 0;
var x_5 >= 0, <= 0.028;
let x_5 := 0;
var x_6 >= 0, <= 0.0134;
let x_6 := 0;
var c_1 = 17.1*x_1 + 38.2*x_2 + 204.2*x_3 + 212.3*x_4 + 623.4*x_5 + 1495.5*x_6 - 169*x_1*x_3 - 3580*x_3*x_5
- 3810*x_4*x_5 - 18500*x_4*x_6 - 24300*x_5*x_6 - b_1;
var c_2 = 17.9*x_1 + 36.8*x_2 + 113.9*x_3 + 169.7*x_4 + 337.8*x_5 + 1385.2*x_6 - 139*x_1*x_3 - 2450*x_4*x_5
- 16600*x_4*x_6 - 17200*x_5*x_6 - b_2;
var c_3 = (-273)*x_2 - 70*x_4 - 819*x_5 + 26000*x_4*x_5 - b_3;
var c_4 = 159.9*x_1 - 311*x_2 + 587*x_4 + 391*x_5 + 2198*x_6 - 14000*x_1*x_6 - b_4;
var mf = 4.3*x_1 + 31.8*x_2 + 63.3*x_3 + 15.8*x_4 + 68.5*x_5 + 4.7*x_6;
var myminfun = mf;
var myabsdevnod0_0 = abs(myminfun - 0.01561952524239385);
var myreldevnod0_0 = abs(myminfun/0.01561952524239385 - 1);
var myabsdevnod0_1 = abs(x_1);
var myreldevnod0_1 = abs(x_1);
var myabsdevnod0_2 = abs(x_2);
var myreldevnod0_2 = abs(x_2);
var myabsdevnod0_3 = abs(x_3);
var myreldevnod0_3 = abs(x_3);
var myabsdevnod0_4 = abs(x_4);
var myreldevnod0_4 = abs(x_4);
var myabsdevnod0_5 = abs(x_5);
var myreldevnod0_5 = abs(x_5);
var myabsdevnod0_6 = abs(x_6 - 0.003323303243062521);
var myreldevnod0_6 = abs(x_6/0.003323303243062521 - 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = (1/2)*(abs(myabsdevnod0_2 - myabsdevnod0_3) + (myabsdevnod0_2 + myabsdevnod0_3));
var myreldevnod1_2 = (1/2)*(abs(myreldevnod0_2 - myreldevnod0_3) + (myreldevnod0_2 + myreldevnod0_3));
var myabsdevnod1_4 = (1/2)*(abs(myabsdevnod0_4 - myabsdevnod0_5) + (myabsdevnod0_4 + myabsdevnod0_5));
var myreldevnod1_4 = (1/2)*(abs(myreldevnod0_4 - myreldevnod0_5) + (myreldevnod0_4 + myreldevnod0_5));
var myabsdevnod1_6 = myabsdevnod0_6;
var myreldevnod1_6 = myreldevnod0_6;
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var myabsdevnod2_4 = (1/2)*(abs(myabsdevnod1_4 - myabsdevnod1_6) + (myabsdevnod1_4 + myabsdevnod1_6));
var myreldevnod2_4 = (1/2)*(abs(myreldevnod1_4 - myreldevnod1_6) + (myreldevnod1_4 + myreldevnod1_6));
var myabsdevnod3_0 = (1/2)*(abs(myabsdevnod2_0 - myabsdevnod2_4) + (myabsdevnod2_0 + myabsdevnod2_4));
var myreldevnod3_0 = (1/2)*(abs(myreldevnod2_0 - myreldevnod2_4) + (myreldevnod2_0 + myreldevnod2_4));
var zmyabsdevmax = myabsdevnod3_0;
var zmyreldevmax = myreldevnod3_0;
minimize obj: myminfun;
subject to ci_1: c_1 >= 0;
subject to ci_2: c_2 >= 0;
subject to ci_3: c_3 >= 0;
subject to ci_4: c_4 >= 0;
solve;
display x_1;
display x_2;
display x_3;
display x_4;
display x_5;
display x_6;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
