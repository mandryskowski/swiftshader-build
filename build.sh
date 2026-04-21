#!/usr/bin/env bash
set -e

mkdir -p build
cd build

cmake -GNinja -DCMAKE_BUILD_TYPE=Release "$@" ../swiftshader

# Limit parallel jobs for ASAN builds to prevent out-of-memory errors
if [[ "$*" == *SWIFTSHADER_ASAN=ON* ]]; then
  cmake --build . -j 2
else
  cmake --build .
fi
