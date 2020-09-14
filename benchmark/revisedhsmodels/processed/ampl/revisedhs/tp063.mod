# Model tp063
# Source version 1
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
var x_1 >= 0;
let x_1 := 2;
var x_2 >= 0;
let x_2 := 2;
var x_3 >= 0;
let x_3 := 2;
var myminfun = 1000 - x_1^2 - 2*x_2^2 - x_3^2 - x_1*x_2 - x_1*x_3;
var myabsdevnod0_0 = abs(myminfun - 961.7151721300522);
var myreldevnod0_0 = abs(myminfun/961.7151721300522 - 1);
var myabsdevnod0_1 = abs(x_1 - 3.51212134187472);
var myreldevnod0_1 = abs(x_1/3.51212134187472 - 1);
var myabsdevnod0_2 = abs(x_2 - 0.2169879415152231);
var myreldevnod0_2 = abs(x_2/0.2169879415152231 - 1);
var myabsdevnod0_3 = abs(x_3 - 3.552171154827017);
var myreldevnod0_3 = abs(x_3/3.552171154827017 - 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = (1/2)*(abs(myabsdevnod0_2 - myabsdevnod0_3) + (myabsdevnod0_2 + myabsdevnod0_3));
var myreldevnod1_2 = (1/2)*(abs(myreldevnod0_2 - myreldevnod0_3) + (myreldevnod0_2 + myreldevnod0_3));
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var zmyabsdevmax = myabsdevnod2_0;
var zmyreldevmax = myreldevnod2_0;
minimize obj: myminfun;
subject to ce_1: 8*x_1 + 14*x_2 + 7*x_3 - 56 = 0;
subject to ce_2: x_1^2 + x_2^2 + x_3^2 - 25 = 0;
solve;
display x_1;
display x_2;
display x_3;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
