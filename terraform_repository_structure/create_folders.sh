#!/bin/bash

companies=(Company1 Company2 Company3 Company4 Company5)
providers=(AWS GCP Azure Digital_Ocean)
for i in $(echo ${companies[@]})
do
  for j in $(echo ${providers[@]})
  do
    echo "$i $j"
    mkdir -p $i/$j
    echo "$i $j" >$i/$j/README.md
  done
done
