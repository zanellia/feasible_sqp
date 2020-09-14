Model tp117r2
  ! Source version 1

  ! This is a condensed formulation of #117r for human readers.
  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    a24a = 4/10 ! from PROB.FOR
    a24b = 4    ! from H+S, seems to be a typo
    a24  = a24a ! my decision is irrelevant,
                ! a24 appears as a summand (-1)*a24*x[2] in c[4]
                ! and x[2] is going to vanish
    ivxhs[1: 6] =  0.001
    ivxhs[7: 7] = 60
    ivxhs[8:15] =  0.001
    lbx[ 1] = ifelse(stricths,1,`0',`0')
    lbx[ 2] = ifelse(stricths,1,`0',`0')
    lbx[ 3] = ifelse(stricths,1,`0',`1')
    lbx[ 4] = ifelse(stricths,1,`0',`0')
    lbx[ 5] = ifelse(stricths,1,`0',`1')
    lbx[ 6] = ifelse(stricths,1,`0',`1')
    lbx[ 7] = ifelse(stricths,1,`0',`0')
    lbx[ 8] = ifelse(stricths,1,`0',`0')
    lbx[ 9] = ifelse(stricths,1,`0',`0.09')
    lbx[10] = ifelse(stricths,1,`0',`0')
    lbx[11] = ifelse(stricths,1,`0',`0.1')
    lbx[12] = ifelse(stricths,1,`0',`0.3')
    lbx[13] = ifelse(stricths,1,`0',`0.3')
    lbx[14] = ifelse(stricths,1,`0',`0.2')
    lbx[15] = ifelse(stricths,1,`0',`0.1')
    ! make the initial point feasible
    ! ivx[1:15] = max(ivxhs[1:15],lbx[1:15])
    ! max() expressed by abs() for APMonitor
    ivx[1:15] = (1/2)*(abs(ivxhs[1:15] - lbx[1:15]) + &
                          (ivxhs[1:15] + lbx[1:15]))
  End Parameters

  Variables
    x[1:15] = ivx[1:15], >= lbx[1:15]
    obj
  End Variables

  Intermediates
    c[1] = (-15) + 16*x[1] + (7/2)*x[3] - 2*x[6] + x[7] + x[8]       &
         - x[9] - x[10] + 60*x[11] - 40*x[12] - 20*x[13] + 64*x[14]  &
         - 20*x[15] + 12*x[11]^2
    c[2] = (-27) - 2*x[1] + 2*x[2] + 2*x[4] + 9*x[5] + x[7] + 2*x[8] &
         - 2*x[9] - x[10] - 40*x[11] + 78*x[12] - 12*x[13]           &
         - 62*x[14] + 64*x[15] + 24*x[12]^2
    c[3] = (-36) - 2*x[3] + 2*x[5] + 4*x[6] + x[7] + 3*x[8] - 3*x[9] &
         - x[10] - 20*x[11] - 12*x[12] + 20*x[13] - 12*x[14]         &
         - 20*x[15] + 30*x[13]^2
    c[4] = (-18) - x[1] - a24*x[2] + 4*x[4] - x[5] + x[7] + 2*x[8]   &
         - 4*x[9] - x[10] + 64*x[11] - 62*x[12] - 12*x[13]           &
         + 78*x[14] - 40*x[15] + 18*x[14]^2
    c[5] = (-12) - 2*x[2] + x[4] + (14/5)*x[5] + x[7] + x[8]         &
         - 5*x[9] - x[10] - 20*x[11] + 64*x[12] - 20*x[13]           &
         - 40*x[14] + 60*x[15] + 6*x[15]^2
    mf   = 40*x[1] + 2*x[2] + (1/4)*x[3] + 4*x[4] + 4*x[5] + x[6]    &
         + 40*x[7] + 60*x[8] - 5*x[9] - x[10] + 30*x[11]^2           &
         - 40*x[11]*x[12] - 20*x[11]*x[13] + 64*x[11]*x[14]          &
         - 20*x[11]*x[15] + 39*x[12]^2 - 12*x[12]*x[13]              &
         - 62*x[12]*x[14] + 64*x[12]*x[15] + 10*x[13]^2              &
         - 12*x[13]*x[14] - 20*x[13]*x[15] + 39*x[14]^2              &
         - 40*x[14]*x[15] + 30*x[15]^2 + 8*x[11]^3 + 16*x[12]^3      &
         + 20*x[13]^3 + 12*x[14]^3 + 4*x[15]^3
  End Intermediates

  Equations
    c[1:5] >= 0

    obj = mf

    ! best known objective = 32.34867896572271
    ! begin of best known solution belonging to the revised case
    ! x[ 1] =  0
    ! x[ 2] =  0
    ! x[ 3] =  5.174040727698173
    ! x[ 4] =  0
    ! x[ 5] =  3.06110868775845
    ! x[ 6] = 11.83954566480073
    ! x[ 7] =  0
    ! x[ 8] =  0
    ! x[ 9] =  0.1038961907706158
    ! x[10] =  0
    ! x[11] =  0.3
    ! x[12] =  0.3334676065346071
    ! x[13] =  0.4
    ! x[14] =  0.4283101047816988
    ! x[15] =  0.2239648735607981
    ! end of best known solution belonging to the revised case
  End Equations
End Model
