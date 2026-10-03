#!/usr/bin/env bash

cmake -S . -B build -G Ninja
cmake --build build --parallel
build/app
