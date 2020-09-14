Model tp108r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that the solution becomes unique.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    mfcorrhs = 0
  End Parameters

  Variables
    x[1:8] = 1
    x[9:9] = 1, >= 0
    obj
  End Variables

  Intermediates
    c[ 1] = 1 - x[3]^2 - x[4]^2
    c[ 2] = 1 - x[9]^2
    c[ 3] = 1 - x[5]^2 - x[6]^2
    c[ 4] = 1 - x[1]^2 - (x[2] - x[9])^2
    c[ 5] = 1 - (x[1] - x[5])^2 - (x[2] - x[6])^2
    c[ 6] = 1 - (x[1] - x[7])^2 - (x[2] - x[8])^2
    c[ 7] = 1 - (x[3] - x[5])^2 - (x[4] - x[6])^2
    c[ 8] = 1 - (x[3] - x[7])^2 - (x[4] - x[8])^2
    c[ 9] = 1 - x[7]^2 - (x[8] - x[9])^2
    c[10] = x[1]*x[4] - x[2]*x[3]
    c[11] = x[3]*x[9]
    c[12] = (-1)*x[5]*x[9]
    c[13] = x[5]*x[8] - x[6]*x[7]
    mf = (-1/2)*(x[1]*x[4] - x[2]*x[3] + &
                 x[3]*x[9] - x[5]*x[9] + &
                 x[5]*x[8] - x[6]*x[7])
    mfcorrr = (3*x[1] - 2*x[2])^2 + (3*x[5] - 2*x[6])^2
  End Intermediates

  Equations
    c[1:13] >= 0

    ! the problem is pretty ill-posed; though the best known
    ! objective is quite stable the solution is capricious
    ! without additional pressure
    obj = mf + ifelse(stricths,1,`mfcorrhs',`mfcorrr')

    ! best known objective = (-1/2)*sqrt(3) = -0.8660254037844386
    ! aux1 = (2/13)*13^(1/2)
    ! aux2 = (3/13)*13^(1/2)
    ! aux3 = (1/13)*13^(1/2) - (3/26)*13^(1/2)*3^(1/2)
    ! aux4 = (3/26)*13^(1/2) + (1/13)*13^(1/2)*3^(1/2)
    ! begin of best known solution belonging to the revised case
    ! x[1] = aux1 =  0.5547001962252291
    ! x[2] = aux2 =  0.8320502943378437
    ! x[3] = aux3 = -0.4432265940102775
    ! x[4] = aux4 =  0.8964096085841832
    ! x[5] = aux1 =  0.5547001962252291
    ! x[6] = aux2 =  0.8320502943378437
    ! x[7] = aux3 = -0.4432265940102775
    ! x[8] = aux4 =  0.8964096085841832
    ! x[9] = 0
    ! end of best known solution belonging to the revised case
  End Equations
End Model
