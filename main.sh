#!/usr/bin/env bash

git clone 'https://github.com/sguzman/fresh-pages-snapshot'

for i in *.txt.brotli; do
    cat ${i} | brotli -d
done | brotli > ./fresh-pages-snapshot/pages.brotli

cd ./fresh-pages-snapshot/
git add pages.brotli
git commit -m 'Added snapshot'
SHELL=bash expect -f ../script.exp