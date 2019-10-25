#!/bin/bash
## This script converts from .eps to .pdf all the .eps files residing in the working directory.
## It requires that the ./PDF folder exists

for file in *.eps
do
    base=$(basename "$file" .eps)
    convert ${file} ./PDF/${base}.pdf
done