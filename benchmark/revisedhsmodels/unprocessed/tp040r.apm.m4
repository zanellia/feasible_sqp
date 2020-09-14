Model tp040r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that the solution becomes unique.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    lbx3 = 0
  End Parameters

  Variables
    x[1] = 0.8
    x[2] = 0.8
    x[3] = 0.8 ifelse(stricths,1,`',`, >= lbx3')
    x[4] = 0.8
    obj
  End Variables

  Equations
    x[1]^3 + x[2]^2 - 1 = 0
    x[1]^2*x[4] - x[3] = 0
    x[4]^2 - x[2] = 0

    obj = -x[1]*x[2]*x[3]*x[4]

    ! best known objective = -0.25
    ! begin of best known solution belonging to the revised case
    ! x[1] = 2^(-1/3)   = 0.7937005259840997
    ! x[2] = 2^(-1/2)   = 0.7071067811865475
    ! x[3] = 2^(-11/12) = 0.5297315471796476
    ! x[4] = 2^(-1/4)   = 0.8408964152537145
    ! end of best known solution belonging to the revised case
  End Equations
End Model
