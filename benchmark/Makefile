# CASADI_INSTALL_DIR = ../../casadi/build/install/include
CASADI_INSTALL_DIR = /usr/local

##
##	flags
##

IFLAGS      =  -I. \
			   -I${CASADI_INSTALL_DIR}/include

OUTPUT_DIR = ../bin

BENCHMARK_EXES = \
	${OUTPUT_DIR}/ipopt_nl${EXE}


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

CPPFLAGS = -Wall -pedantic -Wshadow -Wfloat-equal -O3 -Wconversion -Wsign-conversion -fPIC
CPPFLAGS += -std=c++11 -g
LINK_LIBRARIES += -lcasadi
LIB_DIR = -L${CASADI_INSTALL_DIR}/lib

##
##	targets
##

all: ${BENCHMARK_EXES}

${OUTPUT_DIR}/%${EXE}: %.${OBJEXT}
	@${ECHO} $@
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${CPPFLAGS}  $< ${LIB_DIR}  ${LINK_LIBRARIES}

${OUTPUT_DIR}/ipopt_nl${EXE}: ipopt_nl.${OBJEXT}
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
