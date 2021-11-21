#!/bin/bash 
while getopts ":a:bc:" flag;do 
    echo "flag -$flag, argument $OPTARG"; 
done
