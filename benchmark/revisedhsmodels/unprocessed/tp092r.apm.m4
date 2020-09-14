Model tp092r
  ! Source version 2

  ! The present file has to be drawn through the m4 macro processor
  ! at first, with or without `-Drevisedhs'. With the macro
  ! defined, the feasible domain is reduced in comparison with the H+S
  ! one such that the solution becomes unique.

  ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

  Parameters
    mu12[ 1] =  0.8603335890194
    mu12[ 2] =  3.4256184594817
    mu12[ 3] =  6.4372981791719
    mu12[ 4] =  9.5293344053620
    mu12[ 5] = 12.6452872238566
    mu12[ 6] = 15.7712848748159
    mu12[ 7] = 18.9024099568600
    mu12[ 8] = 22.0364967279386
    mu12[ 9] = 25.1724463266467
    mu12[10] = 28.3096428544520
    mu12[11] = 31.4477146375462
    mu12[12] = 34.5864242152889
    mu12[13] = 37.7256128277765
    mu12[14] = 40.8651703304881
    mu12[15] = 44.0050179208308
    mu12[16] = 47.1450977367610
    mu12[17] = 50.2853663377737
    mu12[18] = 53.4257904773947
    mu12[19] = 56.5663442798215
    mu12[20] = 59.7070073053355
    mu12[21] = 62.8477631944545
    mu12[22] = 65.9885986984904
    mu12[23] = 69.1295029738953
    mu12[24] = 72.2704670603090
    mu12[25] = 75.4114834888482
    mu12[26] = 78.5525459842429
    mu12[27] = 81.6936492356017
    mu12[28] = 84.8347887180423
    mu12[29] = 87.9759605524932
    mu12[30] = 91.1171613944647
    tg12[1:30] = tan(mu12[1:30])
    mu24[1:30] = (1 + mu12[1:30]^2*(1 + tg12[1:30]^2)) &
               / (tg12[1:30] + mu12[1:30]*(1 + tg12[1:30]^2))
    tg24[1:30] = tan(mu24[1:30])
    mu48[1:30] = (1 + mu24[1:30]^2*(1 + tg24[1:30]^2)) &
               / (tg24[1:30] + mu24[1:30]*(1 + tg24[1:30]^2))
    mu[1:30] = mu48[1:30]
    isign[1] = 1
    isign[2:30] = (-1)*isign[1:29]
    snmu[1:30] = isign[1:30]*sqrt(1/(1 + mu[1:30]^2))
    csmu[1:30] = isign[1:30]*sqrt(mu[1:30]^2/(1 + mu[1:30]^2))
    snmuxcsmu[1:30] = mu[1:30]/(1 + mu[1:30]^2)
    aux2[1:30] = snmuxcsmu[1:30]/(2*mu[1:30]) + 1/2
    aux4[1:30] = (-2)*snmu[1:30]/mu[1:30] + 2*csmu[1:30]
    A[1:30] = 2*snmu[1:30]/(mu[1:30] + snmuxcsmu[1:30])
    hsum[0] = 2/15
    mfcorrhs = 0
  End Parameters

  Variables
    x[1] =  1/2 ifelse(stricths,1,`',`, >=  1/10')
    x[2] = -1/2 ifelse(stricths,1,`',`, <=  0')
    x[3] =  1/2 ifelse(stricths,1,`',`, >=  1/10')
    x[4] = -1/2 ifelse(stricths,1,`',`, <=  0')
    x[5] =  1/2 ifelse(stricths,1,`',`, >=  1/10')
    x[6] = -1/2 ifelse(stricths,1,`',`, <= -1/10')
    obj
  End Variables

  Intermediates
    emx[1][1:30] = exp(-mu[1:30]^2*x[1]^2)
    emx[2][1:30] = exp(-mu[1:30]^2*x[2]^2)
    emx[3][1:30] = exp(-mu[1:30]^2*x[3]^2)
    emx[4][1:30] = exp(-mu[1:30]^2*x[4]^2)
    emx[5][1:30] = exp(-mu[1:30]^2*x[5]^2)
    emx[6][1:30] = exp(-mu[1:30]^2*x[6]^2)
    rhoaux[6][1:30] = 1*emx[1][1:30]*emx[2][1:30]*emx[3][1:30] &
                       *emx[4][1:30]*emx[5][1:30]*emx[6][1:30] &
                    - 2*emx[2][1:30]*emx[3][1:30]*emx[4][1:30] &
                                    *emx[5][1:30]*emx[6][1:30] &
                    + 2*emx[3][1:30]*emx[4][1:30]*emx[5][1:30] &
                                                 *emx[6][1:30] &
                    - 2*emx[4][1:30]*emx[5][1:30]*emx[6][1:30] &
                    + 2*emx[5][1:30]*emx[6][1:30] &
                    - 2*emx[6][1:30] &
                    + 1
    rho[1:30] = (-1)*rhoaux[6][1:30]/mu[1:30]^2
    aux1[1:30] = A[1:30]^2*rhoaux[6][1:30]^2
    aux3[1:30] = A[1:30]*rho[1:30]
    hsum[1:30] = hsum[0:29] + aux1[1:30]*aux2[1:30] &
                            + aux3[1:30]*aux4[1:30]
    h = hsum[30]
    mfcorrr = (-1)*x[2] + (x[3] - 6/10)^2 - x[4] + (x[5] - 7/10)^2
  End Intermediates

  Equations
    0.0001 - h >= 0

    ! the problem is pretty ill-posed; though the best known
    ! objective is quite stable the solution is capricious
    ! without additional pressure
    obj = x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 + x[5]^2 + x[6]^2 &
        + ifelse(stricths,1,`mfcorrhs',`mfcorrr')

    ! best known objective = 1.362656814889885
    ! begin of best known solution belonging to the revised case
    ! x[1] =  0.5515076937481547
    ! x[2] =  0
    ! x[3] =  0.6
    ! x[4] =  0
    ! x[5] =  0.7
    ! x[6] = -0.456613708320804
    ! end of best known solution belonging to the revised case
  End Equations
End Model
