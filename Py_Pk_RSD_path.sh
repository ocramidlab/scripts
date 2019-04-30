#!/bin/bash

#SCRIPTSPATH='/home/PERSONALE/marco.baldi5/SOURCE/python_scripts/'
BASE='/marconi_scratch/userexternal/mbaldi00/PNG/B4000_1024_fNL+40/output/'
BOX=4000.0
GRID=1024

for NUM in {0..7}
do
    TARGET=$BASE'snapdir_00'$NUM
    
    echo $TARGET
    echo Copying python script to local
    cp ${SCRIPTSPATH}quick_Pk_RSD.py $TARGET
    echo Done
    echo Moving to $TARGET
    cd $TARGET
    echo Done
    SNAPNAME=$(ls -1 *.0)
    echo we use this: ${SNAPNAME%.*} as snapshot argument
    echo Running the python script
    python quick_Pk_RSD.py ${SNAPNAME%.*} ${BOX} ${GRID}
    echo Done
    rm ./quick_Pk_RSD.py
    
    echo Power Spectrum Computed
done
