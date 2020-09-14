Model tp069r1
  ! Source version 4

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
    phin = (1/2)*erfc((-1)*argn/sqrt(2))
    phi0 = (1/2)*erfc((-1)*arg0/sqrt(2))
    phip = (1/2)*erfc((-1)*argp/sqrt(2))
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
