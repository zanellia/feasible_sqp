Model tp009r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that the solution becomes unique.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    mypi = 4*atan(1)
    eps  = 10^(-6)
    lbx1 = (-1)*9 + eps
    ubx1 =      3 - eps
  End Parameters

  Variables
    x[1] = 0 ifelse(stricths,1,`',`, >= lbx1, <= ubx1')
    x[2] = 0
    obj
  End Variables

  Equations
    4*x[1] - 3*x[2] = 0

    obj = sin(mypi*x[1]/12)*cos(mypi*x[2]/16)

    ! best known objective = -0.5
    ! begin of best known solution belonging to the revised case
    ! x[1] = -3
    ! x[2] = -4
    ! end of best known solution belonging to the revised case
  End Equations
End Model
