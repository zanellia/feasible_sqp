##
##	This file is part of qpOASES.
##
##	qpOASES -- An Implementation of the Online Active Set Strategy.
##	Copyright (C) 2007-2017 by Hans Joachim Ferreau, Andreas Potschka,
##	Christian Kirches et al. All rights reserved.
##
##	qpOASES is free software; you can redistribute it and/or
##	modify it under the terms of the GNU Lesser General Public
##	License as published by the Free Software Foundation; either
##	version 2.1 of the License, or (at your option) any later version.
##
##	qpOASES is distributed in the hope that it will be useful,
##	but WITHOUT ANY WARRANTY; without even the implied warranty of
##	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
##	See the GNU Lesser General Public License for more details.
##
##	You should have received a copy of the GNU Lesser General Public
##	License along with qpOASES; if not, write to the Free Software
##	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
##



##
##	Filename:  examples/Makefile
##	Author:    Hans Joachim Ferreau
##	Version:   3.2
##	Date:      2007-2017
##

QPOASES_DIR = ../../qpOASES
CASADI_INSTALL_DIR = ../../casadi/build/install/include

include ${QPOASES_DIR}/make.mk

##
##	flags
##

IFLAGS      =  -I. \
               -I${IDIR} \
			   -I${CASADI_INSTALL_DIR}

OUTPUT_DIR = ../bin

QPOASES_EXES = \
	${OUTPUT_DIR}/feasibleSQP${EXE}

CPPFLAGS += -std=c++11
# LINK_LIBRARIES += -l casadi
# QPOASES_LINK += -L ${CASADI_INSTALL_DIR}/lib

##
##	targets
##

all: ${QPOASES_EXES}

${OUTPUT_DIR}/%${EXE}: %.${OBJEXT} ${LINK_DEPENDS}
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${CPPFLAGS}  $< -L/home/andrea/casadi/build/install/lib -L/home/andrea/feasible_sqp/bin -lcasadi -lca_dfdy -lca_g  -lca_dgdy -lca_dLdyy ${QPOASES_LINK} ${LINK_LIBRARIES}

${OUTPUT_DIR}/feasibleSQP${EXE}: feasibleSQP.${OBJEXT} qrecipe_data.hpp ${LINK_DEPENDS}
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${CPPFLAGS}  $< -L /home/andrea/casadi/build/install/lib -L /home/andrea/feasible_sqp/bin -lcasadi  -lca_dfdy -lca_g  -lca_dgdy -lca_dLdyy ${QPOASES_LINK} ${LINK_LIBRARIES}


clean:
	@${ECHO} "Cleaning up (examples)"
	@${RM} -f *.${OBJEXT} ${QPOASES_EXES}

clobber: clean


${LINK_DEPENDS}:
	@cd ..; ${MAKE} -s src

feasibleSQP.${OBJEXT}: feasibleSQP.cpp qrecipe_data.hpp
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${IFLAGS} ${CPPFLAGS} -c $<

%.${OBJEXT}: %.cpp
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} -c ${IFLAGS} ${CPPFLAGS} $<


##
##	end of file
##
