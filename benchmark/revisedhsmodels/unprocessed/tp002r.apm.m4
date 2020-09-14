Model tp002r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    lbx1 = 0
  End Parameters

  Variables
    x[1] = -2 ifelse(stricths,1,`',`, >= lbx1')
    x[2] =  1, >= 3/2
    obj
  End Variables

  Equations
    obj = 100*(x[2] - x[1]^2)^2 + (1 - x[1])^2

    ! best known objective = 0.05042618789360708
    ! aux1 = cos(arccos(sqrt(1794)*15/89401)/3)*sqrt(1794)/30
    ! begin of best known solution belonging to the revised case
    ! x[1] = aux1 = 1.224370748736353
    ! x[2] = 1.5
    ! end of best known solution belonging to the revised case
  End Equations
End Model
