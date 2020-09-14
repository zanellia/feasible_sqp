# Model tp017
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= -1/2, <= 1/2;
let x_1 := -2;
var x_2 <= 1;
let x_2 := 1;
var myminfun = 100*(x_2 - x_1^2)^2 + (1 - x_1)^2;
var myabsdevnod0_0 = abs(myminfun - 1);
var myreldevnod0_0 = abs(myminfun - 1);
var myabsdevnod0_1 = abs(x_1);
var myreldevnod0_1 = abs(x_1);
var myabsdevnod0_2 = abs(x_2);
var myreldevnod0_2 = abs(x_2);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = myabsdevnod0_2;
var myreldevnod1_2 = myreldevnod0_2;
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var zmyabsdevmax = myabsdevnod2_0;
var zmyreldevmax = myreldevnod2_0;
minimize obj: myminfun;
subject to ci_1: x_2^2 - x_1 >= 0;
subject to ci_2: x_1^2 - x_2 >= 0;
solve;
display x_1;
display x_2;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
