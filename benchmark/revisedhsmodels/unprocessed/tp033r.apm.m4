Model tp033r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    lbx2hs = 0
    lbx2r  = 10^(-5)
    lbx2   = ifelse(stricths,1,`lbx2hs',`lbx2r')
  End Parameters

  Variables
    x[1] =    0, >=    0
    x[2] = lbx2, >= lbx2
    x[3] =    3, >=    0, <= 5
    obj
  End Variables

  Equations
    x[3]^2 - x[2]^2 - x[1]^2 >= 0
    x[1]^2 + x[2]^2 + x[3]^2 - 4 >= 0

    obj = (x[1] - 1)*(x[1] - 2)*(x[1] - 3) + x[3]

    ! best known objective = sqrt(2) - 6 = -4.585786437626905
    ! begin of best known solution belonging to the revised case
    ! x[1] = 0
    ! x[2] = sqrt(2) = 1.414213562373095
    ! x[3] = sqrt(2) = 1.414213562373095
    ! end of best known solution belonging to the revised case
  End Equations
End Model
