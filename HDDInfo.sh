#!/bin/bash
sudo hdparm -i /dev/sda | grep 'Model' | cut -f 1-3 -d ',' --output-delimiter=$'\n' | cut -f 1-3 -d '=' --output-delimiter=': '
echo $'\n'
echo " Memory:"
df -a| awk '{used+=$3; free+=$4} END {print "\tTotal: " used/1024/1024+free/1024/1024 "GB\n \tUsed:  " used/1024/1024 "GB\n  \tFree:  " free/1024/1024 "GB"}'
echo $'\n'
sudo hdparm -i /dev/sda | grep 'Drive' | cut -f 3 -d ':' | cut -f 2-3 -d ' '  --output-delimiter=" ATA standarts: "
echo $'\n'		
sudo hdparm -i /dev/sda | grep 'PIO'| cut -f 2 -d $'\n'
echo $'\n'
sudo hdparm -i /dev/sda | grep 'DMA'| cut -f 2 -d $'\n'