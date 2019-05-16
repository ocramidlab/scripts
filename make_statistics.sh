#!/bin/bash

SIM=LCDM

cd ./$SIM/output/

rm -f *_log.txt

grep Time cpu.txt | gawk '{print $2 " " $4}' | gawk -F ',' '{print $1 " " $2}' > file1.txt

grep total cpu.txt | gawk '{print $2}' > file2.txt

grep treegrav cpu.txt | gawk '{print $2}' > file3.txt

grep treewalk cpu.txt | gawk '{print $2}' > file4.txt 

grep pmgrav cpu.txt | gawk '{print $2}' > file5.txt

grep sph cpu.txt | gawk '{print $2}' > file6.txt

grep domain cpu.txt | gawk '{print $2}' > file7.txt

grep modgrav cpu.txt | gawk '{print $2}' > file8.txt

grep Dloga info.txt | gawk '{print $13}' > file9.txt



paste file1.txt file2.txt file3.txt file4.txt file5.txt file6.txt file7.txt file8.txt file9.txt > timestep_log.txt

rm -f file*.txt