QPOASES_ROOT_DIR = ../../external/qpOASES
CASADI_ROOT_DIR = ../../external/casadi

include ${QPOASES_ROOT_DIR}/make.mk

##
##	flags
##

IFLAGS      =  -I. \
               -I${IDIR} \
			   -I${CASADI_ROOT_DIR}

OUTPUT_DIR = bin

FEAS_SQP_EXES = \
	${OUTPUT_DIR}/feasibleSQP${EXE}

CPPFLAGS += -std=c++11 -g

##
##	targets
##

qpoases: 
	cd ${QPOASES_ROOT_DIR}; mkdir -p bin; make -j4 src

casadi: 
	cd ${CASADI_ROOT_DIR}; mkdir -p build; mkdir -p installation; cd build; cmake ..; make -j4; make install DESTDIR=../installation 

feasible_sqp: ${FEAS_SQP_EXES}

all: qpoases casadi feasible_sqp 

${OUTPUT_DIR}/%${EXE}: %.${OBJEXT} ${LINK_DEPENDS}
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${CPPFLAGS}  $< -L/home/andrea/casadi/build/install/lib -L${OUTPUT_DIR} -lcasadi -lca_dfdy -lca_g  -lca_dgdy -lca_dLdyy ${QPOASES_LINK} ${LINK_LIBRARIES}

${OUTPUT_DIR}/feasibleSQP${EXE}: feasibleSQP.${OBJEXT} ${LINK_DEPENDS}
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${CPPFLAGS}  $< -L /home/andrea/casadi/build/install/lib -L${OUTPUT_DIR} -lcasadi  -lca_dfdy -lca_g  -lca_dgdy -lca_dLdyy ${QPOASES_LINK} ${LINK_LIBRARIES}

clean_qpoases:
	@${ECHO} "Cleaning up qpOASES"
	cd ${QPOASES_ROOT_DIR}; make clean

clean_casadi:
	@${ECHO} "Cleaning up CasADi"
	cd ${QPOASES_ROOT_DIR}/build; make clean

clean_feasible_sqp:
	@${ECHO} "Cleaning up"
	@${RM} -f *.${OBJEXT} ${FEAS_SQP_EXES}

clean: clean_qpoases clean_casadi clean_feasible_sqp

${LINK_DEPENDS}:
	@cd ..; ${MAKE} -s src

feasibleSQP.${OBJEXT}: feasibleSQP.cpp
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} ${IFLAGS} ${CPPFLAGS} -c $<

%.${OBJEXT}: %.cpp
	@${ECHO} "Creating" $@
	@${CPP} ${DEF_TARGET} -c ${IFLAGS} ${CPPFLAGS} $<

##
##	end of file
##
