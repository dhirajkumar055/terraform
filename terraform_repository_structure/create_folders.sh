#!/bin/bash

companies=(company1 company2 company3 company4 company5)
providers=(aws gcp azure digital_ocean)
environment=(dev staging qa pre_prod prod dr)
for i in $(echo ${providers[@]})
do
  for j in $(echo ${companies[@]})
  do
    for k in $(echo ${environment[@]})
    do
      mkdir -p $i/$j/$k
      echo "$i $j $k" >$i/$j/$k/README.md
    done
  done
  mkdir -p "$i/terraform_modules_${i}/"
done
