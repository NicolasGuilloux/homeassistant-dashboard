#!/usr/bin/env bash

for i in `find . -name "*.ncl" -type f`; do
    nickel format "$i"
done