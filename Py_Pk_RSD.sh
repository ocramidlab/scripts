#!/bin/bash
#Usage: Py_Pk_RSD.py BoxSize GridSize particle_types[numbers separated by comma]
NUMPARAMS=3 # The number of expected parameters in the script
#SCRIPTSPATH='/home/PERSONALE/marco.baldi5/SOURCE/python_scripts/'

if [ $# != $NUMPARAMS ]; then
    echo "Usage: Py_Pk.py BoxSize GridSize particle_types[numbers separated by comma]"
    exit 0
else
    CURDIR=$(pwd)
    echo $CURDIR
    echo Copying python script to local
    cp ${SCRIPTSPATH}quick_Pk_RSD.py $CURDIR
    echo Done
    SNAPNAME=$(ls -1 *.0)
    echo we use this: ${SNAPNAME%.*} as snapshot argument
    echo Running the python script
    python quick_Pk_RSD.py ${SNAPNAME%.*} $1 $2 $3
    echo Done
    rm ./quick_Pk_RSD.py
    
    echo Power Spectrum Computed
fi
