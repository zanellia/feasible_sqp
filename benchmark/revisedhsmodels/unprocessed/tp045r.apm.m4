Model tp045r
  ! Source version 8

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    eps  = 10^(-4)
    lbxi = eps
  End Parameters

  Variables
    x[1] = 2, ifelse(stricths,1,`',`>= lbxi,') <= 1
    x[2] = 2, ifelse(stricths,1,`',`>= lbxi,') <= 2
    x[3] = 2, ifelse(stricths,1,`',`>= lbxi,') <= 3
    x[4] = 2, ifelse(stricths,1,`',`>= lbxi,') <= 4
    x[5] = 2, ifelse(stricths,1,`',`>= lbxi,') <= 5
    obj
  End Variables

  Equations
    obj = 2 - (1/120)*x[1]*x[2]*x[3]*x[4]*x[5]

    ! best known objective = 1
    ! begin of best known solution belonging to the revised case
    ! x[1] = 1
    ! x[2] = 2
    ! x[3] = 3
    ! x[4] = 4
    ! x[5] = 5
    ! end of best known solution belonging to the revised case
  End Equations
End Model
