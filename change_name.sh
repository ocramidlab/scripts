#!/bin/bash

for FILE in $(ls ) # for every file (supposing you are in a directory containing ONLY the files you need to convert)
do
    new_file=$(echo "$FILE" | sed 's/001/006/')
    mv $FILE $new_file
done
