# CASADI_ROOT_DIR  =  /home/andrea/feasible_sqp/external/casadi
CASADI_ROOT_DIR =      /home/andrea/feasible_sqp/.fsqp/lib/python3.8/site-packages/casadi
# CASADI_LIB_DIR = ${CASADI_ROOT_DIR}/installation/lib
CASADI_LIB_DIR =       /home/andrea/feasible_sqp/.fsqp/lib/python3.8/site-packages/casadi
CASADI_IPOPT_LIB_DIR = /home/andrea/feasible_sqp/.fsqp/lib/python3.8/site-packages/casadi

##
##	flags
##

IFLAGS      =  -I. \
			   -I${CASADI_ROOT_DIR}/include
# -I${CASADI_ROOT_DIR}/installation/include

OUTPUT_DIR = bin

IPOPT_EXES = ${OUTPUT_DIR}/ipopt_nl${EXE}
CGEN_EXES  = ${OUTPUT_DIR}/generate_casadi_functions${EXE}

$(info CASADI_ROOT_DIR is ${CASADI_ROOT_DIR})
$(info EXE is ${EXE})

CPP = g++
CC  = gcc
AR  = ar
RM  = rm
F77 = gfortran
ECHO = echo
CD = cd
CP = cp

OBJEXT = o
LIBEXT = a
DLLEXT = so
EXE =
DEF_TARGET = -o $@
SHARED = -shared

CPPFLAGS = -Wall -pedantic -Wshadow -Wfloat-equal -O3 -Wconversion -Wsign-conversion -fPIC -D_GLIBCXX_USE_CXX11_ABI=0
CPPFLAGS += -std=c++11 -g
LINK_LIBRARIES += -lcasadi -lcasadi_nlpsol_ipopt
LIB_DIR = -L${CASADI_LIB_DIR} -L${CASADI_IPOPT_LIB_DIR}  

##
##	targets
##

all: ${IPOPT_EXES} ${CGEN_EXES}

${OUTPUT_DIR}/%${EXE}: %.${OBJEXT}
	@${ECHO} $@
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${CPPFLAGS}  $< ${LIB_DIR}  ${LINK_LIBRARIES}

${OUTPUT_DIR}/ipopt_nl${EXE}: ipopt_nl.${OBJEXT}
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${CPPFLAGS}  $< ${LIB_DIR}$  ${LINK_LIBRARIES}

${OUTPUT_DIR}/generate_casadi_functions${EXE}: generate_casadi_functions.${OBJEXT}
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${CPPFLAGS}  $< ${LIB_DIR}$  ${LINK_LIBRARIES}

clean:
	@${ECHO} "Cleaning up (benchmark)"
	@${RM} -f *.${OBJEXT} ${BENCHMARK_EXES}

clobber: clean

ipopt_nl.${OBJEXT}: ipopt_nl.cpp
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${IFLAGS} ${CPPFLAGS} -c $<

%.${OBJEXT}: %.cpp
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} -c ${IFLAGS} ${CPPFLAGS} $<

##
##	end of file
##
