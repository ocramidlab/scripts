#!/bin/bash

SOURCE='/marconi_scratch/userexternal/ccarbone/ICs_for_Marco/MNU0.16_Wmn1.00/'
ENDPOINT='gsiftp://gftp.prace.bsc.es:2811/'
TARGET='/gpfs/scratch/pr1edp00/pr1edp01/Degeneracies/DUSTGRAIN/fR5_mnu0.16/ICs/'

echo nohup globus-url-copy -r -rst -p 4 file:///$SOURCE $ENDPOINT$TARGET


