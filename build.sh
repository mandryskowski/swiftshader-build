#!/usr/bin/env bash
set -e

mkdir -p build
cd build

cmake -GNinja -DCMAKE_BUILD_TYPE=Release "$@" ../swiftshader
cmake --build .
