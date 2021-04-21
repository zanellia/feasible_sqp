QPOASES_ROOT_DIR = qpOASES
CASADI_ROOT_DIR = casadi
USE_SOLVER=MA57
REPLACE_LINALG=0

# MATLAB_LIBDIR=/usr/local/MATLAB/R2017b/bin/glnxa64
# MATLAB_IDIR=/usr/local/MATLAB/R2017b/extern/include

# specify either 
# MATLAB_LIBDIR and MATLAB_IDIR 
# or
# LIB_BLAS
# LIB_LAPACK
# LIB_SOLVER
# LINKHSL

ifdef MATLAB_LIBDIR
ifndef MATLAB_IDIR
$(error MATLAB_IDIR is not set)
endif
LIB_BLAS = ${MATLAB_LIBDIR}/libmwblas.so
LIB_LAPACK = ${MATLAB_LIBDIR}/libmwlapack.so
LIB_SOLVER = ${MATLAB_LIBDIR}/libmwma57.so
LINKHSL = -Wl,-rpath=${MATLAB_LIBDIR}
endif

ifndef LIB_BLAS
$(error LIB_BLAS is not set)
endif

ifndef LIB_LAPACK
$(error LIB_LAPACK is not set)
endif

ifndef LIB_SOLVER
$(error LIB_SOLVER is not set)
endif

ifndef LINKHSL
$(error LINKHSL is not set)
endif

##
##	targets
##

all: qpoases casadi

qpoases: 
	cd ${QPOASES_ROOT_DIR}; mkdir -p bin; make -j4 MATLAB_IDIR=${MATLAB_IDIR} MATLAB_LIBDIR=${MATLAB_LIBDIR} USE_SOLVER=${USE_SOLVER} LIB_BLAS=${LIB_BLAS} LIB_LAPACK=${LIB_LAPACK} REPLACE_LINALG=${REPLACE_LINALG} src

casadi: 
	cd ${CASADI_ROOT_DIR} && mkdir -p build && mkdir -p installation && cd build && cmake -DCMAKE_INSTALL_PREFIX=$(pwd)/../installation .. && make -j4 && make install

.PHONY:	casadi 

clean_qpoases:
	cd ${QPOASES_ROOT_DIR} && make clean

clean_casadi:
	cd ${CASADI_ROOT_DIR}/build && make clean && cd ..&& rm -r build && rm -r installation

clean: clean_qpoases clean_casadi

##
##	end of file
##
