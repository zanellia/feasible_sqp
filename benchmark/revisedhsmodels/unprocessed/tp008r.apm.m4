Model tp008r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that the solution becomes unique.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    lbx1 = 2
  End Parameters

  Variables
    x[1] = 2 ifelse(stricths,1,`',`, >= lbx1')
    x[2] = 1
    obj
  End Variables

  Equations
    x[1]^2 + x[2]^2 - 25 = 0
    x[1]*x[2] - 9 = 0

    obj = -1

    ! best known objective = -1
    ! begin of best known solution belonging to the revised case
    ! x[1] = sqrt((25 + sqrt(301))/2) = 4.601594917683296
    ! x[2] = sqrt((25 - sqrt(301))/2) = 1.955843606618705
    ! end of best known solution belonging to the revised case
  End Equations
End Model
