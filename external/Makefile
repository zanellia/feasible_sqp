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
LIB_HSL_DIR= ${MATLAB_LIBDIR}
endif

ifndef LIB_BLAS
$(warning LIB_BLAS is not set - using default)
LIB_BLAS = /usr/lib/x86_64-linux-gnu/libblas.so
endif

ifndef LIB_LAPACK
$(warning LIB_LAPACK is not set - using default)
LIB_LAPACK = /usr/lib/x86_64-linux-gnu/liblapack.so
endif

ifndef LIB_SOLVER
$(error LIB_SOLVER is not set)
endif

ifndef LIB_HSL_DIR
$(error LIB_HSL_DIR is not set)
endif

LINKHSL = -Wl,-rpath=${LIB_HSL_DIR}

##
##	targets
##

all: qpoases casadi
# all: qpoases

ifdef MATLAB_IDIR
MAKE_QPOASES_ARGS = MATLAB_IDIR=${MATLAB_IDIR} MATLAB_LIBDIR=${MATLAB_LIBDIR} USE_SOLVER=${USE_SOLVER} LIB_BLAS=${LIB_BLAS} LIB_LAPACK=${LIB_LAPACK} REPLACE_LINALG=${REPLACE_LINALG}
else
MAKE_QPOASES_ARGS = USE_SOLVER=${USE_SOLVER} LIB_BLAS=${LIB_BLAS} LIB_LAPACK=${LIB_LAPACK} REPLACE_LINALG=${REPLACE_LINALG} 
endif

qpoases: 
	cd ${QPOASES_ROOT_DIR}; mkdir -p bin; make -j4 ${MAKE_QPOASES_ARGS} src

casadi: 
	cd ${CASADI_ROOT_DIR} && mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX=../installation .. && make -j4 && make install

.PHONY:	casadi 

clean_qpoases:
	cd ${QPOASES_ROOT_DIR} && make clean

clean_casadi:
	cd ${CASADI_ROOT_DIR}/build && make clean && cd ..&& rm -r build && rm -r installation

clean: clean_qpoases clean_casadi

##
##	end of file
##
