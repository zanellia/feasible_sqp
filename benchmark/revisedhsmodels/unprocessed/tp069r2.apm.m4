Model tp069r2
  ! Source version 4

  ! This is a formulation of #69r that does not need erfc().
  ! erfc() has been replaced by a high-quality Chebyshev approximation.
  ! So the code is well-suited for AMPL. It runs also fine under APMonitor.
  ! With FMC, inacceptable conversion times are observed due to symbolic
  ! differentiation. For the reference values, FMC better executes tp069r3.
  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted dead corner is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    a = 0.1
    b = 1000
    d = 1
    n = 4
    ubx2hs = 100
              ! phi0(x[2] = 6) > 9.8*10^(-10)
              ! phi0(x[2] = 5) > 2.8*10^( -7)
              ! phi0(x[2] = 4) > 3.1*10^( -5)
    ubx2r = 3 ! phi0(x[2] = 3) > 1.3*10^( -3)
              ! phi0(x[2] = 2) > 2.2*10^( -2)
    ubx2 = ifelse(stricths,1,`ubx2hs',`ubx2r')
    ! Chebyshev coefficients, ccheby[0] equals 1
    ccheby[ 1] = -1.2643020882448196e+00
    ccheby[ 2] =  0
    ccheby[ 3] =  3.9835571737125333e-01
    ccheby[ 4] =  0
    ccheby[ 5] = -2.1359330922567541e-01
    ccheby[ 6] =  0
    ccheby[ 7] =  1.2894694377099892e-01
    ccheby[ 8] =  0
    ccheby[ 9] = -8.0212324799525646e-02
    ccheby[10] =  0
    ccheby[11] =  4.9704218472698147e-02
    ccheby[12] =  0
    ccheby[13] = -3.0188171158601639e-02
    ccheby[14] =  0
    ccheby[15] =  1.7815143115341888e-02
    ccheby[16] =  0
    ccheby[17] = -1.0164671957976465e-02
    ccheby[18] =  0
    ccheby[19] =  5.5911152039523402e-03
    ccheby[20] =  0
    ccheby[21] = -2.9600590223807404e-03
    ccheby[22] =  0
    ccheby[23] =  1.5071015467173341e-03
    ccheby[24] =  0
    ccheby[25] = -7.3773072596169888e-04
    ccheby[26] =  0
    ccheby[27] =  3.4721228313591845e-04
    ccheby[28] =  0
    ccheby[29] = -1.5717006856687888e-04
    ccheby[30] =  0
    ccheby[31] =  6.8459208029230664e-05
    ccheby[32] =  0
    ccheby[33] = -2.8710567801942696e-05
    ccheby[34] =  0
    ccheby[35] =  1.1600977868100481e-05
    ccheby[36] =  0
    ccheby[37] = -4.5196810587136284e-06
    ccheby[38] =  0
    ccheby[39] =  1.6990748070698774e-06
    ccheby[40] =  0
    ccheby[41] = -6.1680387291051985e-07
    ccheby[42] =  0
    ccheby[43] =  2.1639755585128332e-07
    ccheby[44] =  0
    ccheby[45] = -7.3429058392893473e-08
    ccheby[46] =  0
    ccheby[47] =  2.4117366900598175e-08
    ccheby[48] =  0
    ccheby[49] = -7.6730587115106464e-09
    ccheby[50] =  0
    ccheby[51] =  2.3665041724434005e-09
    ccheby[52] =  0
    ccheby[53] = -7.0804632742396867e-10
    ccheby[54] =  0
    ccheby[55] =  2.0565473603524951e-10
    ccheby[56] =  0
    ccheby[57] = -5.8027848559054955e-11
    ccheby[58] =  0
    ccheby[59] =  1.5916364458456465e-11
    ccheby[60] =  0
    ccheby[61] = -4.2465933136345151e-12
    ccheby[62] =  0
    ccheby[63] =  1.1028017021720276e-12
    ccheby[64] =  0
    ccheby[65] = -2.7891743460082767e-13
    ccheby[66] =  0
    ccheby[67] =  6.8742937899811376e-14
    ccheby[68] =  0
    ccheby[69] = -1.6519635328083837e-14
    ccheby[70] =  0
    ccheby[71] =  3.8731693038259927e-15
    ccheby[72] =  0
    ccheby[73] = -8.8811690071657826e-16
    ccheby[74] =  0
    ccheby[75] =  2.0725831005950576e-16
    ccheby[76] =  0
    ccheby[77] = -4.3236488015163786e-17
    tn[0] = 1
    t0[0] = 1
    tp[0] = 1
    sn[0] = 1
    s0[0] = 1
    sp[0] = 1
  End Parameters

  Variables
    x[1] = 1, >= 0.0001, <=  100
    x[2] = 1, >= 0,      <= ubx2
    x[3] = 1, >= 0,      <=    2
    x[4] = 1, >= 0,      <=    2
    obj
  End Variables

  Intermediates
    argn = (-1)*x[2] - d*sqrt(n)
    arg0 = (-1)*x[2]
    argp = (-1)*x[2] + d*sqrt(n)
    argnerfc = (-1)*argn/sqrt(2)
    arg0erfc = (-1)*arg0/sqrt(2)
    argperfc = (-1)*argp/sqrt(2)
    ! clamp the arguments to erfc
    ! 2-erfc(-6) < 0.3*10^(-16)
    ! erfc(6)    < 0.3*10^(-16)
    ! argnerfc1 = min(argnerfc,6)
    ! arg0erfc1 = min(arg0erfc,6)
    ! argperfc1 = min(argperfc,6)
    ! argnerfc2 = max(argnerfc1,-6)
    ! arg0erfc2 = max(arg0erfc1,-6)
    ! argperfc2 = max(argperfc1,-6)
    ! min() and max() expressed by abs() for APMonitor
    argnerfc1 = (1/2)*(argnerfc + 6 - abs(argnerfc - 6))
    arg0erfc1 = (1/2)*(arg0erfc + 6 - abs(arg0erfc - 6))
    argperfc1 = (1/2)*(argperfc + 6 - abs(argperfc - 6))
    argnerfc2 = (1/2)*(abs(argnerfc1 + 6) + argnerfc1 - 6)
    arg0erfc2 = (1/2)*(abs(arg0erfc1 + 6) + arg0erfc1 - 6)
    argperfc2 = (1/2)*(abs(argperfc1 + 6) + argperfc1 - 6)
    ! compute phin = (1/2)*erfc(argnerfc2)
    ! compute phi0 = (1/2)*erfc(arg0erfc2)
    ! compute phip = (1/2)*erfc(argperfc2)
    argnccheby = argnerfc2/6
    arg0ccheby = arg0erfc2/6
    argpccheby = argperfc2/6
    tn[1] = argnccheby
    t0[1] = arg0ccheby
    tp[1] = argpccheby
    tn[2:77] = 2*argnccheby*tn[1:76] - tn[0:75]
    t0[2:77] = 2*arg0ccheby*t0[1:76] - t0[0:75]
    tp[2:77] = 2*argpccheby*tp[1:76] - tp[0:75]
    sn[1:77] = sn[0:76] + ccheby[1:77]*tn[1:77]
    s0[1:77] = s0[0:76] + ccheby[1:77]*t0[1:77]
    sp[1:77] = sp[0:76] + ccheby[1:77]*tp[1:77]
    phin = (1/2)*sn[77]
    phi0 = (1/2)*s0[77]
    phip = (1/2)*sp[77]
    c[1] = x[3] - 2*phi0
    c[2] = x[4] - phip - phin ! phin may vanish but not phip
    num = b*(exp(x[1]) - 1) - x[3]
    den = exp(x[1]) - 1 + x[4]
    mf = (a*n - (num/den)*x[4])/x[1]
  End Intermediates

  Equations
    c[1:2] = 0

    obj = mf

    ! best known objective = -956.7128866500283
    ! begin of best known solution belonging to the revised case
    ! x[1] = 0.02937141742170559
    ! x[2] = 1.190253450406911
    ! x[3] = 0.2339467906674188
    ! x[4] = 0.7916678112438039
    ! end of best known solution belonging to the revised case
  End Equations
End Model
