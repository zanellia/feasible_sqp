Model tp087r1
  ! Source version 7

  ! The discontinuities of problem #87 have been softened by means of
  ! small transition domains. So the objective function becomes fully
  ! differentiable down to the 2-nd derivative, inclusively.
  ! The H+S problem dimensions are conserved.
  ! The obtained solution is better than the one given by H+S.
  ! Unfortunately, x[2] lies inside such a transition domain.
  ! That means the solution is sensible but not exact.
  ! Contrariwise, model tp087r2 yields the exact solution.
  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  ! With FMC, `-Dhavefsign2' can furthermore be given
  ! to use the perfectly sharp fsign2() function.

  ifdef(`havefsign2',`define(`usefsign2',1)',`define(`usefsign2',0)')

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
    midget = 2.0e-38
    c2 = 2
    c4 = 4
    c8 = 8
    c16 = 16
    ct10 = -2186927100809997/c16
    ct11 = 9112324500347/c4
    ct12 = -121498919997/c8
    ct13 = 101249775/c2
    ct14 = -1350001/c16
    ct15 = 225/c4
    ct20 = -2999100089997/c16
    ct21 = 37493500189/c4
    ct22 = -1499879997/c8
    ct23 = 3749925/c2
    ct24 = -150001/c16
    ct25 = 75/c4
    ct30 = -191985600359997/c16
    ct31 = 299987000067
    ct32 = -23999519997/c8
    ct33 = 14999925
    ct34 = -600001/c16
    ct35 = 75/c2
    sign1[0] =  1
    sign1[3] = -1
    sign2[0] =  1
    sign2[5] = -1
  End Parameters

  Variables
    x[1] =  390,   >=    0, <=  400
    x[2] = 1000,   >=    0, <= 1000
    x[3] =  419.5, >=  340, <=  420
    x[4] =  340.5, >=  340, <=  420
    x[5] = ivx5,   >= lbx5, <= ubx5
    x[6] =    0.5, >=    0, <=    0.5236
    obj
  End Variables

  Intermediates
    cons[1] = 300 - x[1] - x[3]*x[4]*cos(b - x[6])/a + c*d*x[3]^2/a
    cons[2] = (-1)*x[2] - x[3]*x[4]*cos(b + x[6])/a + c*d*x[4]^2/a
    cons[3] = (-1)*x[5] - x[3]*x[4]*sin(b + x[6])/a + c*e*x[4]^2/a
    cons[4] = 200 - x[3]*x[4]*sin(b - x[6])/a + c*e*x[3]^2/a
    comp1[1] = x[1] - 299
    comp1[2] = x[1] - 301
    comp2[1] = x[2] -  99
    comp2[2] = x[2] - 101
    comp2[3] = x[2] - 199
    comp2[4] = x[2] - 201
    sign1x[1:2] = comp1[1:2]/sqrt(comp1[1:2]^2 + midget)
    sign2x[1:4] = comp2[1:4]/sqrt(comp2[1:4]^2 + midget)
    sign1[1:2] = ifelse(usefsign2,1,`fsign2(comp1[1:2])',`sign1x[1:2]')
    sign2[1:4] = ifelse(usefsign2,1,`fsign2(comp2[1:4])',`sign2x[1:4]')
    step1[1:3] = (1 + sign1[0:2])*(1 - sign1[1:3])/4
    step2[1:5] = (1 + sign2[0:4])*(1 - sign2[1:5])/4
    f1[1] = 30*x[1]
    f1[2] = (((((ct15)*x[1] + &
                 ct14)*x[1] + &
                 ct13)*x[1] + &
                 ct12)*x[1] + &
                 ct11)*x[1] + &
                 ct10
    f1[3] = 31*x[1]
    f2[1] = 28*x[2]
    f2[2] = (((((ct25)*x[2] + &
                 ct24)*x[2] + &
                 ct23)*x[2] + &
                 ct22)*x[2] + &
                 ct21)*x[2] + &
                 ct20
    f2[3] = 29*x[2]
    f2[4] = (((((ct35)*x[2] + &
                 ct34)*x[2] + &
                 ct33)*x[2] + &
                 ct32)*x[2] + &
                 ct31)*x[2] + &
                 ct30
    f2[5] = 30*x[2]
    f1comb[1] = f1[1]*step1[1]
    f1comb[2:3] = f1comb[1:2] + f1[2:3]*step1[2:3]
    f2comb[1] = f2[1]*step2[1]
    f2comb[2:5] = f2comb[1:4] + f2[2:5]*step2[2:5]
    mf = f1comb[3] + f2comb[5]
  End Intermediates

  Equations
    cons[1:4] = 0

    obj = mf

    ! best known objective = 8854.997011124169
    ! begin of best known solution belonging to the revised case
    ! x[1] = 202.7039339773582
    ! x[2] =  99.06588958062389
    ! x[3] = 383.1404626009829
    ! x[4] = 420
    ! x[5] = -11.11782763722497
    ! x[6] =   0.07238952863601766
    ! end of best known solution belonging to the revised case

    ! -Urevisedhs, bv = bv1 ! best known objective = 8927.597735497849
    ! -Urevisedhs, bv = bv1 ! begin of best known solution
    ! -Urevisedhs, bv = bv1 ! x[1] = 107.8119108434655
    ! -Urevisedhs, bv = bv1 ! x[2] = 196.3186348342718
    ! -Urevisedhs, bv = bv1 ! x[3] = 373.8307251782233
    ! -Urevisedhs, bv = bv1 ! x[4] = 420
    ! -Urevisedhs, bv = bv1 ! x[5] =  21.30714199731296
    ! -Urevisedhs, bv = bv1 ! x[6] =   0.1532919773451164
    ! -Urevisedhs, bv = bv1 ! end of best known solution

    ! -Urevisedhs, bv = bv2 ! best known objective = 8996.902455641839
    ! -Urevisedhs, bv = bv2 ! begin of best known solution
    ! -Urevisedhs, bv = bv2 ! x[1] = 107.5245477851326
    ! -Urevisedhs, bv = bv2 ! x[2] = 199.0057232887568
    ! -Urevisedhs, bv = bv2 ! x[3] = 373.7952407681832
    ! -Urevisedhs, bv = bv2 ! x[4] = 420
    ! -Urevisedhs, bv = bv2 ! x[5] =  21.6051732345012
    ! -Urevisedhs, bv = bv2 ! x[6] =   0.1545471445332222
    ! -Urevisedhs, bv = bv2 ! end of best known solution

  End Equations
End Model
