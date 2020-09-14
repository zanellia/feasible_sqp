# Model tp009r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param mypi := 4*atan(1);
param eps := 10^(-6);
param lbx1 := (-1)*9 + eps;
param ubx1 := 3 - eps;
var x_1 >= lbx1, <= ubx1;
let x_1 := 0;
var x_2;
let x_2 := 0;
var myminfun = sin(mypi*x_1/12)*cos(mypi*x_2/16);
var myabsdevnod0_0 = abs(myminfun + 0.5);
var myreldevnod0_0 = abs(myminfun/0.5 + 1);
var myabsdevnod0_1 = abs(x_1 + 3);
var myreldevnod0_1 = abs(x_1/3 + 1);
var myabsdevnod0_2 = abs(x_2 + 4);
var myreldevnod0_2 = abs(x_2/4 + 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = myabsdevnod0_2;
var myreldevnod1_2 = myreldevnod0_2;
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var zmyabsdevmax = myabsdevnod2_0;
var zmyreldevmax = myreldevnod2_0;
minimize obj: myminfun;
subject to ce_1: 4*x_1 - 3*x_2 = 0;
solve;
display x_1;
display x_2;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
