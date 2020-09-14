Model tp117r1
  ! Source version 1

  ! This is the exact formulation of #117r.
  ! It seems that this is the devil of the H+S model collection.
  ! To find the solution with high precision, the benevolent variant,
  ! tp117r3, is quite better suited than the original, tp117r1 here.
  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    a24a = 4/10 ! from PROB.FOR
    a24b = 4    ! from H+S, seems to be a typo
    a24  = a24a ! my decision is irrelevant,
                ! a24 appears as a summand (-1)*a24*x[2] in ineq[4]
                ! and x[2] is going to vanish; see also tp117r2
    a[ 1][1] = -16
    a[ 1][2] =   2
    a[ 1][3] =   0
    a[ 1][4] =   1
    a[ 1][5] =   0
    a[ 2][1] =   0
    a[ 2][2] =  -2
    a[ 2][3] =   0
    a[ 2][4] = a24
    a[ 2][5] =   2
    a[ 3][1] = -35/10
    a[ 3][2] =   0
    a[ 3][3] =   2
    a[ 3][4] =   0
    a[ 3][5] =   0
    a[ 4][1] =   0
    a[ 4][2] =  -2
    a[ 4][3] =   0
    a[ 4][4] =  -4
    a[ 4][5] =  -1
    a[ 5][1] =   0
    a[ 5][2] =  -9
    a[ 5][3] =  -2
    a[ 5][4] =   1
    a[ 5][5] = -28/10
    a[ 6][1] =   2
    a[ 6][2] =   0
    a[ 6][3] =  -4
    a[ 6][4] =   0
    a[ 6][5] =   0
    a[ 7][1] =  -1
    a[ 7][2] =  -1
    a[ 7][3] =  -1
    a[ 7][4] =  -1
    a[ 7][5] =  -1
    a[ 8][1] =  -1
    a[ 8][2] =  -2
    a[ 8][3] =  -3
    a[ 8][4] =  -2
    a[ 8][5] =  -1
    a[ 9][1] =   1
    a[ 9][2] =   2
    a[ 9][3] =   3
    a[ 9][4] =   4
    a[ 9][5] =   5
    a[10][1] =   1
    a[10][2] =   1
    a[10][3] =   1
    a[10][4] =   1
    a[10][5] =   1
    b[ 1] = -40
    b[ 2] =  -2
    b[ 3] =  -1/4
    b[ 4] =  -4
    b[ 5] =  -4
    b[ 6] =  -1
    b[ 7] = -40
    b[ 8] = -60
    b[ 9] =   5
    b[10] =   1
    c[1][1] =  30
    c[1][2] = -20
    c[1][3] = -10
    c[1][4] =  32
    c[1][5] = -10
    c[2][1] = -20
    c[2][2] =  39
    c[2][3] =  -6
    c[2][4] = -31
    c[2][5] =  32
    c[3][1] = -10
    c[3][2] =  -6
    c[3][3] =  10
    c[3][4] =  -6
    c[3][5] = -10
    c[4][1] =  32
    c[4][2] = -31
    c[4][3] =  -6
    c[4][4] =  39
    c[4][5] = -20
    c[5][1] = -10
    c[5][2] =  32
    c[5][3] = -10
    c[5][4] = -20
    c[5][5] =  30
    d[1] =   4
    d[2] =   8
    d[3] =  10
    d[4] =   6
    d[5] =   2
    e[1] = -15
    e[2] = -27
    e[3] = -36
    e[4] = -18
    e[5] = -12
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
    sumcx[1:5][0] = 0
    sumax[1:5][0] = 0
    sumbx[0] = 0
    sumcxxi[1:5][0] = 0
    sumcxx[0] = 0
    sumdx[0] = 0
  End Parameters

  Variables
    x[1:15] = ivx[1:15], >= lbx[1:15]
    obj
  End Variables

  Intermediates
    sumcx[1][1:5] = sumcx[1][0:4] + c[1:5][1]*x[11:15]
    sumcx[2][1:5] = sumcx[2][0:4] + c[1:5][2]*x[11:15]
    sumcx[3][1:5] = sumcx[3][0:4] + c[1:5][3]*x[11:15]
    sumcx[4][1:5] = sumcx[4][0:4] + c[1:5][4]*x[11:15]
    sumcx[5][1:5] = sumcx[5][0:4] + c[1:5][5]*x[11:15]
    sumax[1][1:10] = sumax[1][0:9] + a[1:10][1]*x[1:10]
    sumax[2][1:10] = sumax[2][0:9] + a[1:10][2]*x[1:10]
    sumax[3][1:10] = sumax[3][0:9] + a[1:10][3]*x[1:10]
    sumax[4][1:10] = sumax[4][0:9] + a[1:10][4]*x[1:10]
    sumax[5][1:10] = sumax[5][0:9] + a[1:10][5]*x[1:10]
    ineq[1:5] = 2*sumcx[1:5][5] + 3*d[1:5]*x[11:15]^2 + e[1:5] &
              - sumax[1:5][10]
    sumbx[1:10] = sumbx[0:9] + b[1:10]*x[1:10]
    sumcxxi[1][1:5] = sumcxxi[1][0:4] + c[1:5][1]*x[11:15]*x[11]
    sumcxxi[2][1:5] = sumcxxi[2][0:4] + c[1:5][2]*x[11:15]*x[12]
    sumcxxi[3][1:5] = sumcxxi[3][0:4] + c[1:5][3]*x[11:15]*x[13]
    sumcxxi[4][1:5] = sumcxxi[4][0:4] + c[1:5][4]*x[11:15]*x[14]
    sumcxxi[5][1:5] = sumcxxi[5][0:4] + c[1:5][5]*x[11:15]*x[15]
    sumcxx[1:5] = sumcxx[0:4] + sumcxxi[1:5][5]
    sumdx[1:5] = sumdx[0:4] + d[1:5]*x[11:15]^3
    mf = (-1)*sumbx[10] + sumcxx[5] + 2*sumdx[5]
  End Intermediates

  Equations
    ineq[1:5] >= 0

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
