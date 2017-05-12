#!/bin/bash

###
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUILD_TYPE="Debug"
printf "== Moving to *build* directory - creating if needed ... "
mkdir -p $DIR/build
printf "OK\n"
cd $DIR/build

###
printf "== Creating build system\n"

if cmake .. -DCMAKE_BUILD_TYPE=$BUILD_TYPE; then
  printf "== Created build system OK\n"
else
  printf "== FAILED to created build system - Exiting\n"
  exit 1
fi



###
printf "== Autobuilding (smoke test)\n"

if cmake --build . --config $BUILD_TYPE; then
  printf "== Autobuild was OK\n"
else
  printf "== FAILED to Autobuild\n - Exiting\n"
  exit 1
fi

###
printf "== Return to child directory ..."
cd ..
printf "OK\n"
exit 0

