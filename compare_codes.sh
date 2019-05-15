#!/bin/bash

PATH1=BAUSTELLE/C-GenIC
PATH2=SOURCE/C-GenIC
here=$(pwd)
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd $HOME/$PATH1
echo Cleaning the log files
value=$(ls -1 Diff_log* | wc -l)
if [ $value -gt 0 ]
then 
    rm Diff_log*
fi
echo Done.
echo 
echo Checking the .c source files
for file in  *.c
do

value=$(diff -q  $file $HOME/$PATH2/$file | wc -l)

if [ $value = 1 ]  
then

echo $file has been changed
diff  $file $HOME/$PATH2/$file > Diff_log_$file

fi
done
echo Done with source files
echo
echo Checking the .h include files
for file in *.h
do

value=$(diff -q  $file $HOME/$PATH2/$file | wc -l)

if [ $value = 1 ]
then

echo $file has been changed
diff  $file $HOME/$PATH2/$file > Diff_log_$file

fi
done
echo Done with include files
echo
echo Checking shell scripts
for file in *.sh
do

value=$(diff -q  $file $HOME/$PATH2/$file | wc -l)

if [ $value = 1 ]
then

echo $file has been changed
diff  $file $HOME/$PATH2/$file > Diff_log_$file

fi
done
echo Done with shell scripts
echo
echo Checking the Makefiles 
for file in Makefile*
do

value=$(diff -q  $file $HOME/$PATH2/$file | wc -l)

if [ $value = 1 ]
then

echo $file has been changed
diff  $file $HOME/$PATH2/$file > Diff_log_$file

fi
done
echo Done with Makefiles
echo
echo Checking the .txt files
for file in *.txt
do

value=$(diff -q  $file $HOME/$PATH2/$file | wc -l)

if [ $value = 1 ]
then

echo $file has been changed
diff  $file $HOME/$PATH2/$file > Diff_log_$file

fi
done
echo Done with .txt files
echo
echo Checking the /darkenergy source files
for file in darkenergy/*.c
do

value=$(diff -q  $file $HOME/$PATH2/$file | wc -l)

if [ $value = 1 ]
then

echo $file has been changed
base=$(basename $file)
diff  $file $HOME/$PATH2/$file > Diff_log_darkenergy_$base

fi
done
echo Done with darkenergy/ source files
echo
echo Checking the /darkenergy include files
for file in darkenergy/*.h
do

value=$(diff -q  $file $HOME/$PATH2/$file | wc -l)

if [ $value = 1 ]
then

echo $file has been changed
base=$(basename $file)
diff  $file $HOME/$PATH2/$file > Diff_log_darkenergy_$base

fi
done
echo Done with darkenergy/ include files
echo
echo Checking the /modgrav source files
for file in modgrav/*.c
do

value=$(diff -q  $file $HOME/$PATH2/$file | wc -l)

if [ $value = 1 ]
then

echo $file has been changed
base=$(basename $file)
diff  $file $HOME/$PATH2/$file > Diff_log_modgrav_$base

fi
done
echo Done with modgrav/ source files
echo
echo Checking the /modgrav include files
for file in modgrav/*.h
do

value=$(diff -q  $file $HOME/$PATH2/$file | wc -l)

if [ $value = 1 ]
then

echo $file has been changed
base=$(basename $file)
diff  $file $HOME/$PATH2/$file > Diff_log_modgrav_$base

fi
done
echo Done with modgrav/ include files
echo
echo Cleaning and creating log directory
value=$(ls -1 Diff_log* | wc -l)
if [ $value -gt 0 ]
then 
    mkdir $here/Diff_log_files
    mv ./Diff_log* $here/Diff_log_files
fi
echo All Done!
echo Check log files in $here/Diff_log_files
echo %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
