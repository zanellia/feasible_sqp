Model tp068r1
  ! Source version 4

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted dead corner is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    a = 0.0001
    b = 1
    d = 1
    n = 24
    ubx2hs = 100
              ! phi0(x[2] = 6) > 9.8*10^(-10)
              ! phi0(x[2] = 5) > 2.8*10^( -7)
    ubx2r = 4 ! phi0(x[2] = 4) > 3.1*10^( -5)
              ! phi0(x[2] = 3) > 1.3*10^( -3)
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

    ! best known objective = -0.9204250036397502
    ! begin of best known solution belonging to the revised case
    ! x[1] = 0.06785857702600182
    ! x[2] = 3.646210855444605
    ! x[3] = 0.0002661356254675489
    ! x[4] = 0.8948550394178876
    ! end of best known solution belonging to the revised case
  End Equations
End Model
