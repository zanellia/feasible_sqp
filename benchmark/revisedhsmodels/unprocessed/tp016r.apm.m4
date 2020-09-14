Model tp016r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    lbx1hs = -1/2
    lbx1r  =  0
    lbx1   =  ifelse(stricths,1,`lbx1hs',`lbx1r')
  End Parameters

  Variables
    x[1] = -2, >= lbx1, <= 1/2
    x[2] =  1,          <= 1
    obj
  End Variables

  Equations
    x[1] + x[2]^2 >= 0
    x[1]^2 + x[2] >= 0

    obj = 100*(x[2] - x[1]^2)^2 + (1 - x[1])^2

    ! best known objective = 0.25
    ! begin of best known solution belonging to the revised case
    ! x[1] = 0.5
    ! x[2] = 0.25
    ! end of best known solution belonging to the revised case
  End Equations
End Model
