#!/bin/bash

companies=(Company1 Company2 Company3 Company4 Company5)
providers=(AWS GCP Azure Digital_Ocean)
environment=(Dev Staging QA Pre_Prod Prod DR)
for i in $(echo ${companies[@]})
do
  for j in $(echo ${providers[@]})
  do
    for k in $(echo ${environment[@]})
    do
      echo "$i $j $k"
      mkdir -p $i/$j/$k
      rm $i/$j/README.md
      echo "$i $j $k" >$i/$j/$k/README.md
    done
  done
done
