# Model tp060
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= -10, <= 10;
let x_1 := 2;
var x_2 >= -10, <= 10;
let x_2 := 2;
var x_3 >= -10, <= 10;
let x_3 := 2;
var myminfun = (x_1 - 1)^2 + (x_1 - x_2)^2 + (x_2 - x_3)^4;
var myabsdevnod0_0 = abs(myminfun - 0.03256820025506984);
var myreldevnod0_0 = abs(myminfun/0.03256820025506984 - 1);
var myabsdevnod0_1 = abs(x_1 - 1.104859019733317);
var myreldevnod0_1 = abs(x_1/1.104859019733317 - 1);
var myabsdevnod0_2 = abs(x_2 - 1.196674182288257);
var myreldevnod0_2 = abs(x_2/1.196674182288257 - 1);
var myabsdevnod0_3 = abs(x_3 - 1.535262260325326);
var myreldevnod0_3 = abs(x_3/1.535262260325326 - 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = (1/2)*(abs(myabsdevnod0_2 - myabsdevnod0_3) + (myabsdevnod0_2 + myabsdevnod0_3));
var myreldevnod1_2 = (1/2)*(abs(myreldevnod0_2 - myreldevnod0_3) + (myreldevnod0_2 + myreldevnod0_3));
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var zmyabsdevmax = myabsdevnod2_0;
var zmyreldevmax = myreldevnod2_0;
minimize obj: myminfun;
subject to ce_1: x_1*(1 + x_2^2) + x_3^4 - 4 - 3*sqrt(2) = 0;
solve;
display x_1;
display x_2;
display x_3;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
