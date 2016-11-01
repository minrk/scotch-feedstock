
set -e
mpic++ "-I$PREFIX/include" "-L$PREFIX/lib" "${RECIPE_DIR}/test/test_ptscotch.cxx" -o test_ptscotch -DSCOTCH_PTSCOTCH -lptscotch -lptscotcherr
mpiexec -n 2 ./test_ptscotch
