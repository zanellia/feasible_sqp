Model tp087r2
  ! Source version 7

  ! The discontinuities of problem #87 have been managed applying
  ! some technique that is also known as Mathematical Programs with
  ! Equilibrium Constraints (MPEC). In particular, the functions
  ! abs() and sign() have been constructed by means of additional
  ! constraints and variables such that the step() function, as
  ! known from IBM's PL/I-FORMAC, gets available to define intervals.
  ! So the H+S problem dimensions are not conserved. The obtained
  ! solution is better than the one given by H+S and is exact.
  ! For some background see http://www.stfmc.de/fmc/jdt/x/tlf.xhtml .
  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    bv1 = 1.48477 ! from PROB.FOR
    bv2 = 1.48577 ! from H+S, seems to be a typo
    bv  = bv1     ! my quite clear decision from data below
    ubx5hsv1 =  1000    ! from PROB.FOR
    ubx5hsv2 = 10000    ! from H+S
    ubx5hsv  = ubx5hsv1 ! my decision is irrelevant,
                        ! x[5] < ubx5hsv is true in any case
    a = 131.078
    b = bv
    c = 0.90798
    arg = 1.47588
    d = cos(arg)
    e = sin(arg)
    ivx5hs = 198.175
    lbx5hs = -1000
    lbx5r = -18
    lbx5 = ifelse(stricths,1,`lbx5hs',`lbx5r')
    ubx5hs = ubx5hsv
    ubx5r = -10.7
    ubx5 = ifelse(stricths,1,`ubx5hs',`ubx5r')
    ! initialize in accordance with the bounds
    ! ivx5 = min(ivx5hs,ubx5)
    ! min() expressed by abs() for APMonitor
    ivx5 = (1/2)*(ivx5hs + ubx5 - abs(ivx5hs - ubx5))
    sign1[0] =  1
    sign1[2] = -1
    sign2[0] =  1
    sign2[3] = -1
  End Parameters

  Variables
    x[ 1] =  390,   >=    0, <=  400
    x[ 2] = 1000,   >=    0, <= 1000
    x[ 3] =  419.5, >=  340, <=  420
    x[ 4] =  340.5, >=  340, <=  420
    x[ 5] = ivx5,   >= lbx5, <= ubx5
    x[ 6] =    0.5, >=    0, <=    0.5236
    x[ 7] =    0,   >=    0, <=  300 ! non-negative auxiliary
    x[ 8] =   90,   >=    0, <=  300 ! non-negative auxiliary
    x[ 9] =    0,   >=    0, <=  900 ! non-negative auxiliary
    x[10] =  900,   >=    0, <=  900 ! non-negative auxiliary
    x[11] =    0,   >=    0, <=  800 ! non-negative auxiliary
    x[12] =  800,   >=    0, <=  800 ! non-negative auxiliary
    x[13] =    1,   >=   -1, <=    1 ! carries a sign
    x[14] =    1,   >=   -1, <=    1 ! carries a sign
    x[15] =    1,   >=   -1, <=    1 ! carries a sign
    obj
  End Variables

  Intermediates
    cons[1] = 300 - x[1] - x[3]*x[4]*cos(b - x[6])/a + c*d*x[3]^2/a
    cons[2] = (-1)*x[2] - x[3]*x[4]*cos(b + x[6])/a + c*d*x[4]^2/a
    cons[3] = (-1)*x[5] - x[3]*x[4]*sin(b + x[6])/a + c*e*x[4]^2/a
    cons[4] = 200 - x[3]*x[4]*sin(b - x[6])/a + c*e*x[3]^2/a
    comp1[1] = x[1] - 300
    comp2[1] = x[2] - 100
    comp2[2] = x[2] - 200
    comp1nnxa[1] = x[ 7]
    comp1nnxb[1] = x[ 8]
    comp2nnxa[1] = x[ 9]
    comp2nnxb[1] = x[10]
    comp2nnxa[2] = x[11]
    comp2nnxb[2] = x[12]
    cons[5:5] = comp1[1:1] + comp1nnxa[1:1] - comp1nnxb[1:1]
    cons[6:7] = comp2[1:2] + comp2nnxa[1:2] - comp2nnxb[1:2]
    comp1abs[1:1] = comp1nnxa[1:1] + comp1nnxb[1:1]
    comp2abs[1:2] = comp2nnxa[1:2] + comp2nnxb[1:2]
    sign1[1] = x[13]
    sign2[1] = x[14]
    sign2[2] = x[15]
    cons[8: 8] = sign1[1:1]*comp1abs[1:1] - comp1[1:1]
    cons[9:10] = sign2[1:2]*comp2abs[1:2] - comp2[1:2]
    step1[1:2] = (1 + sign1[0:1])*(1 - sign1[1:2])/4
    step2[1:3] = (1 + sign2[0:2])*(1 - sign2[1:3])/4
    f1[1] = 30*x[1]
    f1[2] = 31*x[1]
    f2[1] = 28*x[2]
    f2[2] = 29*x[2]
    f2[3] = 30*x[2]
    f1comb[1] = f1[1]*step1[1]
    f1comb[2:2] = f1comb[1:1]                   &
                + comp1nnxa[1:1]*comp1nnxb[1:1] &
                + f1[2:2]*step1[2:2]
    f2comb[1] = f2[1]*step2[1]
    f2comb[2:3] = f2comb[1:2]                   &
                + comp2nnxa[1:2]*comp2nnxb[1:2] &
                + f2[2:3]*step2[2:3]
    mf = f1comb[2] + f2comb[3]
  End Intermediates

  Equations
    cons[1:10] = 0

    obj = mf

    ! best known objective = 8853.5398913296
    ! begin of best known solution belonging to the revised case
    ! x[ 1] = 201.78466304432
    ! x[ 2] = 100
    ! x[ 3] = 383.0709952729388
    ! x[ 4] = 420
    ! x[ 5] = -10.90760562936625
    ! x[ 6] =   0.07314814840034025
    ! x[ 7] =  98.21533695567999
    ! x[ 8] =   0
    ! x[ 9] =   0
    ! x[10] =   0
    ! x[11] = 100
    ! x[12] =   0
    ! x[13] =  -1
    ! x[14] =  -1
    ! x[15] =  -1
    ! end of best known solution belonging to the revised case

    ! -Urevisedhs, bv = bv1 ! best known objective = 8927.597735497849
    ! -Urevisedhs, bv = bv1 ! begin of best known solution
    ! -Urevisedhs, bv = bv1 ! x[ 1] = 107.8119108434655
    ! -Urevisedhs, bv = bv1 ! x[ 2] = 196.3186348342718
    ! -Urevisedhs, bv = bv1 ! x[ 3] = 373.8307251782233
    ! -Urevisedhs, bv = bv1 ! x[ 4] = 420
    ! -Urevisedhs, bv = bv1 ! x[ 5] =  21.30714199731296
    ! -Urevisedhs, bv = bv1 ! x[ 6] =   0.1532919773451164
    ! -Urevisedhs, bv = bv1 ! x[ 7] = 192.1880891565345
    ! -Urevisedhs, bv = bv1 ! x[ 8] =   0
    ! -Urevisedhs, bv = bv1 ! x[ 9] =   0
    ! -Urevisedhs, bv = bv1 ! x[10] =  96.31863483427183
    ! -Urevisedhs, bv = bv1 ! x[11] =   3.681365165728165
    ! -Urevisedhs, bv = bv1 ! x[12] =   0
    ! -Urevisedhs, bv = bv1 ! x[13] =  -1
    ! -Urevisedhs, bv = bv1 ! x[14] =   1
    ! -Urevisedhs, bv = bv1 ! x[15] =  -1
    ! -Urevisedhs, bv = bv1 ! end of best known solution

    ! -Urevisedhs, bv = bv2 ! best known objective = 8996.881024389689
    ! -Urevisedhs, bv = bv2 ! begin of best known solution
    ! -Urevisedhs, bv = bv2 ! x[ 1] = 106.5627008129896
    ! -Urevisedhs, bv = bv2 ! x[ 2] = 200
    ! -Urevisedhs, bv = bv2 ! x[ 3] = 373.6761077686137
    ! -Urevisedhs, bv = bv2 ! x[ 4] = 420
    ! -Urevisedhs, bv = bv2 ! x[ 5] =  22.05749624777193
    ! -Urevisedhs, bv = bv2 ! x[ 6] =   0.155401790590494
    ! -Urevisedhs, bv = bv2 ! x[ 7] = 193.4372991870104
    ! -Urevisedhs, bv = bv2 ! x[ 8] =   0
    ! -Urevisedhs, bv = bv2 ! x[ 9] =   0
    ! -Urevisedhs, bv = bv2 ! x[10] = 100
    ! -Urevisedhs, bv = bv2 ! x[11] =   0
    ! -Urevisedhs, bv = bv2 ! x[12] =   0
    ! -Urevisedhs, bv = bv2 ! x[13] =  -1
    ! -Urevisedhs, bv = bv2 ! x[14] =   1
    ! -Urevisedhs, bv = bv2 ! x[15] =  -1
    ! -Urevisedhs, bv = bv2 ! end of best known solution

  End Equations
End Model
