#!/bin/bash
#SBATCH --err=slurm-%j.err
#SBATCH --out=slurm-%j.out
#SBATCH --time=04:00:00
#SBATCH --nodes=1 --ntasks-per-node=1 --cpus-per-task=1
#SBATCH --mem=18000MB
#SBATCH --account=Sis18_viel
#SBATCH --partition=bdw_all_serial
#

#SCRIPTSPATH='/marconi/home/userexternal/mbaldi00/SOURCE/python_scripts/'
BASE='/marconi_scratch/userexternal/mbaldi00/PNG/B4000_1024_fNL+40/output/'
BOX=4000.0
GRID=1024

for NUM in {0..7}
do
    TARGET=$BASE'snapdir_00'$NUM
    
    echo $TARGET
    echo Copying python script to local
    cp ${SCRIPTSPATH}quick_Pk.py $TARGET
    echo Done
    echo Moving to $TARGET
    cd $TARGET
    echo Done
    SNAPNAME=$(ls -1 *.0)
    echo we use this: ${SNAPNAME%.*} as snapshot argument
    echo Running the python script
    python quick_Pk.py ${SNAPNAME%.*} ${BOX} ${GRID}
    echo Done
    rm ./quick_Pk.py
    
    echo Power Spectrum Computed
done


echo All done.
