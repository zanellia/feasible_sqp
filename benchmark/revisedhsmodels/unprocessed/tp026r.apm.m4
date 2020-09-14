Model tp026r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that the solution becomes unique.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    lbx3 = -0.4
  End Parameters

  Variables
    x[1] = -2.6
    x[2] =  2
    x[3] =  2 ifelse(stricths,1,`',`, >= lbx3')
    obj
  End Variables

  Equations
    (1 + x[2]^2)*x[1] + x[3]^4 - 3 = 0

    obj = (x[1] - x[2])^2 + (x[2] - x[3])^4

    ! best known objective = 0
    ! begin of best known solution belonging to the revised case
    ! x[1] = 1
    ! x[2] = 1
    ! x[3] = 1
    ! end of best known solution belonging to the revised case
  End Equations
End Model
