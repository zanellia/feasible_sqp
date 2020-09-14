Model tp029r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that the solution becomes unique.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Variables
    x[1] = 1 ifelse(stricths,1,`',`, >= 0')
    x[2] = 1 ifelse(stricths,1,`',`, >= 0')
    x[3] = 1
    obj
  End Variables

  Equations
    (-1)*x[1]^2 - 2*x[2]^2 - 4*x[3]^2 + 48 >= 0

    obj = -x[1]*x[2]*x[3]

    ! best known objective = -16*sqrt(2) = -22.62741699796952
    ! begin of best known solution belonging to the revised case
    ! x[1] = 4
    ! x[2] = 2*sqrt(2) = 2.82842712474619
    ! x[3] = 2
    ! end of best known solution belonging to the revised case
  End Equations
End Model
