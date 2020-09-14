# Model tp069r2
# Source version 4
# Simple APM canonicalizer version 1.3
# AMPL back end version 1.1
param a := 0.1;
param b := 1000;
param d := 1;
param n := 4;
param ubx2hs := 100;
param ubx2r := 3;
param ubx2 := ubx2hs;
param ccheby_1 := -1.2643020882448196e+00;
param ccheby_2 := 0;
param ccheby_3 := 3.9835571737125333e-01;
param ccheby_4 := 0;
param ccheby_5 := -2.1359330922567541e-01;
param ccheby_6 := 0;
param ccheby_7 := 1.2894694377099892e-01;
param ccheby_8 := 0;
param ccheby_9 := -8.0212324799525646e-02;
param ccheby_10 := 0;
param ccheby_11 := 4.9704218472698147e-02;
param ccheby_12 := 0;
param ccheby_13 := -3.0188171158601639e-02;
param ccheby_14 := 0;
param ccheby_15 := 1.7815143115341888e-02;
param ccheby_16 := 0;
param ccheby_17 := -1.0164671957976465e-02;
param ccheby_18 := 0;
param ccheby_19 := 5.5911152039523402e-03;
param ccheby_20 := 0;
param ccheby_21 := -2.9600590223807404e-03;
param ccheby_22 := 0;
param ccheby_23 := 1.5071015467173341e-03;
param ccheby_24 := 0;
param ccheby_25 := -7.3773072596169888e-04;
param ccheby_26 := 0;
param ccheby_27 := 3.4721228313591845e-04;
param ccheby_28 := 0;
param ccheby_29 := -1.5717006856687888e-04;
param ccheby_30 := 0;
param ccheby_31 := 6.8459208029230664e-05;
param ccheby_32 := 0;
param ccheby_33 := -2.8710567801942696e-05;
param ccheby_34 := 0;
param ccheby_35 := 1.1600977868100481e-05;
param ccheby_36 := 0;
param ccheby_37 := -4.5196810587136284e-06;
param ccheby_38 := 0;
param ccheby_39 := 1.6990748070698774e-06;
param ccheby_40 := 0;
param ccheby_41 := -6.1680387291051985e-07;
param ccheby_42 := 0;
param ccheby_43 := 2.1639755585128332e-07;
param ccheby_44 := 0;
param ccheby_45 := -7.3429058392893473e-08;
param ccheby_46 := 0;
param ccheby_47 := 2.4117366900598175e-08;
param ccheby_48 := 0;
param ccheby_49 := -7.6730587115106464e-09;
param ccheby_50 := 0;
param ccheby_51 := 2.3665041724434005e-09;
param ccheby_52 := 0;
param ccheby_53 := -7.0804632742396867e-10;
param ccheby_54 := 0;
param ccheby_55 := 2.0565473603524951e-10;
param ccheby_56 := 0;
param ccheby_57 := -5.8027848559054955e-11;
param ccheby_58 := 0;
param ccheby_59 := 1.5916364458456465e-11;
param ccheby_60 := 0;
param ccheby_61 := -4.2465933136345151e-12;
param ccheby_62 := 0;
param ccheby_63 := 1.1028017021720276e-12;
param ccheby_64 := 0;
param ccheby_65 := -2.7891743460082767e-13;
param ccheby_66 := 0;
param ccheby_67 := 6.8742937899811376e-14;
param ccheby_68 := 0;
param ccheby_69 := -1.6519635328083837e-14;
param ccheby_70 := 0;
param ccheby_71 := 3.8731693038259927e-15;
param ccheby_72 := 0;
param ccheby_73 := -8.8811690071657826e-16;
param ccheby_74 := 0;
param ccheby_75 := 2.0725831005950576e-16;
param ccheby_76 := 0;
param ccheby_77 := -4.3236488015163786e-17;
param tn_0 := 1;
param t0_0 := 1;
param tp_0 := 1;
param sn_0 := 1;
param s0_0 := 1;
param sp_0 := 1;
var x_1 >= 0.0001, <= 100;
let x_1 := 1;
var x_2 >= 0, <= ubx2;
let x_2 := 1;
var x_3 >= 0, <= 2;
let x_3 := 1;
var x_4 >= 0, <= 2;
let x_4 := 1;
var argn = (-1)*x_2 - d*sqrt(n);
var arg0 = (-1)*x_2;
var argp = (-1)*x_2 + d*sqrt(n);
var argnerfc = (-1)*argn/sqrt(2);
var arg0erfc = (-1)*arg0/sqrt(2);
var argperfc = (-1)*argp/sqrt(2);
var argnerfc1 = (1/2)*(argnerfc + 6 - abs(argnerfc - 6));
var arg0erfc1 = (1/2)*(arg0erfc + 6 - abs(arg0erfc - 6));
var argperfc1 = (1/2)*(argperfc + 6 - abs(argperfc - 6));
var argnerfc2 = (1/2)*(abs(argnerfc1 + 6) + argnerfc1 - 6);
var arg0erfc2 = (1/2)*(abs(arg0erfc1 + 6) + arg0erfc1 - 6);
var argperfc2 = (1/2)*(abs(argperfc1 + 6) + argperfc1 - 6);
var argnccheby = argnerfc2/6;
var arg0ccheby = arg0erfc2/6;
var argpccheby = argperfc2/6;
var tn_1 = argnccheby;
var t0_1 = arg0ccheby;
var tp_1 = argpccheby;
var tn_2 = 2*argnccheby*tn_1 - tn_0;
var tn_3 = 2*argnccheby*tn_2 - tn_1;
var tn_4 = 2*argnccheby*tn_3 - tn_2;
var tn_5 = 2*argnccheby*tn_4 - tn_3;
var tn_6 = 2*argnccheby*tn_5 - tn_4;
var tn_7 = 2*argnccheby*tn_6 - tn_5;
var tn_8 = 2*argnccheby*tn_7 - tn_6;
var tn_9 = 2*argnccheby*tn_8 - tn_7;
var tn_10 = 2*argnccheby*tn_9 - tn_8;
var tn_11 = 2*argnccheby*tn_10 - tn_9;
var tn_12 = 2*argnccheby*tn_11 - tn_10;
var tn_13 = 2*argnccheby*tn_12 - tn_11;
var tn_14 = 2*argnccheby*tn_13 - tn_12;
var tn_15 = 2*argnccheby*tn_14 - tn_13;
var tn_16 = 2*argnccheby*tn_15 - tn_14;
var tn_17 = 2*argnccheby*tn_16 - tn_15;
var tn_18 = 2*argnccheby*tn_17 - tn_16;
var tn_19 = 2*argnccheby*tn_18 - tn_17;
var tn_20 = 2*argnccheby*tn_19 - tn_18;
var tn_21 = 2*argnccheby*tn_20 - tn_19;
var tn_22 = 2*argnccheby*tn_21 - tn_20;
var tn_23 = 2*argnccheby*tn_22 - tn_21;
var tn_24 = 2*argnccheby*tn_23 - tn_22;
var tn_25 = 2*argnccheby*tn_24 - tn_23;
var tn_26 = 2*argnccheby*tn_25 - tn_24;
var tn_27 = 2*argnccheby*tn_26 - tn_25;
var tn_28 = 2*argnccheby*tn_27 - tn_26;
var tn_29 = 2*argnccheby*tn_28 - tn_27;
var tn_30 = 2*argnccheby*tn_29 - tn_28;
var tn_31 = 2*argnccheby*tn_30 - tn_29;
var tn_32 = 2*argnccheby*tn_31 - tn_30;
var tn_33 = 2*argnccheby*tn_32 - tn_31;
var tn_34 = 2*argnccheby*tn_33 - tn_32;
var tn_35 = 2*argnccheby*tn_34 - tn_33;
var tn_36 = 2*argnccheby*tn_35 - tn_34;
var tn_37 = 2*argnccheby*tn_36 - tn_35;
var tn_38 = 2*argnccheby*tn_37 - tn_36;
var tn_39 = 2*argnccheby*tn_38 - tn_37;
var tn_40 = 2*argnccheby*tn_39 - tn_38;
var tn_41 = 2*argnccheby*tn_40 - tn_39;
var tn_42 = 2*argnccheby*tn_41 - tn_40;
var tn_43 = 2*argnccheby*tn_42 - tn_41;
var tn_44 = 2*argnccheby*tn_43 - tn_42;
var tn_45 = 2*argnccheby*tn_44 - tn_43;
var tn_46 = 2*argnccheby*tn_45 - tn_44;
var tn_47 = 2*argnccheby*tn_46 - tn_45;
var tn_48 = 2*argnccheby*tn_47 - tn_46;
var tn_49 = 2*argnccheby*tn_48 - tn_47;
var tn_50 = 2*argnccheby*tn_49 - tn_48;
var tn_51 = 2*argnccheby*tn_50 - tn_49;
var tn_52 = 2*argnccheby*tn_51 - tn_50;
var tn_53 = 2*argnccheby*tn_52 - tn_51;
var tn_54 = 2*argnccheby*tn_53 - tn_52;
var tn_55 = 2*argnccheby*tn_54 - tn_53;
var tn_56 = 2*argnccheby*tn_55 - tn_54;
var tn_57 = 2*argnccheby*tn_56 - tn_55;
var tn_58 = 2*argnccheby*tn_57 - tn_56;
var tn_59 = 2*argnccheby*tn_58 - tn_57;
var tn_60 = 2*argnccheby*tn_59 - tn_58;
var tn_61 = 2*argnccheby*tn_60 - tn_59;
var tn_62 = 2*argnccheby*tn_61 - tn_60;
var tn_63 = 2*argnccheby*tn_62 - tn_61;
var tn_64 = 2*argnccheby*tn_63 - tn_62;
var tn_65 = 2*argnccheby*tn_64 - tn_63;
var tn_66 = 2*argnccheby*tn_65 - tn_64;
var tn_67 = 2*argnccheby*tn_66 - tn_65;
var tn_68 = 2*argnccheby*tn_67 - tn_66;
var tn_69 = 2*argnccheby*tn_68 - tn_67;
var tn_70 = 2*argnccheby*tn_69 - tn_68;
var tn_71 = 2*argnccheby*tn_70 - tn_69;
var tn_72 = 2*argnccheby*tn_71 - tn_70;
var tn_73 = 2*argnccheby*tn_72 - tn_71;
var tn_74 = 2*argnccheby*tn_73 - tn_72;
var tn_75 = 2*argnccheby*tn_74 - tn_73;
var tn_76 = 2*argnccheby*tn_75 - tn_74;
var tn_77 = 2*argnccheby*tn_76 - tn_75;
var t0_2 = 2*arg0ccheby*t0_1 - t0_0;
var t0_3 = 2*arg0ccheby*t0_2 - t0_1;
var t0_4 = 2*arg0ccheby*t0_3 - t0_2;
var t0_5 = 2*arg0ccheby*t0_4 - t0_3;
var t0_6 = 2*arg0ccheby*t0_5 - t0_4;
var t0_7 = 2*arg0ccheby*t0_6 - t0_5;
var t0_8 = 2*arg0ccheby*t0_7 - t0_6;
var t0_9 = 2*arg0ccheby*t0_8 - t0_7;
var t0_10 = 2*arg0ccheby*t0_9 - t0_8;
var t0_11 = 2*arg0ccheby*t0_10 - t0_9;
var t0_12 = 2*arg0ccheby*t0_11 - t0_10;
var t0_13 = 2*arg0ccheby*t0_12 - t0_11;
var t0_14 = 2*arg0ccheby*t0_13 - t0_12;
var t0_15 = 2*arg0ccheby*t0_14 - t0_13;
var t0_16 = 2*arg0ccheby*t0_15 - t0_14;
var t0_17 = 2*arg0ccheby*t0_16 - t0_15;
var t0_18 = 2*arg0ccheby*t0_17 - t0_16;
var t0_19 = 2*arg0ccheby*t0_18 - t0_17;
var t0_20 = 2*arg0ccheby*t0_19 - t0_18;
var t0_21 = 2*arg0ccheby*t0_20 - t0_19;
var t0_22 = 2*arg0ccheby*t0_21 - t0_20;
var t0_23 = 2*arg0ccheby*t0_22 - t0_21;
var t0_24 = 2*arg0ccheby*t0_23 - t0_22;
var t0_25 = 2*arg0ccheby*t0_24 - t0_23;
var t0_26 = 2*arg0ccheby*t0_25 - t0_24;
var t0_27 = 2*arg0ccheby*t0_26 - t0_25;
var t0_28 = 2*arg0ccheby*t0_27 - t0_26;
var t0_29 = 2*arg0ccheby*t0_28 - t0_27;
var t0_30 = 2*arg0ccheby*t0_29 - t0_28;
var t0_31 = 2*arg0ccheby*t0_30 - t0_29;
var t0_32 = 2*arg0ccheby*t0_31 - t0_30;
var t0_33 = 2*arg0ccheby*t0_32 - t0_31;
var t0_34 = 2*arg0ccheby*t0_33 - t0_32;
var t0_35 = 2*arg0ccheby*t0_34 - t0_33;
var t0_36 = 2*arg0ccheby*t0_35 - t0_34;
var t0_37 = 2*arg0ccheby*t0_36 - t0_35;
var t0_38 = 2*arg0ccheby*t0_37 - t0_36;
var t0_39 = 2*arg0ccheby*t0_38 - t0_37;
var t0_40 = 2*arg0ccheby*t0_39 - t0_38;
var t0_41 = 2*arg0ccheby*t0_40 - t0_39;
var t0_42 = 2*arg0ccheby*t0_41 - t0_40;
var t0_43 = 2*arg0ccheby*t0_42 - t0_41;
var t0_44 = 2*arg0ccheby*t0_43 - t0_42;
var t0_45 = 2*arg0ccheby*t0_44 - t0_43;
var t0_46 = 2*arg0ccheby*t0_45 - t0_44;
var t0_47 = 2*arg0ccheby*t0_46 - t0_45;
var t0_48 = 2*arg0ccheby*t0_47 - t0_46;
var t0_49 = 2*arg0ccheby*t0_48 - t0_47;
var t0_50 = 2*arg0ccheby*t0_49 - t0_48;
var t0_51 = 2*arg0ccheby*t0_50 - t0_49;
var t0_52 = 2*arg0ccheby*t0_51 - t0_50;
var t0_53 = 2*arg0ccheby*t0_52 - t0_51;
var t0_54 = 2*arg0ccheby*t0_53 - t0_52;
var t0_55 = 2*arg0ccheby*t0_54 - t0_53;
var t0_56 = 2*arg0ccheby*t0_55 - t0_54;
var t0_57 = 2*arg0ccheby*t0_56 - t0_55;
var t0_58 = 2*arg0ccheby*t0_57 - t0_56;
var t0_59 = 2*arg0ccheby*t0_58 - t0_57;
var t0_60 = 2*arg0ccheby*t0_59 - t0_58;
var t0_61 = 2*arg0ccheby*t0_60 - t0_59;
var t0_62 = 2*arg0ccheby*t0_61 - t0_60;
var t0_63 = 2*arg0ccheby*t0_62 - t0_61;
var t0_64 = 2*arg0ccheby*t0_63 - t0_62;
var t0_65 = 2*arg0ccheby*t0_64 - t0_63;
var t0_66 = 2*arg0ccheby*t0_65 - t0_64;
var t0_67 = 2*arg0ccheby*t0_66 - t0_65;
var t0_68 = 2*arg0ccheby*t0_67 - t0_66;
var t0_69 = 2*arg0ccheby*t0_68 - t0_67;
var t0_70 = 2*arg0ccheby*t0_69 - t0_68;
var t0_71 = 2*arg0ccheby*t0_70 - t0_69;
var t0_72 = 2*arg0ccheby*t0_71 - t0_70;
var t0_73 = 2*arg0ccheby*t0_72 - t0_71;
var t0_74 = 2*arg0ccheby*t0_73 - t0_72;
var t0_75 = 2*arg0ccheby*t0_74 - t0_73;
var t0_76 = 2*arg0ccheby*t0_75 - t0_74;
var t0_77 = 2*arg0ccheby*t0_76 - t0_75;
var tp_2 = 2*argpccheby*tp_1 - tp_0;
var tp_3 = 2*argpccheby*tp_2 - tp_1;
var tp_4 = 2*argpccheby*tp_3 - tp_2;
var tp_5 = 2*argpccheby*tp_4 - tp_3;
var tp_6 = 2*argpccheby*tp_5 - tp_4;
var tp_7 = 2*argpccheby*tp_6 - tp_5;
var tp_8 = 2*argpccheby*tp_7 - tp_6;
var tp_9 = 2*argpccheby*tp_8 - tp_7;
var tp_10 = 2*argpccheby*tp_9 - tp_8;
var tp_11 = 2*argpccheby*tp_10 - tp_9;
var tp_12 = 2*argpccheby*tp_11 - tp_10;
var tp_13 = 2*argpccheby*tp_12 - tp_11;
var tp_14 = 2*argpccheby*tp_13 - tp_12;
var tp_15 = 2*argpccheby*tp_14 - tp_13;
var tp_16 = 2*argpccheby*tp_15 - tp_14;
var tp_17 = 2*argpccheby*tp_16 - tp_15;
var tp_18 = 2*argpccheby*tp_17 - tp_16;
var tp_19 = 2*argpccheby*tp_18 - tp_17;
var tp_20 = 2*argpccheby*tp_19 - tp_18;
var tp_21 = 2*argpccheby*tp_20 - tp_19;
var tp_22 = 2*argpccheby*tp_21 - tp_20;
var tp_23 = 2*argpccheby*tp_22 - tp_21;
var tp_24 = 2*argpccheby*tp_23 - tp_22;
var tp_25 = 2*argpccheby*tp_24 - tp_23;
var tp_26 = 2*argpccheby*tp_25 - tp_24;
var tp_27 = 2*argpccheby*tp_26 - tp_25;
var tp_28 = 2*argpccheby*tp_27 - tp_26;
var tp_29 = 2*argpccheby*tp_28 - tp_27;
var tp_30 = 2*argpccheby*tp_29 - tp_28;
var tp_31 = 2*argpccheby*tp_30 - tp_29;
var tp_32 = 2*argpccheby*tp_31 - tp_30;
var tp_33 = 2*argpccheby*tp_32 - tp_31;
var tp_34 = 2*argpccheby*tp_33 - tp_32;
var tp_35 = 2*argpccheby*tp_34 - tp_33;
var tp_36 = 2*argpccheby*tp_35 - tp_34;
var tp_37 = 2*argpccheby*tp_36 - tp_35;
var tp_38 = 2*argpccheby*tp_37 - tp_36;
var tp_39 = 2*argpccheby*tp_38 - tp_37;
var tp_40 = 2*argpccheby*tp_39 - tp_38;
var tp_41 = 2*argpccheby*tp_40 - tp_39;
var tp_42 = 2*argpccheby*tp_41 - tp_40;
var tp_43 = 2*argpccheby*tp_42 - tp_41;
var tp_44 = 2*argpccheby*tp_43 - tp_42;
var tp_45 = 2*argpccheby*tp_44 - tp_43;
var tp_46 = 2*argpccheby*tp_45 - tp_44;
var tp_47 = 2*argpccheby*tp_46 - tp_45;
var tp_48 = 2*argpccheby*tp_47 - tp_46;
var tp_49 = 2*argpccheby*tp_48 - tp_47;
var tp_50 = 2*argpccheby*tp_49 - tp_48;
var tp_51 = 2*argpccheby*tp_50 - tp_49;
var tp_52 = 2*argpccheby*tp_51 - tp_50;
var tp_53 = 2*argpccheby*tp_52 - tp_51;
var tp_54 = 2*argpccheby*tp_53 - tp_52;
var tp_55 = 2*argpccheby*tp_54 - tp_53;
var tp_56 = 2*argpccheby*tp_55 - tp_54;
var tp_57 = 2*argpccheby*tp_56 - tp_55;
var tp_58 = 2*argpccheby*tp_57 - tp_56;
var tp_59 = 2*argpccheby*tp_58 - tp_57;
var tp_60 = 2*argpccheby*tp_59 - tp_58;
var tp_61 = 2*argpccheby*tp_60 - tp_59;
var tp_62 = 2*argpccheby*tp_61 - tp_60;
var tp_63 = 2*argpccheby*tp_62 - tp_61;
var tp_64 = 2*argpccheby*tp_63 - tp_62;
var tp_65 = 2*argpccheby*tp_64 - tp_63;
var tp_66 = 2*argpccheby*tp_65 - tp_64;
var tp_67 = 2*argpccheby*tp_66 - tp_65;
var tp_68 = 2*argpccheby*tp_67 - tp_66;
var tp_69 = 2*argpccheby*tp_68 - tp_67;
var tp_70 = 2*argpccheby*tp_69 - tp_68;
var tp_71 = 2*argpccheby*tp_70 - tp_69;
var tp_72 = 2*argpccheby*tp_71 - tp_70;
var tp_73 = 2*argpccheby*tp_72 - tp_71;
var tp_74 = 2*argpccheby*tp_73 - tp_72;
var tp_75 = 2*argpccheby*tp_74 - tp_73;
var tp_76 = 2*argpccheby*tp_75 - tp_74;
var tp_77 = 2*argpccheby*tp_76 - tp_75;
var sn_1 = sn_0 + ccheby_1*tn_1;
var sn_2 = sn_1 + ccheby_2*tn_2;
var sn_3 = sn_2 + ccheby_3*tn_3;
var sn_4 = sn_3 + ccheby_4*tn_4;
var sn_5 = sn_4 + ccheby_5*tn_5;
var sn_6 = sn_5 + ccheby_6*tn_6;
var sn_7 = sn_6 + ccheby_7*tn_7;
var sn_8 = sn_7 + ccheby_8*tn_8;
var sn_9 = sn_8 + ccheby_9*tn_9;
var sn_10 = sn_9 + ccheby_10*tn_10;
var sn_11 = sn_10 + ccheby_11*tn_11;
var sn_12 = sn_11 + ccheby_12*tn_12;
var sn_13 = sn_12 + ccheby_13*tn_13;
var sn_14 = sn_13 + ccheby_14*tn_14;
var sn_15 = sn_14 + ccheby_15*tn_15;
var sn_16 = sn_15 + ccheby_16*tn_16;
var sn_17 = sn_16 + ccheby_17*tn_17;
var sn_18 = sn_17 + ccheby_18*tn_18;
var sn_19 = sn_18 + ccheby_19*tn_19;
var sn_20 = sn_19 + ccheby_20*tn_20;
var sn_21 = sn_20 + ccheby_21*tn_21;
var sn_22 = sn_21 + ccheby_22*tn_22;
var sn_23 = sn_22 + ccheby_23*tn_23;
var sn_24 = sn_23 + ccheby_24*tn_24;
var sn_25 = sn_24 + ccheby_25*tn_25;
var sn_26 = sn_25 + ccheby_26*tn_26;
var sn_27 = sn_26 + ccheby_27*tn_27;
var sn_28 = sn_27 + ccheby_28*tn_28;
var sn_29 = sn_28 + ccheby_29*tn_29;
var sn_30 = sn_29 + ccheby_30*tn_30;
var sn_31 = sn_30 + ccheby_31*tn_31;
var sn_32 = sn_31 + ccheby_32*tn_32;
var sn_33 = sn_32 + ccheby_33*tn_33;
var sn_34 = sn_33 + ccheby_34*tn_34;
var sn_35 = sn_34 + ccheby_35*tn_35;
var sn_36 = sn_35 + ccheby_36*tn_36;
var sn_37 = sn_36 + ccheby_37*tn_37;
var sn_38 = sn_37 + ccheby_38*tn_38;
var sn_39 = sn_38 + ccheby_39*tn_39;
var sn_40 = sn_39 + ccheby_40*tn_40;
var sn_41 = sn_40 + ccheby_41*tn_41;
var sn_42 = sn_41 + ccheby_42*tn_42;
var sn_43 = sn_42 + ccheby_43*tn_43;
var sn_44 = sn_43 + ccheby_44*tn_44;
var sn_45 = sn_44 + ccheby_45*tn_45;
var sn_46 = sn_45 + ccheby_46*tn_46;
var sn_47 = sn_46 + ccheby_47*tn_47;
var sn_48 = sn_47 + ccheby_48*tn_48;
var sn_49 = sn_48 + ccheby_49*tn_49;
var sn_50 = sn_49 + ccheby_50*tn_50;
var sn_51 = sn_50 + ccheby_51*tn_51;
var sn_52 = sn_51 + ccheby_52*tn_52;
var sn_53 = sn_52 + ccheby_53*tn_53;
var sn_54 = sn_53 + ccheby_54*tn_54;
var sn_55 = sn_54 + ccheby_55*tn_55;
var sn_56 = sn_55 + ccheby_56*tn_56;
var sn_57 = sn_56 + ccheby_57*tn_57;
var sn_58 = sn_57 + ccheby_58*tn_58;
var sn_59 = sn_58 + ccheby_59*tn_59;
var sn_60 = sn_59 + ccheby_60*tn_60;
var sn_61 = sn_60 + ccheby_61*tn_61;
var sn_62 = sn_61 + ccheby_62*tn_62;
var sn_63 = sn_62 + ccheby_63*tn_63;
var sn_64 = sn_63 + ccheby_64*tn_64;
var sn_65 = sn_64 + ccheby_65*tn_65;
var sn_66 = sn_65 + ccheby_66*tn_66;
var sn_67 = sn_66 + ccheby_67*tn_67;
var sn_68 = sn_67 + ccheby_68*tn_68;
var sn_69 = sn_68 + ccheby_69*tn_69;
var sn_70 = sn_69 + ccheby_70*tn_70;
var sn_71 = sn_70 + ccheby_71*tn_71;
var sn_72 = sn_71 + ccheby_72*tn_72;
var sn_73 = sn_72 + ccheby_73*tn_73;
var sn_74 = sn_73 + ccheby_74*tn_74;
var sn_75 = sn_74 + ccheby_75*tn_75;
var sn_76 = sn_75 + ccheby_76*tn_76;
var sn_77 = sn_76 + ccheby_77*tn_77;
var s0_1 = s0_0 + ccheby_1*t0_1;
var s0_2 = s0_1 + ccheby_2*t0_2;
var s0_3 = s0_2 + ccheby_3*t0_3;
var s0_4 = s0_3 + ccheby_4*t0_4;
var s0_5 = s0_4 + ccheby_5*t0_5;
var s0_6 = s0_5 + ccheby_6*t0_6;
var s0_7 = s0_6 + ccheby_7*t0_7;
var s0_8 = s0_7 + ccheby_8*t0_8;
var s0_9 = s0_8 + ccheby_9*t0_9;
var s0_10 = s0_9 + ccheby_10*t0_10;
var s0_11 = s0_10 + ccheby_11*t0_11;
var s0_12 = s0_11 + ccheby_12*t0_12;
var s0_13 = s0_12 + ccheby_13*t0_13;
var s0_14 = s0_13 + ccheby_14*t0_14;
var s0_15 = s0_14 + ccheby_15*t0_15;
var s0_16 = s0_15 + ccheby_16*t0_16;
var s0_17 = s0_16 + ccheby_17*t0_17;
var s0_18 = s0_17 + ccheby_18*t0_18;
var s0_19 = s0_18 + ccheby_19*t0_19;
var s0_20 = s0_19 + ccheby_20*t0_20;
var s0_21 = s0_20 + ccheby_21*t0_21;
var s0_22 = s0_21 + ccheby_22*t0_22;
var s0_23 = s0_22 + ccheby_23*t0_23;
var s0_24 = s0_23 + ccheby_24*t0_24;
var s0_25 = s0_24 + ccheby_25*t0_25;
var s0_26 = s0_25 + ccheby_26*t0_26;
var s0_27 = s0_26 + ccheby_27*t0_27;
var s0_28 = s0_27 + ccheby_28*t0_28;
var s0_29 = s0_28 + ccheby_29*t0_29;
var s0_30 = s0_29 + ccheby_30*t0_30;
var s0_31 = s0_30 + ccheby_31*t0_31;
var s0_32 = s0_31 + ccheby_32*t0_32;
var s0_33 = s0_32 + ccheby_33*t0_33;
var s0_34 = s0_33 + ccheby_34*t0_34;
var s0_35 = s0_34 + ccheby_35*t0_35;
var s0_36 = s0_35 + ccheby_36*t0_36;
var s0_37 = s0_36 + ccheby_37*t0_37;
var s0_38 = s0_37 + ccheby_38*t0_38;
var s0_39 = s0_38 + ccheby_39*t0_39;
var s0_40 = s0_39 + ccheby_40*t0_40;
var s0_41 = s0_40 + ccheby_41*t0_41;
var s0_42 = s0_41 + ccheby_42*t0_42;
var s0_43 = s0_42 + ccheby_43*t0_43;
var s0_44 = s0_43 + ccheby_44*t0_44;
var s0_45 = s0_44 + ccheby_45*t0_45;
var s0_46 = s0_45 + ccheby_46*t0_46;
var s0_47 = s0_46 + ccheby_47*t0_47;
var s0_48 = s0_47 + ccheby_48*t0_48;
var s0_49 = s0_48 + ccheby_49*t0_49;
var s0_50 = s0_49 + ccheby_50*t0_50;
var s0_51 = s0_50 + ccheby_51*t0_51;
var s0_52 = s0_51 + ccheby_52*t0_52;
var s0_53 = s0_52 + ccheby_53*t0_53;
var s0_54 = s0_53 + ccheby_54*t0_54;
var s0_55 = s0_54 + ccheby_55*t0_55;
var s0_56 = s0_55 + ccheby_56*t0_56;
var s0_57 = s0_56 + ccheby_57*t0_57;
var s0_58 = s0_57 + ccheby_58*t0_58;
var s0_59 = s0_58 + ccheby_59*t0_59;
var s0_60 = s0_59 + ccheby_60*t0_60;
var s0_61 = s0_60 + ccheby_61*t0_61;
var s0_62 = s0_61 + ccheby_62*t0_62;
var s0_63 = s0_62 + ccheby_63*t0_63;
var s0_64 = s0_63 + ccheby_64*t0_64;
var s0_65 = s0_64 + ccheby_65*t0_65;
var s0_66 = s0_65 + ccheby_66*t0_66;
var s0_67 = s0_66 + ccheby_67*t0_67;
var s0_68 = s0_67 + ccheby_68*t0_68;
var s0_69 = s0_68 + ccheby_69*t0_69;
var s0_70 = s0_69 + ccheby_70*t0_70;
var s0_71 = s0_70 + ccheby_71*t0_71;
var s0_72 = s0_71 + ccheby_72*t0_72;
var s0_73 = s0_72 + ccheby_73*t0_73;
var s0_74 = s0_73 + ccheby_74*t0_74;
var s0_75 = s0_74 + ccheby_75*t0_75;
var s0_76 = s0_75 + ccheby_76*t0_76;
var s0_77 = s0_76 + ccheby_77*t0_77;
var sp_1 = sp_0 + ccheby_1*tp_1;
var sp_2 = sp_1 + ccheby_2*tp_2;
var sp_3 = sp_2 + ccheby_3*tp_3;
var sp_4 = sp_3 + ccheby_4*tp_4;
var sp_5 = sp_4 + ccheby_5*tp_5;
var sp_6 = sp_5 + ccheby_6*tp_6;
var sp_7 = sp_6 + ccheby_7*tp_7;
var sp_8 = sp_7 + ccheby_8*tp_8;
var sp_9 = sp_8 + ccheby_9*tp_9;
var sp_10 = sp_9 + ccheby_10*tp_10;
var sp_11 = sp_10 + ccheby_11*tp_11;
var sp_12 = sp_11 + ccheby_12*tp_12;
var sp_13 = sp_12 + ccheby_13*tp_13;
var sp_14 = sp_13 + ccheby_14*tp_14;
var sp_15 = sp_14 + ccheby_15*tp_15;
var sp_16 = sp_15 + ccheby_16*tp_16;
var sp_17 = sp_16 + ccheby_17*tp_17;
var sp_18 = sp_17 + ccheby_18*tp_18;
var sp_19 = sp_18 + ccheby_19*tp_19;
var sp_20 = sp_19 + ccheby_20*tp_20;
var sp_21 = sp_20 + ccheby_21*tp_21;
var sp_22 = sp_21 + ccheby_22*tp_22;
var sp_23 = sp_22 + ccheby_23*tp_23;
var sp_24 = sp_23 + ccheby_24*tp_24;
var sp_25 = sp_24 + ccheby_25*tp_25;
var sp_26 = sp_25 + ccheby_26*tp_26;
var sp_27 = sp_26 + ccheby_27*tp_27;
var sp_28 = sp_27 + ccheby_28*tp_28;
var sp_29 = sp_28 + ccheby_29*tp_29;
var sp_30 = sp_29 + ccheby_30*tp_30;
var sp_31 = sp_30 + ccheby_31*tp_31;
var sp_32 = sp_31 + ccheby_32*tp_32;
var sp_33 = sp_32 + ccheby_33*tp_33;
var sp_34 = sp_33 + ccheby_34*tp_34;
var sp_35 = sp_34 + ccheby_35*tp_35;
var sp_36 = sp_35 + ccheby_36*tp_36;
var sp_37 = sp_36 + ccheby_37*tp_37;
var sp_38 = sp_37 + ccheby_38*tp_38;
var sp_39 = sp_38 + ccheby_39*tp_39;
var sp_40 = sp_39 + ccheby_40*tp_40;
var sp_41 = sp_40 + ccheby_41*tp_41;
var sp_42 = sp_41 + ccheby_42*tp_42;
var sp_43 = sp_42 + ccheby_43*tp_43;
var sp_44 = sp_43 + ccheby_44*tp_44;
var sp_45 = sp_44 + ccheby_45*tp_45;
var sp_46 = sp_45 + ccheby_46*tp_46;
var sp_47 = sp_46 + ccheby_47*tp_47;
var sp_48 = sp_47 + ccheby_48*tp_48;
var sp_49 = sp_48 + ccheby_49*tp_49;
var sp_50 = sp_49 + ccheby_50*tp_50;
var sp_51 = sp_50 + ccheby_51*tp_51;
var sp_52 = sp_51 + ccheby_52*tp_52;
var sp_53 = sp_52 + ccheby_53*tp_53;
var sp_54 = sp_53 + ccheby_54*tp_54;
var sp_55 = sp_54 + ccheby_55*tp_55;
var sp_56 = sp_55 + ccheby_56*tp_56;
var sp_57 = sp_56 + ccheby_57*tp_57;
var sp_58 = sp_57 + ccheby_58*tp_58;
var sp_59 = sp_58 + ccheby_59*tp_59;
var sp_60 = sp_59 + ccheby_60*tp_60;
var sp_61 = sp_60 + ccheby_61*tp_61;
var sp_62 = sp_61 + ccheby_62*tp_62;
var sp_63 = sp_62 + ccheby_63*tp_63;
var sp_64 = sp_63 + ccheby_64*tp_64;
var sp_65 = sp_64 + ccheby_65*tp_65;
var sp_66 = sp_65 + ccheby_66*tp_66;
var sp_67 = sp_66 + ccheby_67*tp_67;
var sp_68 = sp_67 + ccheby_68*tp_68;
var sp_69 = sp_68 + ccheby_69*tp_69;
var sp_70 = sp_69 + ccheby_70*tp_70;
var sp_71 = sp_70 + ccheby_71*tp_71;
var sp_72 = sp_71 + ccheby_72*tp_72;
var sp_73 = sp_72 + ccheby_73*tp_73;
var sp_74 = sp_73 + ccheby_74*tp_74;
var sp_75 = sp_74 + ccheby_75*tp_75;
var sp_76 = sp_75 + ccheby_76*tp_76;
var sp_77 = sp_76 + ccheby_77*tp_77;
var phin = (1/2)*sn_77;
var phi0 = (1/2)*s0_77;
var phip = (1/2)*sp_77;
var c_1 = x_3 - 2*phi0;
var c_2 = x_4 - phip - phin ;
var num = b*(exp(x_1) - 1) - x_3;
var den = exp(x_1) - 1 + x_4;
var mf = (a*n - (num/den)*x_4)/x_1;
minimize obj: mf;
subject to ce_1: c_1 = 0;
subject to ce_2: c_2 = 0;
solve;
display obj;
# End Model
