# Model tp064
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 10^(-5);
let x_1 := 1;
var x_2 >= 10^(-5);
let x_2 := 1;
var x_3 >= 10^(-5);
let x_3 := 1;
var myminfun = 5*x_1 + 50000/x_1 + 20*x_2 + 72000/x_2 + 10*x_3 + 144000/x_3;
var myabsdevnod0_0 = abs(myminfun - 6299.84242792152);
var myreldevnod0_0 = abs(myminfun/6299.84242792152 - 1);
var myabsdevnod0_1 = abs(x_1 - 108.7347049108989);
var myreldevnod0_1 = abs(x_1/108.7347049108989 - 1);
var myabsdevnod0_2 = abs(x_2 - 85.1262127908938);
var myreldevnod0_2 = abs(x_2/85.1262127908938 - 1);
var myabsdevnod0_3 = abs(x_3 - 204.3245966126055);
var myreldevnod0_3 = abs(x_3/204.3245966126055 - 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = (1/2)*(abs(myabsdevnod0_2 - myabsdevnod0_3) + (myabsdevnod0_2 + myabsdevnod0_3));
var myreldevnod1_2 = (1/2)*(abs(myreldevnod0_2 - myreldevnod0_3) + (myreldevnod0_2 + myreldevnod0_3));
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var zmyabsdevmax = myabsdevnod2_0;
var zmyreldevmax = myreldevnod2_0;
minimize obj: myminfun;
subject to ci_1: 1 - 4/x_1 - 32/x_2 - 120/x_3 >= 0;
solve;
display x_1;
display x_2;
display x_3;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
