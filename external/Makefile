QPOASES_ROOT_DIR = qpOASES
CASADI_ROOT_DIR = casadi

##
##	targets
##

qpoases: 
	cd ${QPOASES_ROOT_DIR}; mkdir -p bin; make -j4 src

casadi: 
	cd ${CASADI_ROOT_DIR}; mkdir -p build; mkdir -p installation; cd build; cmake ..; make -j4; make install DESTDIR=../installation 

all: qpoases casadi

clean_qpoases:
	@${ECHO} "Cleaning up qpOASES"
	cd ${QPOASES_ROOT_DIR}; make clean

clean_casadi:
	@${ECHO} "Cleaning up CasADi"
	cd ${QPOASES_ROOT_DIR}/build; make clean

clean: clean_qpoases clean_casadi

##
##	end of file
##
