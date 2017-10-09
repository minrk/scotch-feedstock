# -*- makefile -*-

EXE             =
LIB             = .a
OBJ             = .o

MAKE            = make
AR              = ar
ARFLAGS         = -ruv
CAT             = cat
CCS            := ${CC}
CCP             = mpicc
CCD            := ${CC}
CFLAGS         := ${CFLAGS}
CLIBFLAGS      := ${CLIBFLAGS}
LDFLAGS        := ${LDFLAGS}
CP              = cp
LEX             = flex -Pscotchyy --no-yywrap -olex.yy.c
LN              = ln
MKDIR           = mkdir
MV              = mv
RANLIB          = ranlib
YACC            = bison -pscotchyy -y -b y
