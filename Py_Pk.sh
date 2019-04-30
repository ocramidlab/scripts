#!/bin/bash

#SCRIPTSPATH='/home/PERSONALE/marco.baldi5/SOURCE/python_scripts/'
CURDIR=$(pwd)

echo $CURDIR
echo Copying python script to local
cp ${SCRIPTSPATH}quick_Pk.py $CURDIR
echo Done
SNAPNAME=$(ls -1 *.0)
echo we use this: ${SNAPNAME%.*} as snapshot argument
echo Running the python script
python quick_Pk.py ${SNAPNAME%.*} 4000.0 1024
echo Done
rm ./quick_Pk.py

echo Power Spectrum Computed