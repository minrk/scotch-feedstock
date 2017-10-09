#!/bin/sh

env | sort
cp $RECIPE_DIR/Makefile.inc src/Makefile.inc

export CFLAGS="${CFLAGS} -I${PREFIX}/include -O3 -DIDXSIZE64 -Drestrict=__restrict -DCOMMON_FILE_COMPRESS_GZ -DCOMMON_RANDOM_FIXED_SEED -DSCOTCH_RENAME -DCOMMON_PTHREAD -DCOMMON_PTHREAD_BARRIER"
export LDFLAGS="${LDFLAGS} -lz -lm -pthread"

if [[ "$(uname)" == "Darwin" ]]; then
    export CFLAGS="${CFLAGS} -DCOMMON_PTHREAD_BARRIER -DCOMMON_TIMING_OLD"
    export CLIBFLAGS="${CLIBFLAGS} -fPIC"
else
    export LDFLAGS="${LDFLAGS} -lrt"
fi

if [[ "${PKG_NAME}" == "scotch" ]]; then
    # serial build
    export CFLAGS="${CFLAGS} -DSCOTCH_PTHREAD"
    LIBNAME=esmumps
else
    # parallel build
    LIBNAME=ptesmumps
fi

cd src/
make -j ${NUM_CPUS} ${LIBNAME} | tee make.log 2>&1
make check
cd ..

# install.
mkdir -p $PREFIX/lib/
cp lib/* $PREFIX/lib/
mkdir -p $PREFIX/bin/
cp bin/* $PREFIX/bin/
mkdir -p $PREFIX/include/
cp include/* $PREFIX/include/
