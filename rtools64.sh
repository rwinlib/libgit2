#!/bin/sh
RCONFIG="/c/Progra~1/R/R-3.4.4/bin/x64/R CMD config"
CXX11="`$RCONFIG CXX11`"
CXX11STD="`$RCONFIG CXX11STD`"
export CXX="$CXX11 $CXX11STD"
export CXXCPP="`$RCONFIG CXXCPP`"
export CXXFLAGS="`$RCONFIG CXXFLAGS`"
export CC="`$RCONFIG CC`"
export CPP="`$RCONFIG CPP`"
export CFLAGS="`$RCONFIG CFLAGS` -DCURL_STATICLIB"

# Link against mingw64 libs
export CPPFLAGS="-I/mingw64/include -DCURL_STATICLIB"
export LDFLAGS="-L/mingw64/lib"

# To use 'ar' and stuff from Rtools as well
#RBINPATH=`dirname $CC`
#RBINPATH=`cygpath $RBINPATH`
#export PATH="$RBINPATH:$PATH"
