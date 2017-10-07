#!/bin/sh

cp $RECIPE_DIR/Makefile.inc.common src/Makefile.inc.common
cp $RECIPE_DIR/Makefile.inc.$(uname) src/Makefile.inc

cd src/
make -j ${NUM_CPUS} esmumps | tee make.log 2>&1
make check
cd ..

# install.
mkdir -p $PREFIX/lib/
cp lib/* $PREFIX/lib/
mkdir -p $PREFIX/bin/
cp bin/* $PREFIX/bin/
mkdir -p $PREFIX/include/
cp include/* $PREFIX/include/
