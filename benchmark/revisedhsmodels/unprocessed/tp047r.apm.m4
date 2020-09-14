Model tp047r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    lbx5 = 6/5
  End Parameters

  Variables
    x[1] = 2
    x[2] = sqrt(2)
    x[3] = -1
    x[4] = 2 - sqrt(2)
    x[5] = 1/2 ifelse(stricths,1,`',`, >= lbx5')
    obj
  End Variables

  Equations
    x[1] + x[2]^2 + x[3]^3 - 3 = 0
    x[2] - x[3]^2 + x[4] - 1 = 0
    x[1]*x[5] - 1 = 0

    obj = (x[1] - x[2])^2 + (x[2] - x[3])^3 &
        + (x[3] - x[4])^4 + (x[4] - x[5])^4

    ! best known objective = -0.02671418269394084
    ! begin of best known solution belonging to the revised case
    ! x[1] = 0.6770043948666402
    ! x[2] = 0.726089472652032
    ! x[3] = 1.215491214237097
    ! x[4] = 1.751329419235542
    ! x[5] = 1.477095285617732
    ! end of best known solution belonging to the revised case
  End Equations
End Model
