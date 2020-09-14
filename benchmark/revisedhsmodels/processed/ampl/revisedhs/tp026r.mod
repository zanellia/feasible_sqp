# Model tp026r
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param lbx3 := -0.4;
var x_1;
let x_1 := -2.6;
var x_2;
let x_2 := 2;
var x_3 >= lbx3;
let x_3 := 2;
var myminfun = (x_1 - x_2)^2 + (x_2 - x_3)^4;
var myabsdevnod0_0 = abs(myminfun);
var myreldevnod0_0 = abs(myminfun);
var myabsdevnod0_1 = abs(x_1 - 1);
var myreldevnod0_1 = abs(x_1 - 1);
var myabsdevnod0_2 = abs(x_2 - 1);
var myreldevnod0_2 = abs(x_2 - 1);
var myabsdevnod0_3 = abs(x_3 - 1);
var myreldevnod0_3 = abs(x_3 - 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = (1/2)*(abs(myabsdevnod0_2 - myabsdevnod0_3) + (myabsdevnod0_2 + myabsdevnod0_3));
var myreldevnod1_2 = (1/2)*(abs(myreldevnod0_2 - myreldevnod0_3) + (myreldevnod0_2 + myreldevnod0_3));
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var zmyabsdevmax = myabsdevnod2_0;
var zmyreldevmax = myreldevnod2_0;
minimize obj: myminfun;
subject to ce_1: (1 + x_2^2)*x_1 + x_3^4 - 3 = 0;
solve;
display x_1;
display x_2;
display x_3;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
