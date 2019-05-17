#!/usr/bin/env bash

echo -e "\e[1;94m# - Clean dist directory\e[0m"

rm -rf dist/
mkdir dist
mkdir dist/lib
mkdir dist/module

echo -e "\e[92m-> Done\e[0m"

echo -e "\e[1;94m# - Build commonjs components library\e[0m"

NODE_ENV=commonjs \
./node_modules/.bin/babel \
    src/components \
    --out-dir dist/lib \
    --copy-files \
    --plugins @babel/plugin-transform-modules-commonjs \
    --ignore "__snapshots__","src/lib/**/*.test.js"

echo -e "\e[92m-> Done\e[0m"

echo -e "\e[1;94m#- Build es6 components library\e[0m"

NODE_ENV=esm \
./node_modules/.bin/babel \
    src/components \
    --out-dir dist/module \
    --copy-files \
    --ignore "__snapshots__","src/lib/**/*.test.js"

echo -e "\e[92m-> Done\e[0m"