Model tp055r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    lbx3hs = 0
    lbx3r  = 1 ! increased lower bound prevents lingering at 20/3
    lbx3   = ifelse(stricths,1,`lbx3hs',`lbx3r')
  End Parameters

  Variables
    x[1] = 1, >=    0, <= 1
    x[2] = 2, >=    0
    x[3] = 0, >= lbx3
    x[4] = 0, >=    0, <= 1
    x[5] = 0, >=    0
    x[6] = 2, >=    0
    obj
  End Variables

  Equations
    x[1] + 2*x[2] + 5*x[5] - 6 = 0
    x[1] + x[2] + x[3] - 3 = 0
    x[4] + x[5] + x[6] - 2 = 0
    x[1] + x[4] - 1 = 0
    x[2] + x[5] - 2 = 0
    x[3] + x[6] - 2 = 0

    obj = x[1] + 2*x[2] + 4*x[5] + exp(x[1]*x[4])

    ! best known objective = 19/3 = 6.333333333333333
    ! begin of best known solution belonging to the revised case
    ! x[1] = 0
    ! x[2] = 4/3 = 1.333333333333333
    ! x[3] = 5/3 = 1.666666666666667
    ! x[4] = 1
    ! x[5] = 2/3 = 0.6666666666666667
    ! x[6] = 1/3 = 0.3333333333333333
    ! end of best known solution belonging to the revised case
  End Equations
End Model
