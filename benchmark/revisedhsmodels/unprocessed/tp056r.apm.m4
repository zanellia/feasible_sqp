Model tp056r
  ! Source version 1

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that the solution becomes unique.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    mypi = 4*atan(1)
    c7 = 7
    c42 = 42
    c72 = 72
    a = asin(sqrt(10/c42))
    b = asin(sqrt(50/c72))
    c = asin(sqrt(4/c7))
    d = asin(sqrt(2/c7))
    e = mypi/2
    eps = 10^(-6)
  End Parameters

  Variables
    x[1:3] = 1
    x[4:6] = a ifelse(stricths,1,`',`, >= eps, <= e')
    x[7:7] = b ifelse(stricths,1,`',`, >= eps, <= e')
    obj
  End Variables

  Equations
    x[1] - 4.2*sin(x[4])^2 = 0
    x[2] - 4.2*sin(x[5])^2 = 0
    x[3] - 4.2*sin(x[6])^2 = 0
    x[1] + 2*x[2] + 2*x[3] - 7.2*sin(x[7])^2 = 0

    obj = (-1)*x[1]*x[2]*x[3]

    ! best known objective = -3.456
    ! begin of best known solution belonging to the revised case
    ! x[ 1] = 2.4
    ! x[ 2] = 1.2
    ! x[ 3] = 1.2
    ! x[ 4] = c = 0.857071947850131
    ! x[ 5] = d = 0.5639426413606288
    ! x[ 6] = d = 0.5639426413606288
    ! x[ 7] = e = 1.570796326794897
    ! end of best known solution belonging to the revised case
  End Equations
End Model
