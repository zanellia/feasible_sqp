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
include ${QPOASES_DIR}/make.mk

##
##	flags
##

IFLAGS      =  -I. \
               -I${IDIR}

QPOASES_EXES = \
	${BINDIR}/feasibleSQP${EXE}


##
##	targets
##

all: ${QPOASES_EXES}

${BINDIR}/%${EXE}: %.${OBJEXT} ${LINK_DEPENDS}
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${CPPFLAGS} $< ${QPOASES_LINK} ${LINK_LIBRARIES}

${BINDIR}/feasibleSQP${EXE}: feasibleSQP.${OBJEXT} qrecipe_data.hpp ${LINK_DEPENDS}
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${CPPFLAGS} $< ${QPOASES_LINK} ${LINK_LIBRARIES}


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
