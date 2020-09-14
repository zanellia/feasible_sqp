fmcTitle ("tp068r3"):

# Source version 4

# FMC's first native input language.
# The Hock & Schittkowski test problem #68.
# This is the formulation of #68 to obtain the reference values for
# tp068r2, i.e., tp068r3 is equivalent to tp068r2 down to the last detail.
# The present file has to be drawn through the m4 macro processor
# at first, with or without `-Drevisedhs'. With the macro
# defined, the feasible domain is reduced in comparison with the H+S
# one such that some unwanted dead corner is excluded.

ifdef(`revisedhs',`define(`stricths',0)',`define(`stricths',1)')

a := 0.0001:
b := 1:
d := 1:
n := 24:
ubx2hs := 100:
            # phi0(x[2] = 6) > 9.8*10^(-10)
            # phi0(x[2] = 5) > 2.8*10^( -7)
ubx2r := 4: # phi0(x[2] = 4) > 3.1*10^( -5)
            # phi0(x[2] = 3) > 1.3*10^( -3)
            # phi0(x[2] = 2) > 2.2*10^( -2)
ubx2 := ifelse(stricths,1,`ubx2hs',`ubx2r'):

iv[1] := 1: slb[1] := 0.0001: sub[1] :=  100:
iv[2] := 1: slb[2] := 0:      sub[2] := ubx2:
iv[3] := 1: slb[3] := 0:      sub[3] :=    2:
iv[4] := 1: slb[4] := 0:      sub[4] :=    2:

for i from 1 to 4 do
  fmcInitialValue     (nprintf ("x%d", i),  iv[i]):
  fmcStrongLowerBound (nprintf ("x%d", i), slb[i]):
  fmcStrongUpperBound (nprintf ("x%d", i), sub[i]):
  od:

argn := (-1) * x2 - d * sqrt (n):
arg0 := (-1) * x2:
argp := (-1) * x2 + d * sqrt (n):
argnerfc := (-1) * argn / sqrt (2):
arg0erfc := (-1) * arg0 / sqrt (2):
argperfc := (-1) * argp / sqrt (2):
phin := (1/2) * myerfc (fmc_ident_tcb, argnerfc):
phi0 := (1/2) * myerfc (fmc_ident_tcb, arg0erfc):
phip := (1/2) * myerfc (fmc_ident_tcb, argperfc):
c[1] := x3 - 2 * phi0:
c[2] := x4 - phip - phin: # phin may vanish but not phip
num := b * (exp (x1) - 1) - x3:
den := exp (x1) - 1 + x4:
mf := (a * n - (num / den) * x4) / x1:

for j from 1 to 2 do
  fmcEquality (nprintf ("ce%d", j), c[j]):
  od:

fmcMinimum (mf):

fmcFunctionDiffHint ([ myerfc, 0,
  myerfcd (fmcFunctionArg1, fmcFunctionArg2) ]):

fmcExternalCodePath ("../../doc/RevisedHockSchittkowski/src/tp068r3x.c"):

fmcEscortFloat ('argnerfc', argnerfc):
fmcEscortFloat ('arg0erfc', arg0erfc):
fmcEscortFloat ('argperfc', argperfc):

fmcEscortFloat (derfcn, myerfc (fmc_ident_tcb, argnerfc) - erfc (argnerfc)):
fmcEscortFloat (derfc0, myerfc (fmc_ident_tcb, arg0erfc) - erfc (arg0erfc)):
fmcEscortFloat (derfcp, myerfc (fmc_ident_tcb, argperfc) - erfc (argperfc)):

fmcEscortFloat ('phin', phin):
fmcEscortFloat ('phi0', phi0):
fmcEscortFloat ('phip', phip):

# argnerfc =  6.042362036830880
# arg0erfc =  2.578260421693126
# argperfc = -0.8858411934446289

# derfcn =  2.9*10^(-17)
# derfc0 = -1.4*10^(-17)
# derfcp = -4.5*10^(-18)

# phin = 2.1*10^(-17)
# phi0 = 0.0001330678126076933
# phip = 0.8948550393735502

# best known objective = -0.9204250036397504
# begin of best known solution belonging to the revised case
# x[1] = x1 = 0.06785857708551205
# x[2] = x2 = 3.646210855688194
# x[3] = x3 = 0.0002661356252153867
# x[4] = x4 = 0.8948550393735502
# end of best known solution belonging to the revised case
