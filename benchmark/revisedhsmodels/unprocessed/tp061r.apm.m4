Model tp061r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Variables
    x[1] = 0
    x[2] = 0 ifelse(stricths,1,`',`, <= 0')
    x[3] = 0 ifelse(stricths,1,`',`, >= 0')
    obj
  End Variables

  Equations
    3*x[1] - 2*x[2]^2 - 7 = 0
    4*x[1] - x[3]^2 - 11 = 0

    obj = 4*x[1]^2 + 2*x[2]^2 + 2*x[3]^2 - 33*x[1] + 16*x[2] - 24*x[3]

    ! best known objective = -143.6461421977803
    ! begin of best known solution belonging to the revised case
    ! x[1] =  5.326770135563928
    ! x[2] = -2.118998632218976
    ! x[3] =  3.210464225350551
    ! end of best known solution belonging to the revised case
  End Equations
End Model
