#!/bin/bash

for dir in ./*
do
    numfiles=$(ls -1 ./$dir | wc -l)
    echo Snapshot $dir has $numfiles files
done
