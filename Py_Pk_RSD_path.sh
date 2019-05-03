#!/bin/bash
#Usage: Py_Pk_RSD_path.py output_Path Snapnum_min Snapnum_max BoxSize GridSize particle_types[numbers separated by comma]
NUMPARAMS=6 # The number of expected parameters in the script

#SCRIPTSPATH='/home/PERSONALE/marco.baldi5/SOURCE/python_scripts/'
#BASE='/marconi_scratch/userexternal/mbaldi00/PNG/B4000_1024_fNL+40/output/'

if [ $# != $NUMPARAMS ]; then
    echo "Usage: Py_Pk_path.py output_path Snapnum_min Snapnum_max BoxSize GridSize particle_types[numbers separated by comma]"
    exit 0
else
    BASE=$1
    for SNAPNUM in $(eval echo {$2..$3})
    do
	NUM=$(printf %03d $SNAPNUM)
	TARGET=$BASE'/snapdir_'$NUM
	if [ -d ${TARGET} ]; then
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
	    python quick_Pk_RSD.py ${SNAPNAME%.*} $4 $5 $6
	    echo Done
	    rm ./quick_Pk_RSD.py
	fi	
	echo Power Spectrum Computed
    done
fi
