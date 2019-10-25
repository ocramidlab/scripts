#!/bin/bash

for file in *.eps
do
    base=$(basename "$file" .eps)
    convert ${file} ./PDF/${base}.pdf
done