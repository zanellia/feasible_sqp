Model tp117r3
  ! Source version 1

  ! This is a benevolent formulation of #117r.
  ! Some coupling has been removed and
  ! the optimization goal is more explicitly defined.
  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that some unwanted secondary minimum is excluded.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    a24a = 4/10 ! from PROB.FOR
    a24b = 4    ! from H+S, seems to be a typo
    a24  = a24a ! my decision is irrelevant but done
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
    ! initialize in accordance with the bounds
    ! ivx[1:15] = max(ivxhs[1:15],lbx[1:15])
    ! max() expressed by abs() for APMonitor
    ivx[1:15] = (1/2)*(abs(ivxhs[1:15] - lbx[1:15]) + &
                          (ivxhs[1:15] + lbx[1:15]))
    ! Firstly, all the constant partial derivatives, see below.
    dx5bdx1   = 300/823
    dx5bdx2   = (-430/823) + (50/823)*a24
    dx5bdx4   = -360/823
    dx5bdx7   = -85/823
    dx5bdx8   = -260/823
    dx5bdx10  = 85/823
    dx5bdx13  = 300/823
    dx9bdx1   = 313/3292
    dx9bdx2   = (-869/1646) - (85/3292)*a24
    dx9bdx4   = 153/823
    dx9bdx7   = 139/823
    dx9bdx8   = 221/1646
    dx9bdx10  = -139/823
    dx9bdx13  = -3008/823
    dx11bdx1  = 359/13168
    dx11bdx2  = (-271/6584) + (197/13168)*a24
    dx11bdx4  = -95/1646
    dx11bdx7  = -11/1646
    dx11bdx8  = -183/6584
    dx11bdx10 = 11/1646
    dx11bdx13 = -29/823
  End Parameters

  Variables
    x[1:15] = ivx[1:15], >= lbx[1:15]
    obj
  End Variables

  Intermediates
    ! Taking the inequalities of the original problem as equalities,
    ! we consider x[3], x[5], x[6], x[9], and x[11] as
    ! x[ 3] = x[ 3](x[1],x[2],x[4],x[7],x[8],x[10],x[12],...,x[15]),
    ! x[ 5] = x[ 5](x[1],x[2],x[4],x[7],x[8],x[10],x[12],...,x[15]),
    ! x[ 6] = x[ 6](x[1],x[2],x[4],x[7],x[8],x[10],x[12],...,x[15]),
    ! x[ 9] = x[ 9](x[1],x[2],x[4],x[7],x[8],x[10],x[12],...,x[15]),
    ! x[11] = x[11](x[1],x[2],x[4],x[7],x[8],x[10],x[12],...,x[15]),
    ! but we do not eliminate them completely.
    ! Next, all the varying partial derivatives.
    aux = 3453/13168 + (359/13168)*x[1] - (271/6584)*x[2]            &
        + (197/13168)*a24*x[2] - (95/1646)*x[4] - (11/1646)*x[7]     &
        - (183/6584)*x[8] + (11/1646)*x[10] + (2257/1646)*x[12]      &
        - (29/823)*x[13] - (2243/1646)*x[14] + (881/823)*x[15]       &
        - (243/1646)*x[12]^2 - (1773/6584)*x[14]^2                   &
        + (285/3292)*x[15]^2
    dx3bdx1   = (-57577/8230) - (1077/4115)*aux
    dx3bdx2   = 415/823 - (575/1646)*a24 + (1626/4115)*aux           &
              - (591/4115)*a24*aux
    dx3bdx4   = 1247/823 + (456/823)*aux
    dx3bdx7   = (-1054/4115) + (264/4115)*aux
    dx3bdx8   = (-151/823) + (1098/4115)*aux
    dx3bdx10  = 1054/4115 - (264/4115)*aux
    dx3bdx12  = (-7744/4115) + (4872/823)*x[12] - (54168/4115)*aux   &
              + (11664/4115)*aux*x[12]
    dx3bdx13  = 744/823 - 12*x[13] + (1392/4115)*aux
    dx3bdx14  = 6392/4115 + (10350/823)*x[14] + (53832/4115)*aux     &
              + (21276/4115)*aux*x[14]
    dx3bdx15  = (-1488/823) - (1272/823)*x[15] - (42288/4115)*aux    &
              - (1368/823)*aux*x[15]
    dx5bdx12  = (-890/823) - (6000/823)*x[12]
    dx5bdx14  = 250/823 - (1800/823)*x[14]
    dx5bdx15  = (-600/823) + (1080/823)*x[15]
    dx6bdx1   = (-114319/32920) - (1077/8230)*aux
    dx6bdx2   = (-291/3292) - (985/6584)*a24 + (813/4115)*aux        &
              - (591/8230)*a24*aux
    dx6bdx4   = 2723/3292 + (228/823)*aux
    dx6bdx7   = (-1919/8230) + (132/4115)*aux
    dx6bdx8   = (-2377/3292)+ (549/4115)*aux
    dx6bdx10  = 1919/8230 - (132/4115)*aux
    dx6bdx12  = 59618/4115 + (2430/823)*x[12] - (27084/4115)*aux     &
              + (5832/4115)*aux*x[12]
    dx6bdx13  = (-6294/823) - 21*x[13] + (696/4115)*aux
    dx6bdx14  = (-20464/4115) + (8865/1646)*x[14] + (26916/4115)*aux &
              + (10638/4115)*aux*x[14]
    dx6bdx15  = 12588/823 + (1044/823)*x[15] - (21144/4115)*aux      &
              - (684/823)*aux*x[15]
    dx9bdx12  = 5522/823 - (2388/823)*x[12]
    dx9bdx14  = (-1958/823) + (765/823)*x[14]
    dx9bdx15  = 6016/823 + (2010/823)*x[15]
    dx11bdx12 = 2257/1646 - (243/823)*x[12]
    dx11bdx14 = (-2243/1646) - (1773/3292)*x[14]
    dx11bdx15 = 881/823 + (285/1646)*x[15]
    ! The definition of x[3].
    c[ 1] = (-42201/8230) + (57577/8230)*x[1] - (415/823)*x[2]       &
          + (575/1646)*a24*x[2] + x[3] - (1247/823)*x[4]             &
          + (1054/4115)*x[7] + (151/823)*x[8] - (1054/4115)*x[10]    &
          + (7744/4115)*x[12] - (744/823)*x[13] - (6392/4115)*x[14]  &
          + (1488/823)*x[15] - (2436/823)*x[12]^2 + 6*x[13]^2        &
          - (5175/823)*x[14]^2 + (636/823)*x[15]^2 + (24/5)*aux^2
    ! The definition of x[5].
    c[ 2] = (-3195/823) - (300/823)*x[1] + (430/823)*x[2]            &
          - (50/823)*a24*x[2] + (360/823)*x[4] + x[5]                &
          + (85/823)*x[7] + (260/823)*x[8] - (85/823)*x[10]          &
          + (890/823)*x[12] - (300/823)*x[13] - (250/823)*x[14]      &
          + (600/823)*x[15] + (3000/823)*x[12]^2 + (900/823)*x[14]^2 &
          - (540/823)*x[15]^2
    ! The definition of x[6].
    c[ 3] = (-328467/32920) + (114319/32920)*x[1] + (291/3292)*x[2]  &
          + (985/6584)*a24*x[2] - (2723/3292)*x[4] + x[6]            &
          + (1919/8230)*x[7] + (2377/3292)*x[8] - (1919/8230)*x[10]  &
          - (59618/4115)*x[12] + (6294/823)*x[13]                    &
          + (20464/4115)*x[14] - (12588/823)*x[15]                   &
          - (1215/823)*x[12]^2 + (21/2)*x[13]^2                      &
          - (8865/3292)*x[14]^2 - (522/823)*x[15]^2 + (12/5)*aux^2
    ! The definition of x[9].
    c[ 4] = 4197/3292 - (313/3292)*x[1] + (869/1646)*x[2]            &
          + (85/3292)*a24*x[2] - (153/823)*x[4] - (139/823)*x[7]     &
          - (221/1646)*x[8] + x[9] + (139/823)*x[10]                 &
          - (5522/823)*x[12] + (3008/823)*x[13] + (1958/823)*x[14]   &
          - (6016/823)*x[15] + (1194/823)*x[12]^2                    &
          - (765/1646)*x[14]^2 - (1005/823)*x[15]^2
    ! The same for x[11], but x[11] is not completely decoupled.
    c[ 5] = (-3453/13168) - (359/13168)*x[1] + (271/6584)*x[2]       &
          - (197/13168)*a24*x[2] + (95/1646)*x[4] + (11/1646)*x[7]   &
          + (183/6584)*x[8] - (11/1646)*x[10] + x[11]                &
          - (2257/1646)*x[12] + (29/823)*x[13] + (2243/1646)*x[14]   &
          - (881/823)*x[15] + (243/1646)*x[12]^2                     &
          + (1773/6584)*x[14]^2 - (285/3292)*x[15]^2
    ! We take into account that if the partial derivative of mf
    ! with respect to a variable cannot vanish for some reason,
    ! then the variable has to do so.
    c[ 6] = (40 + (1/4)*dx3bdx1 + 4*dx5bdx1 + dx6bdx1 - 5*dx9bdx1 +  &
             60*dx11bdx1*x[11] - 40*dx11bdx1*x[12] -                 &
             20*dx11bdx1*x[13] + 64*dx11bdx1*x[14] -                 &
             20*dx11bdx1*x[15] + 24*dx11bdx1*x[11]^2)*x[1]
    c[ 7] = (2 + (1/4)*dx3bdx2 + 4*dx5bdx2 + dx6bdx2 - 5*dx9bdx2 +   &
             60*dx11bdx2*x[11] - 40*dx11bdx2*x[12] -                 &
             20*dx11bdx2*x[13] + 64*dx11bdx2*x[14] -                 &
             20*dx11bdx2*x[15] + 24*dx11bdx2*x[11]^2)*x[2]
    c[ 8] = (4 + (1/4)*dx3bdx4 + 4*dx5bdx4 + dx6bdx4 - 5*dx9bdx4 +   &
             60*dx11bdx4*x[11] - 40*dx11bdx4*x[12] -                 &
             20*dx11bdx4*x[13] + 64*dx11bdx4*x[14] -                 &
             20*dx11bdx4*x[15] + 24*dx11bdx4*x[11]^2)*x[4]
    c[ 9] = (40 + (1/4)*dx3bdx7 + 4*dx5bdx7 + dx6bdx7 - 5*dx9bdx7 +  &
             60*dx11bdx7*x[11] - 40*dx11bdx7*x[12] -                 &
             20*dx11bdx7*x[13] + 64*dx11bdx7*x[14] -                 &
             20*dx11bdx7*x[15] + 24*dx11bdx7*x[11]^2)*x[7]
    c[10] = (60 + (1/4)*dx3bdx8 + 4*dx5bdx8 + dx6bdx8 - 5*dx9bdx8 +  &
             60*dx11bdx8*x[11] - 40*dx11bdx8*x[12] -                 &
             20*dx11bdx8*x[13] + 64*dx11bdx8*x[14] -                 &
             20*dx11bdx8*x[15] + 24*dx11bdx8*x[11]^2)*x[8]
    c[11] = ((-1) + (1/4)*dx3bdx10 + 4*dx5bdx10 + dx6bdx10 -         &
             5*dx9bdx10 + 60*dx11bdx10*x[11] - 40*dx11bdx10*x[12] -  &
             20*dx11bdx10*x[13] + 64*dx11bdx10*x[14] -               &
             20*dx11bdx10*x[15] + 24*dx11bdx10*x[11]^2)*x[10]
    ! The remainder is treated as usual.
    c[12] = (1/4)*dx3bdx12 + 4*dx5bdx12 + dx6bdx12 - 5*dx9bdx12      &
          - 40*x[11] + 78*x[12] - 12*x[13] - 62*x[14] + 64*x[15]     &
          + 60*dx11bdx12*x[11] - 40*dx11bdx12*x[12]                  &
          - 20*dx11bdx12*x[13] + 64*dx11bdx12*x[14]                  &
          - 20*dx11bdx12*x[15] + 48*x[12]^2 + 24*dx11bdx12*x[11]^2
    c[13] = (1/4)*dx3bdx13 + 4*dx5bdx13 + dx6bdx13 - 5*dx9bdx13      &
          - 20*x[11] - 12*x[12] + 20*x[13] - 12*x[14] - 20*x[15]     &
          + 60*dx11bdx13*x[11] - 40*dx11bdx13*x[12]                  &
          - 20*dx11bdx13*x[13] + 64*dx11bdx13*x[14]                  &
          - 20*dx11bdx13*x[15] + 60*x[13]^2 + 24*dx11bdx13*x[11]^2
    c[14] = (1/4)*dx3bdx14 + 4*dx5bdx14 + dx6bdx14 - 5*dx9bdx14      &
          + 64*x[11] - 62*x[12] - 12*x[13] + 78*x[14] - 40*x[15]     &
          + 60*dx11bdx14*x[11] - 40*dx11bdx14*x[12]                  &
          - 20*dx11bdx14*x[13] + 64*dx11bdx14*x[14]                  &
          - 20*dx11bdx14*x[15] + 36*x[14]^2 + 24*dx11bdx14*x[11]^2
    c[15] = (1/4)*dx3bdx15 + 4*dx5bdx15 + dx6bdx15 - 5*dx9bdx15      &
          - 20*x[11] + 64*x[12] - 20*x[13] - 40*x[14] + 60*x[15]     &
          + 60*dx11bdx15*x[11] - 40*dx11bdx15*x[12]                  &
          - 20*dx11bdx15*x[13] + 64*dx11bdx15*x[14]                  &
          - 20*dx11bdx15*x[15] + 12*x[15]^2 + 24*dx11bdx15*x[11]^2
    ! Our objective function has no meaning anymore,
    ! but we want to see its value.
    mf    = 40*x[1] + 2*x[2] + (1/4)*x[3] + 4*x[4] + 4*x[5] + x[6]   &
          + 40*x[7] + 60*x[8] - 5*x[9] - x[10] + 30*x[11]^2          &
          - 40*x[11]*x[12] - 20*x[11]*x[13] + 64*x[11]*x[14]         &
          - 20*x[11]*x[15] + 39*x[12]^2 - 12*x[12]*x[13]             &
          - 62*x[12]*x[14] + 64*x[12]*x[15] + 10*x[13]^2             &
          - 12*x[13]*x[14] - 20*x[13]*x[15] + 39*x[14]^2             &
          - 40*x[14]*x[15] + 30*x[15]^2 + 8*x[11]^3 + 16*x[12]^3     &
          + 20*x[13]^3 + 12*x[14]^3 + 4*x[15]^3
  End Intermediates

  Equations
    c[1:15] = 0

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
