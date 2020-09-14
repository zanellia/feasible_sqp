# Model tp090r
# Source version 2
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param mu12_1 := 0.8603335890194;
param mu12_2 := 3.4256184594817;
param mu12_3 := 6.4372981791719;
param mu12_4 := 9.5293344053620;
param mu12_5 := 12.6452872238566;
param mu12_6 := 15.7712848748159;
param mu12_7 := 18.9024099568600;
param mu12_8 := 22.0364967279386;
param mu12_9 := 25.1724463266467;
param mu12_10 := 28.3096428544520;
param mu12_11 := 31.4477146375462;
param mu12_12 := 34.5864242152889;
param mu12_13 := 37.7256128277765;
param mu12_14 := 40.8651703304881;
param mu12_15 := 44.0050179208308;
param mu12_16 := 47.1450977367610;
param mu12_17 := 50.2853663377737;
param mu12_18 := 53.4257904773947;
param mu12_19 := 56.5663442798215;
param mu12_20 := 59.7070073053355;
param mu12_21 := 62.8477631944545;
param mu12_22 := 65.9885986984904;
param mu12_23 := 69.1295029738953;
param mu12_24 := 72.2704670603090;
param mu12_25 := 75.4114834888482;
param mu12_26 := 78.5525459842429;
param mu12_27 := 81.6936492356017;
param mu12_28 := 84.8347887180423;
param mu12_29 := 87.9759605524932;
param mu12_30 := 91.1171613944647;
param tg12_1 := tan(mu12_1);
param tg12_2 := tan(mu12_2);
param tg12_3 := tan(mu12_3);
param tg12_4 := tan(mu12_4);
param tg12_5 := tan(mu12_5);
param tg12_6 := tan(mu12_6);
param tg12_7 := tan(mu12_7);
param tg12_8 := tan(mu12_8);
param tg12_9 := tan(mu12_9);
param tg12_10 := tan(mu12_10);
param tg12_11 := tan(mu12_11);
param tg12_12 := tan(mu12_12);
param tg12_13 := tan(mu12_13);
param tg12_14 := tan(mu12_14);
param tg12_15 := tan(mu12_15);
param tg12_16 := tan(mu12_16);
param tg12_17 := tan(mu12_17);
param tg12_18 := tan(mu12_18);
param tg12_19 := tan(mu12_19);
param tg12_20 := tan(mu12_20);
param tg12_21 := tan(mu12_21);
param tg12_22 := tan(mu12_22);
param tg12_23 := tan(mu12_23);
param tg12_24 := tan(mu12_24);
param tg12_25 := tan(mu12_25);
param tg12_26 := tan(mu12_26);
param tg12_27 := tan(mu12_27);
param tg12_28 := tan(mu12_28);
param tg12_29 := tan(mu12_29);
param tg12_30 := tan(mu12_30);
param mu24_1 := (1 + mu12_1^2*(1 + tg12_1^2)) / (tg12_1 + mu12_1*(1 + tg12_1^2));
param mu24_2 := (1 + mu12_2^2*(1 + tg12_2^2)) / (tg12_2 + mu12_2*(1 + tg12_2^2));
param mu24_3 := (1 + mu12_3^2*(1 + tg12_3^2)) / (tg12_3 + mu12_3*(1 + tg12_3^2));
param mu24_4 := (1 + mu12_4^2*(1 + tg12_4^2)) / (tg12_4 + mu12_4*(1 + tg12_4^2));
param mu24_5 := (1 + mu12_5^2*(1 + tg12_5^2)) / (tg12_5 + mu12_5*(1 + tg12_5^2));
param mu24_6 := (1 + mu12_6^2*(1 + tg12_6^2)) / (tg12_6 + mu12_6*(1 + tg12_6^2));
param mu24_7 := (1 + mu12_7^2*(1 + tg12_7^2)) / (tg12_7 + mu12_7*(1 + tg12_7^2));
param mu24_8 := (1 + mu12_8^2*(1 + tg12_8^2)) / (tg12_8 + mu12_8*(1 + tg12_8^2));
param mu24_9 := (1 + mu12_9^2*(1 + tg12_9^2)) / (tg12_9 + mu12_9*(1 + tg12_9^2));
param mu24_10 := (1 + mu12_10^2*(1 + tg12_10^2)) / (tg12_10 + mu12_10*(1 + tg12_10^2));
param mu24_11 := (1 + mu12_11^2*(1 + tg12_11^2)) / (tg12_11 + mu12_11*(1 + tg12_11^2));
param mu24_12 := (1 + mu12_12^2*(1 + tg12_12^2)) / (tg12_12 + mu12_12*(1 + tg12_12^2));
param mu24_13 := (1 + mu12_13^2*(1 + tg12_13^2)) / (tg12_13 + mu12_13*(1 + tg12_13^2));
param mu24_14 := (1 + mu12_14^2*(1 + tg12_14^2)) / (tg12_14 + mu12_14*(1 + tg12_14^2));
param mu24_15 := (1 + mu12_15^2*(1 + tg12_15^2)) / (tg12_15 + mu12_15*(1 + tg12_15^2));
param mu24_16 := (1 + mu12_16^2*(1 + tg12_16^2)) / (tg12_16 + mu12_16*(1 + tg12_16^2));
param mu24_17 := (1 + mu12_17^2*(1 + tg12_17^2)) / (tg12_17 + mu12_17*(1 + tg12_17^2));
param mu24_18 := (1 + mu12_18^2*(1 + tg12_18^2)) / (tg12_18 + mu12_18*(1 + tg12_18^2));
param mu24_19 := (1 + mu12_19^2*(1 + tg12_19^2)) / (tg12_19 + mu12_19*(1 + tg12_19^2));
param mu24_20 := (1 + mu12_20^2*(1 + tg12_20^2)) / (tg12_20 + mu12_20*(1 + tg12_20^2));
param mu24_21 := (1 + mu12_21^2*(1 + tg12_21^2)) / (tg12_21 + mu12_21*(1 + tg12_21^2));
param mu24_22 := (1 + mu12_22^2*(1 + tg12_22^2)) / (tg12_22 + mu12_22*(1 + tg12_22^2));
param mu24_23 := (1 + mu12_23^2*(1 + tg12_23^2)) / (tg12_23 + mu12_23*(1 + tg12_23^2));
param mu24_24 := (1 + mu12_24^2*(1 + tg12_24^2)) / (tg12_24 + mu12_24*(1 + tg12_24^2));
param mu24_25 := (1 + mu12_25^2*(1 + tg12_25^2)) / (tg12_25 + mu12_25*(1 + tg12_25^2));
param mu24_26 := (1 + mu12_26^2*(1 + tg12_26^2)) / (tg12_26 + mu12_26*(1 + tg12_26^2));
param mu24_27 := (1 + mu12_27^2*(1 + tg12_27^2)) / (tg12_27 + mu12_27*(1 + tg12_27^2));
param mu24_28 := (1 + mu12_28^2*(1 + tg12_28^2)) / (tg12_28 + mu12_28*(1 + tg12_28^2));
param mu24_29 := (1 + mu12_29^2*(1 + tg12_29^2)) / (tg12_29 + mu12_29*(1 + tg12_29^2));
param mu24_30 := (1 + mu12_30^2*(1 + tg12_30^2)) / (tg12_30 + mu12_30*(1 + tg12_30^2));
param tg24_1 := tan(mu24_1);
param tg24_2 := tan(mu24_2);
param tg24_3 := tan(mu24_3);
param tg24_4 := tan(mu24_4);
param tg24_5 := tan(mu24_5);
param tg24_6 := tan(mu24_6);
param tg24_7 := tan(mu24_7);
param tg24_8 := tan(mu24_8);
param tg24_9 := tan(mu24_9);
param tg24_10 := tan(mu24_10);
param tg24_11 := tan(mu24_11);
param tg24_12 := tan(mu24_12);
param tg24_13 := tan(mu24_13);
param tg24_14 := tan(mu24_14);
param tg24_15 := tan(mu24_15);
param tg24_16 := tan(mu24_16);
param tg24_17 := tan(mu24_17);
param tg24_18 := tan(mu24_18);
param tg24_19 := tan(mu24_19);
param tg24_20 := tan(mu24_20);
param tg24_21 := tan(mu24_21);
param tg24_22 := tan(mu24_22);
param tg24_23 := tan(mu24_23);
param tg24_24 := tan(mu24_24);
param tg24_25 := tan(mu24_25);
param tg24_26 := tan(mu24_26);
param tg24_27 := tan(mu24_27);
param tg24_28 := tan(mu24_28);
param tg24_29 := tan(mu24_29);
param tg24_30 := tan(mu24_30);
param mu48_1 := (1 + mu24_1^2*(1 + tg24_1^2)) / (tg24_1 + mu24_1*(1 + tg24_1^2));
param mu48_2 := (1 + mu24_2^2*(1 + tg24_2^2)) / (tg24_2 + mu24_2*(1 + tg24_2^2));
param mu48_3 := (1 + mu24_3^2*(1 + tg24_3^2)) / (tg24_3 + mu24_3*(1 + tg24_3^2));
param mu48_4 := (1 + mu24_4^2*(1 + tg24_4^2)) / (tg24_4 + mu24_4*(1 + tg24_4^2));
param mu48_5 := (1 + mu24_5^2*(1 + tg24_5^2)) / (tg24_5 + mu24_5*(1 + tg24_5^2));
param mu48_6 := (1 + mu24_6^2*(1 + tg24_6^2)) / (tg24_6 + mu24_6*(1 + tg24_6^2));
param mu48_7 := (1 + mu24_7^2*(1 + tg24_7^2)) / (tg24_7 + mu24_7*(1 + tg24_7^2));
param mu48_8 := (1 + mu24_8^2*(1 + tg24_8^2)) / (tg24_8 + mu24_8*(1 + tg24_8^2));
param mu48_9 := (1 + mu24_9^2*(1 + tg24_9^2)) / (tg24_9 + mu24_9*(1 + tg24_9^2));
param mu48_10 := (1 + mu24_10^2*(1 + tg24_10^2)) / (tg24_10 + mu24_10*(1 + tg24_10^2));
param mu48_11 := (1 + mu24_11^2*(1 + tg24_11^2)) / (tg24_11 + mu24_11*(1 + tg24_11^2));
param mu48_12 := (1 + mu24_12^2*(1 + tg24_12^2)) / (tg24_12 + mu24_12*(1 + tg24_12^2));
param mu48_13 := (1 + mu24_13^2*(1 + tg24_13^2)) / (tg24_13 + mu24_13*(1 + tg24_13^2));
param mu48_14 := (1 + mu24_14^2*(1 + tg24_14^2)) / (tg24_14 + mu24_14*(1 + tg24_14^2));
param mu48_15 := (1 + mu24_15^2*(1 + tg24_15^2)) / (tg24_15 + mu24_15*(1 + tg24_15^2));
param mu48_16 := (1 + mu24_16^2*(1 + tg24_16^2)) / (tg24_16 + mu24_16*(1 + tg24_16^2));
param mu48_17 := (1 + mu24_17^2*(1 + tg24_17^2)) / (tg24_17 + mu24_17*(1 + tg24_17^2));
param mu48_18 := (1 + mu24_18^2*(1 + tg24_18^2)) / (tg24_18 + mu24_18*(1 + tg24_18^2));
param mu48_19 := (1 + mu24_19^2*(1 + tg24_19^2)) / (tg24_19 + mu24_19*(1 + tg24_19^2));
param mu48_20 := (1 + mu24_20^2*(1 + tg24_20^2)) / (tg24_20 + mu24_20*(1 + tg24_20^2));
param mu48_21 := (1 + mu24_21^2*(1 + tg24_21^2)) / (tg24_21 + mu24_21*(1 + tg24_21^2));
param mu48_22 := (1 + mu24_22^2*(1 + tg24_22^2)) / (tg24_22 + mu24_22*(1 + tg24_22^2));
param mu48_23 := (1 + mu24_23^2*(1 + tg24_23^2)) / (tg24_23 + mu24_23*(1 + tg24_23^2));
param mu48_24 := (1 + mu24_24^2*(1 + tg24_24^2)) / (tg24_24 + mu24_24*(1 + tg24_24^2));
param mu48_25 := (1 + mu24_25^2*(1 + tg24_25^2)) / (tg24_25 + mu24_25*(1 + tg24_25^2));
param mu48_26 := (1 + mu24_26^2*(1 + tg24_26^2)) / (tg24_26 + mu24_26*(1 + tg24_26^2));
param mu48_27 := (1 + mu24_27^2*(1 + tg24_27^2)) / (tg24_27 + mu24_27*(1 + tg24_27^2));
param mu48_28 := (1 + mu24_28^2*(1 + tg24_28^2)) / (tg24_28 + mu24_28*(1 + tg24_28^2));
param mu48_29 := (1 + mu24_29^2*(1 + tg24_29^2)) / (tg24_29 + mu24_29*(1 + tg24_29^2));
param mu48_30 := (1 + mu24_30^2*(1 + tg24_30^2)) / (tg24_30 + mu24_30*(1 + tg24_30^2));
param mu_1 := mu48_1;
param mu_2 := mu48_2;
param mu_3 := mu48_3;
param mu_4 := mu48_4;
param mu_5 := mu48_5;
param mu_6 := mu48_6;
param mu_7 := mu48_7;
param mu_8 := mu48_8;
param mu_9 := mu48_9;
param mu_10 := mu48_10;
param mu_11 := mu48_11;
param mu_12 := mu48_12;
param mu_13 := mu48_13;
param mu_14 := mu48_14;
param mu_15 := mu48_15;
param mu_16 := mu48_16;
param mu_17 := mu48_17;
param mu_18 := mu48_18;
param mu_19 := mu48_19;
param mu_20 := mu48_20;
param mu_21 := mu48_21;
param mu_22 := mu48_22;
param mu_23 := mu48_23;
param mu_24 := mu48_24;
param mu_25 := mu48_25;
param mu_26 := mu48_26;
param mu_27 := mu48_27;
param mu_28 := mu48_28;
param mu_29 := mu48_29;
param mu_30 := mu48_30;
param isign_1 := 1;
param isign_2 := (-1)*isign_1;
param isign_3 := (-1)*isign_2;
param isign_4 := (-1)*isign_3;
param isign_5 := (-1)*isign_4;
param isign_6 := (-1)*isign_5;
param isign_7 := (-1)*isign_6;
param isign_8 := (-1)*isign_7;
param isign_9 := (-1)*isign_8;
param isign_10 := (-1)*isign_9;
param isign_11 := (-1)*isign_10;
param isign_12 := (-1)*isign_11;
param isign_13 := (-1)*isign_12;
param isign_14 := (-1)*isign_13;
param isign_15 := (-1)*isign_14;
param isign_16 := (-1)*isign_15;
param isign_17 := (-1)*isign_16;
param isign_18 := (-1)*isign_17;
param isign_19 := (-1)*isign_18;
param isign_20 := (-1)*isign_19;
param isign_21 := (-1)*isign_20;
param isign_22 := (-1)*isign_21;
param isign_23 := (-1)*isign_22;
param isign_24 := (-1)*isign_23;
param isign_25 := (-1)*isign_24;
param isign_26 := (-1)*isign_25;
param isign_27 := (-1)*isign_26;
param isign_28 := (-1)*isign_27;
param isign_29 := (-1)*isign_28;
param isign_30 := (-1)*isign_29;
param snmu_1 := isign_1*sqrt(1/(1 + mu_1^2));
param snmu_2 := isign_2*sqrt(1/(1 + mu_2^2));
param snmu_3 := isign_3*sqrt(1/(1 + mu_3^2));
param snmu_4 := isign_4*sqrt(1/(1 + mu_4^2));
param snmu_5 := isign_5*sqrt(1/(1 + mu_5^2));
param snmu_6 := isign_6*sqrt(1/(1 + mu_6^2));
param snmu_7 := isign_7*sqrt(1/(1 + mu_7^2));
param snmu_8 := isign_8*sqrt(1/(1 + mu_8^2));
param snmu_9 := isign_9*sqrt(1/(1 + mu_9^2));
param snmu_10 := isign_10*sqrt(1/(1 + mu_10^2));
param snmu_11 := isign_11*sqrt(1/(1 + mu_11^2));
param snmu_12 := isign_12*sqrt(1/(1 + mu_12^2));
param snmu_13 := isign_13*sqrt(1/(1 + mu_13^2));
param snmu_14 := isign_14*sqrt(1/(1 + mu_14^2));
param snmu_15 := isign_15*sqrt(1/(1 + mu_15^2));
param snmu_16 := isign_16*sqrt(1/(1 + mu_16^2));
param snmu_17 := isign_17*sqrt(1/(1 + mu_17^2));
param snmu_18 := isign_18*sqrt(1/(1 + mu_18^2));
param snmu_19 := isign_19*sqrt(1/(1 + mu_19^2));
param snmu_20 := isign_20*sqrt(1/(1 + mu_20^2));
param snmu_21 := isign_21*sqrt(1/(1 + mu_21^2));
param snmu_22 := isign_22*sqrt(1/(1 + mu_22^2));
param snmu_23 := isign_23*sqrt(1/(1 + mu_23^2));
param snmu_24 := isign_24*sqrt(1/(1 + mu_24^2));
param snmu_25 := isign_25*sqrt(1/(1 + mu_25^2));
param snmu_26 := isign_26*sqrt(1/(1 + mu_26^2));
param snmu_27 := isign_27*sqrt(1/(1 + mu_27^2));
param snmu_28 := isign_28*sqrt(1/(1 + mu_28^2));
param snmu_29 := isign_29*sqrt(1/(1 + mu_29^2));
param snmu_30 := isign_30*sqrt(1/(1 + mu_30^2));
param csmu_1 := isign_1*sqrt(mu_1^2/(1 + mu_1^2));
param csmu_2 := isign_2*sqrt(mu_2^2/(1 + mu_2^2));
param csmu_3 := isign_3*sqrt(mu_3^2/(1 + mu_3^2));
param csmu_4 := isign_4*sqrt(mu_4^2/(1 + mu_4^2));
param csmu_5 := isign_5*sqrt(mu_5^2/(1 + mu_5^2));
param csmu_6 := isign_6*sqrt(mu_6^2/(1 + mu_6^2));
param csmu_7 := isign_7*sqrt(mu_7^2/(1 + mu_7^2));
param csmu_8 := isign_8*sqrt(mu_8^2/(1 + mu_8^2));
param csmu_9 := isign_9*sqrt(mu_9^2/(1 + mu_9^2));
param csmu_10 := isign_10*sqrt(mu_10^2/(1 + mu_10^2));
param csmu_11 := isign_11*sqrt(mu_11^2/(1 + mu_11^2));
param csmu_12 := isign_12*sqrt(mu_12^2/(1 + mu_12^2));
param csmu_13 := isign_13*sqrt(mu_13^2/(1 + mu_13^2));
param csmu_14 := isign_14*sqrt(mu_14^2/(1 + mu_14^2));
param csmu_15 := isign_15*sqrt(mu_15^2/(1 + mu_15^2));
param csmu_16 := isign_16*sqrt(mu_16^2/(1 + mu_16^2));
param csmu_17 := isign_17*sqrt(mu_17^2/(1 + mu_17^2));
param csmu_18 := isign_18*sqrt(mu_18^2/(1 + mu_18^2));
param csmu_19 := isign_19*sqrt(mu_19^2/(1 + mu_19^2));
param csmu_20 := isign_20*sqrt(mu_20^2/(1 + mu_20^2));
param csmu_21 := isign_21*sqrt(mu_21^2/(1 + mu_21^2));
param csmu_22 := isign_22*sqrt(mu_22^2/(1 + mu_22^2));
param csmu_23 := isign_23*sqrt(mu_23^2/(1 + mu_23^2));
param csmu_24 := isign_24*sqrt(mu_24^2/(1 + mu_24^2));
param csmu_25 := isign_25*sqrt(mu_25^2/(1 + mu_25^2));
param csmu_26 := isign_26*sqrt(mu_26^2/(1 + mu_26^2));
param csmu_27 := isign_27*sqrt(mu_27^2/(1 + mu_27^2));
param csmu_28 := isign_28*sqrt(mu_28^2/(1 + mu_28^2));
param csmu_29 := isign_29*sqrt(mu_29^2/(1 + mu_29^2));
param csmu_30 := isign_30*sqrt(mu_30^2/(1 + mu_30^2));
param snmuxcsmu_1 := mu_1/(1 + mu_1^2);
param snmuxcsmu_2 := mu_2/(1 + mu_2^2);
param snmuxcsmu_3 := mu_3/(1 + mu_3^2);
param snmuxcsmu_4 := mu_4/(1 + mu_4^2);
param snmuxcsmu_5 := mu_5/(1 + mu_5^2);
param snmuxcsmu_6 := mu_6/(1 + mu_6^2);
param snmuxcsmu_7 := mu_7/(1 + mu_7^2);
param snmuxcsmu_8 := mu_8/(1 + mu_8^2);
param snmuxcsmu_9 := mu_9/(1 + mu_9^2);
param snmuxcsmu_10 := mu_10/(1 + mu_10^2);
param snmuxcsmu_11 := mu_11/(1 + mu_11^2);
param snmuxcsmu_12 := mu_12/(1 + mu_12^2);
param snmuxcsmu_13 := mu_13/(1 + mu_13^2);
param snmuxcsmu_14 := mu_14/(1 + mu_14^2);
param snmuxcsmu_15 := mu_15/(1 + mu_15^2);
param snmuxcsmu_16 := mu_16/(1 + mu_16^2);
param snmuxcsmu_17 := mu_17/(1 + mu_17^2);
param snmuxcsmu_18 := mu_18/(1 + mu_18^2);
param snmuxcsmu_19 := mu_19/(1 + mu_19^2);
param snmuxcsmu_20 := mu_20/(1 + mu_20^2);
param snmuxcsmu_21 := mu_21/(1 + mu_21^2);
param snmuxcsmu_22 := mu_22/(1 + mu_22^2);
param snmuxcsmu_23 := mu_23/(1 + mu_23^2);
param snmuxcsmu_24 := mu_24/(1 + mu_24^2);
param snmuxcsmu_25 := mu_25/(1 + mu_25^2);
param snmuxcsmu_26 := mu_26/(1 + mu_26^2);
param snmuxcsmu_27 := mu_27/(1 + mu_27^2);
param snmuxcsmu_28 := mu_28/(1 + mu_28^2);
param snmuxcsmu_29 := mu_29/(1 + mu_29^2);
param snmuxcsmu_30 := mu_30/(1 + mu_30^2);
param aux2_1 := snmuxcsmu_1/(2*mu_1) + 1/2;
param aux2_2 := snmuxcsmu_2/(2*mu_2) + 1/2;
param aux2_3 := snmuxcsmu_3/(2*mu_3) + 1/2;
param aux2_4 := snmuxcsmu_4/(2*mu_4) + 1/2;
param aux2_5 := snmuxcsmu_5/(2*mu_5) + 1/2;
param aux2_6 := snmuxcsmu_6/(2*mu_6) + 1/2;
param aux2_7 := snmuxcsmu_7/(2*mu_7) + 1/2;
param aux2_8 := snmuxcsmu_8/(2*mu_8) + 1/2;
param aux2_9 := snmuxcsmu_9/(2*mu_9) + 1/2;
param aux2_10 := snmuxcsmu_10/(2*mu_10) + 1/2;
param aux2_11 := snmuxcsmu_11/(2*mu_11) + 1/2;
param aux2_12 := snmuxcsmu_12/(2*mu_12) + 1/2;
param aux2_13 := snmuxcsmu_13/(2*mu_13) + 1/2;
param aux2_14 := snmuxcsmu_14/(2*mu_14) + 1/2;
param aux2_15 := snmuxcsmu_15/(2*mu_15) + 1/2;
param aux2_16 := snmuxcsmu_16/(2*mu_16) + 1/2;
param aux2_17 := snmuxcsmu_17/(2*mu_17) + 1/2;
param aux2_18 := snmuxcsmu_18/(2*mu_18) + 1/2;
param aux2_19 := snmuxcsmu_19/(2*mu_19) + 1/2;
param aux2_20 := snmuxcsmu_20/(2*mu_20) + 1/2;
param aux2_21 := snmuxcsmu_21/(2*mu_21) + 1/2;
param aux2_22 := snmuxcsmu_22/(2*mu_22) + 1/2;
param aux2_23 := snmuxcsmu_23/(2*mu_23) + 1/2;
param aux2_24 := snmuxcsmu_24/(2*mu_24) + 1/2;
param aux2_25 := snmuxcsmu_25/(2*mu_25) + 1/2;
param aux2_26 := snmuxcsmu_26/(2*mu_26) + 1/2;
param aux2_27 := snmuxcsmu_27/(2*mu_27) + 1/2;
param aux2_28 := snmuxcsmu_28/(2*mu_28) + 1/2;
param aux2_29 := snmuxcsmu_29/(2*mu_29) + 1/2;
param aux2_30 := snmuxcsmu_30/(2*mu_30) + 1/2;
param aux4_1 := (-2)*snmu_1/mu_1 + 2*csmu_1;
param aux4_2 := (-2)*snmu_2/mu_2 + 2*csmu_2;
param aux4_3 := (-2)*snmu_3/mu_3 + 2*csmu_3;
param aux4_4 := (-2)*snmu_4/mu_4 + 2*csmu_4;
param aux4_5 := (-2)*snmu_5/mu_5 + 2*csmu_5;
param aux4_6 := (-2)*snmu_6/mu_6 + 2*csmu_6;
param aux4_7 := (-2)*snmu_7/mu_7 + 2*csmu_7;
param aux4_8 := (-2)*snmu_8/mu_8 + 2*csmu_8;
param aux4_9 := (-2)*snmu_9/mu_9 + 2*csmu_9;
param aux4_10 := (-2)*snmu_10/mu_10 + 2*csmu_10;
param aux4_11 := (-2)*snmu_11/mu_11 + 2*csmu_11;
param aux4_12 := (-2)*snmu_12/mu_12 + 2*csmu_12;
param aux4_13 := (-2)*snmu_13/mu_13 + 2*csmu_13;
param aux4_14 := (-2)*snmu_14/mu_14 + 2*csmu_14;
param aux4_15 := (-2)*snmu_15/mu_15 + 2*csmu_15;
param aux4_16 := (-2)*snmu_16/mu_16 + 2*csmu_16;
param aux4_17 := (-2)*snmu_17/mu_17 + 2*csmu_17;
param aux4_18 := (-2)*snmu_18/mu_18 + 2*csmu_18;
param aux4_19 := (-2)*snmu_19/mu_19 + 2*csmu_19;
param aux4_20 := (-2)*snmu_20/mu_20 + 2*csmu_20;
param aux4_21 := (-2)*snmu_21/mu_21 + 2*csmu_21;
param aux4_22 := (-2)*snmu_22/mu_22 + 2*csmu_22;
param aux4_23 := (-2)*snmu_23/mu_23 + 2*csmu_23;
param aux4_24 := (-2)*snmu_24/mu_24 + 2*csmu_24;
param aux4_25 := (-2)*snmu_25/mu_25 + 2*csmu_25;
param aux4_26 := (-2)*snmu_26/mu_26 + 2*csmu_26;
param aux4_27 := (-2)*snmu_27/mu_27 + 2*csmu_27;
param aux4_28 := (-2)*snmu_28/mu_28 + 2*csmu_28;
param aux4_29 := (-2)*snmu_29/mu_29 + 2*csmu_29;
param aux4_30 := (-2)*snmu_30/mu_30 + 2*csmu_30;
param A_1 := 2*snmu_1/(mu_1 + snmuxcsmu_1);
param A_2 := 2*snmu_2/(mu_2 + snmuxcsmu_2);
param A_3 := 2*snmu_3/(mu_3 + snmuxcsmu_3);
param A_4 := 2*snmu_4/(mu_4 + snmuxcsmu_4);
param A_5 := 2*snmu_5/(mu_5 + snmuxcsmu_5);
param A_6 := 2*snmu_6/(mu_6 + snmuxcsmu_6);
param A_7 := 2*snmu_7/(mu_7 + snmuxcsmu_7);
param A_8 := 2*snmu_8/(mu_8 + snmuxcsmu_8);
param A_9 := 2*snmu_9/(mu_9 + snmuxcsmu_9);
param A_10 := 2*snmu_10/(mu_10 + snmuxcsmu_10);
param A_11 := 2*snmu_11/(mu_11 + snmuxcsmu_11);
param A_12 := 2*snmu_12/(mu_12 + snmuxcsmu_12);
param A_13 := 2*snmu_13/(mu_13 + snmuxcsmu_13);
param A_14 := 2*snmu_14/(mu_14 + snmuxcsmu_14);
param A_15 := 2*snmu_15/(mu_15 + snmuxcsmu_15);
param A_16 := 2*snmu_16/(mu_16 + snmuxcsmu_16);
param A_17 := 2*snmu_17/(mu_17 + snmuxcsmu_17);
param A_18 := 2*snmu_18/(mu_18 + snmuxcsmu_18);
param A_19 := 2*snmu_19/(mu_19 + snmuxcsmu_19);
param A_20 := 2*snmu_20/(mu_20 + snmuxcsmu_20);
param A_21 := 2*snmu_21/(mu_21 + snmuxcsmu_21);
param A_22 := 2*snmu_22/(mu_22 + snmuxcsmu_22);
param A_23 := 2*snmu_23/(mu_23 + snmuxcsmu_23);
param A_24 := 2*snmu_24/(mu_24 + snmuxcsmu_24);
param A_25 := 2*snmu_25/(mu_25 + snmuxcsmu_25);
param A_26 := 2*snmu_26/(mu_26 + snmuxcsmu_26);
param A_27 := 2*snmu_27/(mu_27 + snmuxcsmu_27);
param A_28 := 2*snmu_28/(mu_28 + snmuxcsmu_28);
param A_29 := 2*snmu_29/(mu_29 + snmuxcsmu_29);
param A_30 := 2*snmu_30/(mu_30 + snmuxcsmu_30);
param hsum_0 := 2/15;
param mfcorrhs := 0;
var x_1 >= 1/10;
let x_1 := 1/2;
var x_2 <= 0;
let x_2 := -1/2;
var x_3 >= 1/10;
let x_3 := 1/2;
var x_4 <= -1/10;
let x_4 := -1/2;
var emx_1_1 = exp(-mu_1^2*x_1^2);
var emx_1_2 = exp(-mu_2^2*x_1^2);
var emx_1_3 = exp(-mu_3^2*x_1^2);
var emx_1_4 = exp(-mu_4^2*x_1^2);
var emx_1_5 = exp(-mu_5^2*x_1^2);
var emx_1_6 = exp(-mu_6^2*x_1^2);
var emx_1_7 = exp(-mu_7^2*x_1^2);
var emx_1_8 = exp(-mu_8^2*x_1^2);
var emx_1_9 = exp(-mu_9^2*x_1^2);
var emx_1_10 = exp(-mu_10^2*x_1^2);
var emx_1_11 = exp(-mu_11^2*x_1^2);
var emx_1_12 = exp(-mu_12^2*x_1^2);
var emx_1_13 = exp(-mu_13^2*x_1^2);
var emx_1_14 = exp(-mu_14^2*x_1^2);
var emx_1_15 = exp(-mu_15^2*x_1^2);
var emx_1_16 = exp(-mu_16^2*x_1^2);
var emx_1_17 = exp(-mu_17^2*x_1^2);
var emx_1_18 = exp(-mu_18^2*x_1^2);
var emx_1_19 = exp(-mu_19^2*x_1^2);
var emx_1_20 = exp(-mu_20^2*x_1^2);
var emx_1_21 = exp(-mu_21^2*x_1^2);
var emx_1_22 = exp(-mu_22^2*x_1^2);
var emx_1_23 = exp(-mu_23^2*x_1^2);
var emx_1_24 = exp(-mu_24^2*x_1^2);
var emx_1_25 = exp(-mu_25^2*x_1^2);
var emx_1_26 = exp(-mu_26^2*x_1^2);
var emx_1_27 = exp(-mu_27^2*x_1^2);
var emx_1_28 = exp(-mu_28^2*x_1^2);
var emx_1_29 = exp(-mu_29^2*x_1^2);
var emx_1_30 = exp(-mu_30^2*x_1^2);
var emx_2_1 = exp(-mu_1^2*x_2^2);
var emx_2_2 = exp(-mu_2^2*x_2^2);
var emx_2_3 = exp(-mu_3^2*x_2^2);
var emx_2_4 = exp(-mu_4^2*x_2^2);
var emx_2_5 = exp(-mu_5^2*x_2^2);
var emx_2_6 = exp(-mu_6^2*x_2^2);
var emx_2_7 = exp(-mu_7^2*x_2^2);
var emx_2_8 = exp(-mu_8^2*x_2^2);
var emx_2_9 = exp(-mu_9^2*x_2^2);
var emx_2_10 = exp(-mu_10^2*x_2^2);
var emx_2_11 = exp(-mu_11^2*x_2^2);
var emx_2_12 = exp(-mu_12^2*x_2^2);
var emx_2_13 = exp(-mu_13^2*x_2^2);
var emx_2_14 = exp(-mu_14^2*x_2^2);
var emx_2_15 = exp(-mu_15^2*x_2^2);
var emx_2_16 = exp(-mu_16^2*x_2^2);
var emx_2_17 = exp(-mu_17^2*x_2^2);
var emx_2_18 = exp(-mu_18^2*x_2^2);
var emx_2_19 = exp(-mu_19^2*x_2^2);
var emx_2_20 = exp(-mu_20^2*x_2^2);
var emx_2_21 = exp(-mu_21^2*x_2^2);
var emx_2_22 = exp(-mu_22^2*x_2^2);
var emx_2_23 = exp(-mu_23^2*x_2^2);
var emx_2_24 = exp(-mu_24^2*x_2^2);
var emx_2_25 = exp(-mu_25^2*x_2^2);
var emx_2_26 = exp(-mu_26^2*x_2^2);
var emx_2_27 = exp(-mu_27^2*x_2^2);
var emx_2_28 = exp(-mu_28^2*x_2^2);
var emx_2_29 = exp(-mu_29^2*x_2^2);
var emx_2_30 = exp(-mu_30^2*x_2^2);
var emx_3_1 = exp(-mu_1^2*x_3^2);
var emx_3_2 = exp(-mu_2^2*x_3^2);
var emx_3_3 = exp(-mu_3^2*x_3^2);
var emx_3_4 = exp(-mu_4^2*x_3^2);
var emx_3_5 = exp(-mu_5^2*x_3^2);
var emx_3_6 = exp(-mu_6^2*x_3^2);
var emx_3_7 = exp(-mu_7^2*x_3^2);
var emx_3_8 = exp(-mu_8^2*x_3^2);
var emx_3_9 = exp(-mu_9^2*x_3^2);
var emx_3_10 = exp(-mu_10^2*x_3^2);
var emx_3_11 = exp(-mu_11^2*x_3^2);
var emx_3_12 = exp(-mu_12^2*x_3^2);
var emx_3_13 = exp(-mu_13^2*x_3^2);
var emx_3_14 = exp(-mu_14^2*x_3^2);
var emx_3_15 = exp(-mu_15^2*x_3^2);
var emx_3_16 = exp(-mu_16^2*x_3^2);
var emx_3_17 = exp(-mu_17^2*x_3^2);
var emx_3_18 = exp(-mu_18^2*x_3^2);
var emx_3_19 = exp(-mu_19^2*x_3^2);
var emx_3_20 = exp(-mu_20^2*x_3^2);
var emx_3_21 = exp(-mu_21^2*x_3^2);
var emx_3_22 = exp(-mu_22^2*x_3^2);
var emx_3_23 = exp(-mu_23^2*x_3^2);
var emx_3_24 = exp(-mu_24^2*x_3^2);
var emx_3_25 = exp(-mu_25^2*x_3^2);
var emx_3_26 = exp(-mu_26^2*x_3^2);
var emx_3_27 = exp(-mu_27^2*x_3^2);
var emx_3_28 = exp(-mu_28^2*x_3^2);
var emx_3_29 = exp(-mu_29^2*x_3^2);
var emx_3_30 = exp(-mu_30^2*x_3^2);
var emx_4_1 = exp(-mu_1^2*x_4^2);
var emx_4_2 = exp(-mu_2^2*x_4^2);
var emx_4_3 = exp(-mu_3^2*x_4^2);
var emx_4_4 = exp(-mu_4^2*x_4^2);
var emx_4_5 = exp(-mu_5^2*x_4^2);
var emx_4_6 = exp(-mu_6^2*x_4^2);
var emx_4_7 = exp(-mu_7^2*x_4^2);
var emx_4_8 = exp(-mu_8^2*x_4^2);
var emx_4_9 = exp(-mu_9^2*x_4^2);
var emx_4_10 = exp(-mu_10^2*x_4^2);
var emx_4_11 = exp(-mu_11^2*x_4^2);
var emx_4_12 = exp(-mu_12^2*x_4^2);
var emx_4_13 = exp(-mu_13^2*x_4^2);
var emx_4_14 = exp(-mu_14^2*x_4^2);
var emx_4_15 = exp(-mu_15^2*x_4^2);
var emx_4_16 = exp(-mu_16^2*x_4^2);
var emx_4_17 = exp(-mu_17^2*x_4^2);
var emx_4_18 = exp(-mu_18^2*x_4^2);
var emx_4_19 = exp(-mu_19^2*x_4^2);
var emx_4_20 = exp(-mu_20^2*x_4^2);
var emx_4_21 = exp(-mu_21^2*x_4^2);
var emx_4_22 = exp(-mu_22^2*x_4^2);
var emx_4_23 = exp(-mu_23^2*x_4^2);
var emx_4_24 = exp(-mu_24^2*x_4^2);
var emx_4_25 = exp(-mu_25^2*x_4^2);
var emx_4_26 = exp(-mu_26^2*x_4^2);
var emx_4_27 = exp(-mu_27^2*x_4^2);
var emx_4_28 = exp(-mu_28^2*x_4^2);
var emx_4_29 = exp(-mu_29^2*x_4^2);
var emx_4_30 = exp(-mu_30^2*x_4^2);
var rhoaux_4_1 = 1*emx_1_1*emx_2_1*emx_3_1*emx_4_1 - 2*emx_2_1*emx_3_1*emx_4_1 + 2*emx_3_1*emx_4_1 -
2*emx_4_1 + 1;
var rhoaux_4_2 = 1*emx_1_2*emx_2_2*emx_3_2*emx_4_2 - 2*emx_2_2*emx_3_2*emx_4_2 + 2*emx_3_2*emx_4_2 -
2*emx_4_2 + 1;
var rhoaux_4_3 = 1*emx_1_3*emx_2_3*emx_3_3*emx_4_3 - 2*emx_2_3*emx_3_3*emx_4_3 + 2*emx_3_3*emx_4_3 -
2*emx_4_3 + 1;
var rhoaux_4_4 = 1*emx_1_4*emx_2_4*emx_3_4*emx_4_4 - 2*emx_2_4*emx_3_4*emx_4_4 + 2*emx_3_4*emx_4_4 -
2*emx_4_4 + 1;
var rhoaux_4_5 = 1*emx_1_5*emx_2_5*emx_3_5*emx_4_5 - 2*emx_2_5*emx_3_5*emx_4_5 + 2*emx_3_5*emx_4_5 -
2*emx_4_5 + 1;
var rhoaux_4_6 = 1*emx_1_6*emx_2_6*emx_3_6*emx_4_6 - 2*emx_2_6*emx_3_6*emx_4_6 + 2*emx_3_6*emx_4_6 -
2*emx_4_6 + 1;
var rhoaux_4_7 = 1*emx_1_7*emx_2_7*emx_3_7*emx_4_7 - 2*emx_2_7*emx_3_7*emx_4_7 + 2*emx_3_7*emx_4_7 -
2*emx_4_7 + 1;
var rhoaux_4_8 = 1*emx_1_8*emx_2_8*emx_3_8*emx_4_8 - 2*emx_2_8*emx_3_8*emx_4_8 + 2*emx_3_8*emx_4_8 -
2*emx_4_8 + 1;
var rhoaux_4_9 = 1*emx_1_9*emx_2_9*emx_3_9*emx_4_9 - 2*emx_2_9*emx_3_9*emx_4_9 + 2*emx_3_9*emx_4_9 -
2*emx_4_9 + 1;
var rhoaux_4_10 = 1*emx_1_10*emx_2_10*emx_3_10*emx_4_10 - 2*emx_2_10*emx_3_10*emx_4_10 + 2*emx_3_10*emx_4_10
- 2*emx_4_10 + 1;
var rhoaux_4_11 = 1*emx_1_11*emx_2_11*emx_3_11*emx_4_11 - 2*emx_2_11*emx_3_11*emx_4_11 + 2*emx_3_11*emx_4_11
- 2*emx_4_11 + 1;
var rhoaux_4_12 = 1*emx_1_12*emx_2_12*emx_3_12*emx_4_12 - 2*emx_2_12*emx_3_12*emx_4_12 + 2*emx_3_12*emx_4_12
- 2*emx_4_12 + 1;
var rhoaux_4_13 = 1*emx_1_13*emx_2_13*emx_3_13*emx_4_13 - 2*emx_2_13*emx_3_13*emx_4_13 + 2*emx_3_13*emx_4_13
- 2*emx_4_13 + 1;
var rhoaux_4_14 = 1*emx_1_14*emx_2_14*emx_3_14*emx_4_14 - 2*emx_2_14*emx_3_14*emx_4_14 + 2*emx_3_14*emx_4_14
- 2*emx_4_14 + 1;
var rhoaux_4_15 = 1*emx_1_15*emx_2_15*emx_3_15*emx_4_15 - 2*emx_2_15*emx_3_15*emx_4_15 + 2*emx_3_15*emx_4_15
- 2*emx_4_15 + 1;
var rhoaux_4_16 = 1*emx_1_16*emx_2_16*emx_3_16*emx_4_16 - 2*emx_2_16*emx_3_16*emx_4_16 + 2*emx_3_16*emx_4_16
- 2*emx_4_16 + 1;
var rhoaux_4_17 = 1*emx_1_17*emx_2_17*emx_3_17*emx_4_17 - 2*emx_2_17*emx_3_17*emx_4_17 + 2*emx_3_17*emx_4_17
- 2*emx_4_17 + 1;
var rhoaux_4_18 = 1*emx_1_18*emx_2_18*emx_3_18*emx_4_18 - 2*emx_2_18*emx_3_18*emx_4_18 + 2*emx_3_18*emx_4_18
- 2*emx_4_18 + 1;
var rhoaux_4_19 = 1*emx_1_19*emx_2_19*emx_3_19*emx_4_19 - 2*emx_2_19*emx_3_19*emx_4_19 + 2*emx_3_19*emx_4_19
- 2*emx_4_19 + 1;
var rhoaux_4_20 = 1*emx_1_20*emx_2_20*emx_3_20*emx_4_20 - 2*emx_2_20*emx_3_20*emx_4_20 + 2*emx_3_20*emx_4_20
- 2*emx_4_20 + 1;
var rhoaux_4_21 = 1*emx_1_21*emx_2_21*emx_3_21*emx_4_21 - 2*emx_2_21*emx_3_21*emx_4_21 + 2*emx_3_21*emx_4_21
- 2*emx_4_21 + 1;
var rhoaux_4_22 = 1*emx_1_22*emx_2_22*emx_3_22*emx_4_22 - 2*emx_2_22*emx_3_22*emx_4_22 + 2*emx_3_22*emx_4_22
- 2*emx_4_22 + 1;
var rhoaux_4_23 = 1*emx_1_23*emx_2_23*emx_3_23*emx_4_23 - 2*emx_2_23*emx_3_23*emx_4_23 + 2*emx_3_23*emx_4_23
- 2*emx_4_23 + 1;
var rhoaux_4_24 = 1*emx_1_24*emx_2_24*emx_3_24*emx_4_24 - 2*emx_2_24*emx_3_24*emx_4_24 + 2*emx_3_24*emx_4_24
- 2*emx_4_24 + 1;
var rhoaux_4_25 = 1*emx_1_25*emx_2_25*emx_3_25*emx_4_25 - 2*emx_2_25*emx_3_25*emx_4_25 + 2*emx_3_25*emx_4_25
- 2*emx_4_25 + 1;
var rhoaux_4_26 = 1*emx_1_26*emx_2_26*emx_3_26*emx_4_26 - 2*emx_2_26*emx_3_26*emx_4_26 + 2*emx_3_26*emx_4_26
- 2*emx_4_26 + 1;
var rhoaux_4_27 = 1*emx_1_27*emx_2_27*emx_3_27*emx_4_27 - 2*emx_2_27*emx_3_27*emx_4_27 + 2*emx_3_27*emx_4_27
- 2*emx_4_27 + 1;
var rhoaux_4_28 = 1*emx_1_28*emx_2_28*emx_3_28*emx_4_28 - 2*emx_2_28*emx_3_28*emx_4_28 + 2*emx_3_28*emx_4_28
- 2*emx_4_28 + 1;
var rhoaux_4_29 = 1*emx_1_29*emx_2_29*emx_3_29*emx_4_29 - 2*emx_2_29*emx_3_29*emx_4_29 + 2*emx_3_29*emx_4_29
- 2*emx_4_29 + 1;
var rhoaux_4_30 = 1*emx_1_30*emx_2_30*emx_3_30*emx_4_30 - 2*emx_2_30*emx_3_30*emx_4_30 + 2*emx_3_30*emx_4_30
- 2*emx_4_30 + 1;
var rho_1 = (-1)*rhoaux_4_1/mu_1^2;
var rho_2 = (-1)*rhoaux_4_2/mu_2^2;
var rho_3 = (-1)*rhoaux_4_3/mu_3^2;
var rho_4 = (-1)*rhoaux_4_4/mu_4^2;
var rho_5 = (-1)*rhoaux_4_5/mu_5^2;
var rho_6 = (-1)*rhoaux_4_6/mu_6^2;
var rho_7 = (-1)*rhoaux_4_7/mu_7^2;
var rho_8 = (-1)*rhoaux_4_8/mu_8^2;
var rho_9 = (-1)*rhoaux_4_9/mu_9^2;
var rho_10 = (-1)*rhoaux_4_10/mu_10^2;
var rho_11 = (-1)*rhoaux_4_11/mu_11^2;
var rho_12 = (-1)*rhoaux_4_12/mu_12^2;
var rho_13 = (-1)*rhoaux_4_13/mu_13^2;
var rho_14 = (-1)*rhoaux_4_14/mu_14^2;
var rho_15 = (-1)*rhoaux_4_15/mu_15^2;
var rho_16 = (-1)*rhoaux_4_16/mu_16^2;
var rho_17 = (-1)*rhoaux_4_17/mu_17^2;
var rho_18 = (-1)*rhoaux_4_18/mu_18^2;
var rho_19 = (-1)*rhoaux_4_19/mu_19^2;
var rho_20 = (-1)*rhoaux_4_20/mu_20^2;
var rho_21 = (-1)*rhoaux_4_21/mu_21^2;
var rho_22 = (-1)*rhoaux_4_22/mu_22^2;
var rho_23 = (-1)*rhoaux_4_23/mu_23^2;
var rho_24 = (-1)*rhoaux_4_24/mu_24^2;
var rho_25 = (-1)*rhoaux_4_25/mu_25^2;
var rho_26 = (-1)*rhoaux_4_26/mu_26^2;
var rho_27 = (-1)*rhoaux_4_27/mu_27^2;
var rho_28 = (-1)*rhoaux_4_28/mu_28^2;
var rho_29 = (-1)*rhoaux_4_29/mu_29^2;
var rho_30 = (-1)*rhoaux_4_30/mu_30^2;
var aux1_1 = A_1^2*rhoaux_4_1^2;
var aux1_2 = A_2^2*rhoaux_4_2^2;
var aux1_3 = A_3^2*rhoaux_4_3^2;
var aux1_4 = A_4^2*rhoaux_4_4^2;
var aux1_5 = A_5^2*rhoaux_4_5^2;
var aux1_6 = A_6^2*rhoaux_4_6^2;
var aux1_7 = A_7^2*rhoaux_4_7^2;
var aux1_8 = A_8^2*rhoaux_4_8^2;
var aux1_9 = A_9^2*rhoaux_4_9^2;
var aux1_10 = A_10^2*rhoaux_4_10^2;
var aux1_11 = A_11^2*rhoaux_4_11^2;
var aux1_12 = A_12^2*rhoaux_4_12^2;
var aux1_13 = A_13^2*rhoaux_4_13^2;
var aux1_14 = A_14^2*rhoaux_4_14^2;
var aux1_15 = A_15^2*rhoaux_4_15^2;
var aux1_16 = A_16^2*rhoaux_4_16^2;
var aux1_17 = A_17^2*rhoaux_4_17^2;
var aux1_18 = A_18^2*rhoaux_4_18^2;
var aux1_19 = A_19^2*rhoaux_4_19^2;
var aux1_20 = A_20^2*rhoaux_4_20^2;
var aux1_21 = A_21^2*rhoaux_4_21^2;
var aux1_22 = A_22^2*rhoaux_4_22^2;
var aux1_23 = A_23^2*rhoaux_4_23^2;
var aux1_24 = A_24^2*rhoaux_4_24^2;
var aux1_25 = A_25^2*rhoaux_4_25^2;
var aux1_26 = A_26^2*rhoaux_4_26^2;
var aux1_27 = A_27^2*rhoaux_4_27^2;
var aux1_28 = A_28^2*rhoaux_4_28^2;
var aux1_29 = A_29^2*rhoaux_4_29^2;
var aux1_30 = A_30^2*rhoaux_4_30^2;
var aux3_1 = A_1*rho_1;
var aux3_2 = A_2*rho_2;
var aux3_3 = A_3*rho_3;
var aux3_4 = A_4*rho_4;
var aux3_5 = A_5*rho_5;
var aux3_6 = A_6*rho_6;
var aux3_7 = A_7*rho_7;
var aux3_8 = A_8*rho_8;
var aux3_9 = A_9*rho_9;
var aux3_10 = A_10*rho_10;
var aux3_11 = A_11*rho_11;
var aux3_12 = A_12*rho_12;
var aux3_13 = A_13*rho_13;
var aux3_14 = A_14*rho_14;
var aux3_15 = A_15*rho_15;
var aux3_16 = A_16*rho_16;
var aux3_17 = A_17*rho_17;
var aux3_18 = A_18*rho_18;
var aux3_19 = A_19*rho_19;
var aux3_20 = A_20*rho_20;
var aux3_21 = A_21*rho_21;
var aux3_22 = A_22*rho_22;
var aux3_23 = A_23*rho_23;
var aux3_24 = A_24*rho_24;
var aux3_25 = A_25*rho_25;
var aux3_26 = A_26*rho_26;
var aux3_27 = A_27*rho_27;
var aux3_28 = A_28*rho_28;
var aux3_29 = A_29*rho_29;
var aux3_30 = A_30*rho_30;
var hsum_1 = hsum_0 + aux1_1*aux2_1 + aux3_1*aux4_1;
var hsum_2 = hsum_1 + aux1_2*aux2_2 + aux3_2*aux4_2;
var hsum_3 = hsum_2 + aux1_3*aux2_3 + aux3_3*aux4_3;
var hsum_4 = hsum_3 + aux1_4*aux2_4 + aux3_4*aux4_4;
var hsum_5 = hsum_4 + aux1_5*aux2_5 + aux3_5*aux4_5;
var hsum_6 = hsum_5 + aux1_6*aux2_6 + aux3_6*aux4_6;
var hsum_7 = hsum_6 + aux1_7*aux2_7 + aux3_7*aux4_7;
var hsum_8 = hsum_7 + aux1_8*aux2_8 + aux3_8*aux4_8;
var hsum_9 = hsum_8 + aux1_9*aux2_9 + aux3_9*aux4_9;
var hsum_10 = hsum_9 + aux1_10*aux2_10 + aux3_10*aux4_10;
var hsum_11 = hsum_10 + aux1_11*aux2_11 + aux3_11*aux4_11;
var hsum_12 = hsum_11 + aux1_12*aux2_12 + aux3_12*aux4_12;
var hsum_13 = hsum_12 + aux1_13*aux2_13 + aux3_13*aux4_13;
var hsum_14 = hsum_13 + aux1_14*aux2_14 + aux3_14*aux4_14;
var hsum_15 = hsum_14 + aux1_15*aux2_15 + aux3_15*aux4_15;
var hsum_16 = hsum_15 + aux1_16*aux2_16 + aux3_16*aux4_16;
var hsum_17 = hsum_16 + aux1_17*aux2_17 + aux3_17*aux4_17;
var hsum_18 = hsum_17 + aux1_18*aux2_18 + aux3_18*aux4_18;
var hsum_19 = hsum_18 + aux1_19*aux2_19 + aux3_19*aux4_19;
var hsum_20 = hsum_19 + aux1_20*aux2_20 + aux3_20*aux4_20;
var hsum_21 = hsum_20 + aux1_21*aux2_21 + aux3_21*aux4_21;
var hsum_22 = hsum_21 + aux1_22*aux2_22 + aux3_22*aux4_22;
var hsum_23 = hsum_22 + aux1_23*aux2_23 + aux3_23*aux4_23;
var hsum_24 = hsum_23 + aux1_24*aux2_24 + aux3_24*aux4_24;
var hsum_25 = hsum_24 + aux1_25*aux2_25 + aux3_25*aux4_25;
var hsum_26 = hsum_25 + aux1_26*aux2_26 + aux3_26*aux4_26;
var hsum_27 = hsum_26 + aux1_27*aux2_27 + aux3_27*aux4_27;
var hsum_28 = hsum_27 + aux1_28*aux2_28 + aux3_28*aux4_28;
var hsum_29 = hsum_28 + aux1_29*aux2_29 + aux3_29*aux4_29;
var hsum_30 = hsum_29 + aux1_30*aux2_30 + aux3_30*aux4_30;
var h = hsum_30;
var mfcorrr = (-1)*x_2 + (x_3 - 8/10)^2;
var myminfun = x_1^2 + x_2^2 + x_3^2 + x_4^2 + mfcorrr;
var myabsdevnod0_0 = abs(myminfun - 1.362656814889885);
var myreldevnod0_0 = abs(myminfun/1.362656814889885 - 1);
var myabsdevnod0_1 = abs(x_1 - 0.717050023543273);
var myreldevnod0_1 = abs(x_1/0.717050023543273 - 1);
var myabsdevnod0_2 = abs(x_2);
var myreldevnod0_2 = abs(x_2);
var myabsdevnod0_3 = abs(x_3 - 0.8);
var myreldevnod0_3 = abs(x_3/0.8 - 1);
var myabsdevnod0_4 = abs(x_4 + 0.456613708320804);
var myreldevnod0_4 = abs(x_4/0.456613708320804 + 1);
var myabsdevnod1_0 = (1/2)*(abs(myabsdevnod0_0 - myabsdevnod0_1) + (myabsdevnod0_0 + myabsdevnod0_1));
var myreldevnod1_0 = (1/2)*(abs(myreldevnod0_0 - myreldevnod0_1) + (myreldevnod0_0 + myreldevnod0_1));
var myabsdevnod1_2 = (1/2)*(abs(myabsdevnod0_2 - myabsdevnod0_3) + (myabsdevnod0_2 + myabsdevnod0_3));
var myreldevnod1_2 = (1/2)*(abs(myreldevnod0_2 - myreldevnod0_3) + (myreldevnod0_2 + myreldevnod0_3));
var myabsdevnod1_4 = myabsdevnod0_4;
var myreldevnod1_4 = myreldevnod0_4;
var myabsdevnod2_0 = (1/2)*(abs(myabsdevnod1_0 - myabsdevnod1_2) + (myabsdevnod1_0 + myabsdevnod1_2));
var myreldevnod2_0 = (1/2)*(abs(myreldevnod1_0 - myreldevnod1_2) + (myreldevnod1_0 + myreldevnod1_2));
var myabsdevnod2_4 = myabsdevnod1_4;
var myreldevnod2_4 = myreldevnod1_4;
var myabsdevnod3_0 = (1/2)*(abs(myabsdevnod2_0 - myabsdevnod2_4) + (myabsdevnod2_0 + myabsdevnod2_4));
var myreldevnod3_0 = (1/2)*(abs(myreldevnod2_0 - myreldevnod2_4) + (myreldevnod2_0 + myreldevnod2_4));
var zmyabsdevmax = myabsdevnod3_0;
var zmyreldevmax = myreldevnod3_0;
minimize obj: myminfun;
subject to ci_1: 0.0001 - h >= 0;
solve;
display x_1;
display x_2;
display x_3;
display x_4;
display myminfun;
display zmyabsdevmax;
display zmyreldevmax;
# End Model
