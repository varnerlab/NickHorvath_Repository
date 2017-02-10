#!/bin/bash
#julia before.jl
for ((c=1;c<=10;c++))
do
#    echo $i
    timeout 1s julia Algorithm_AA.jl
done
#julia after.jl
