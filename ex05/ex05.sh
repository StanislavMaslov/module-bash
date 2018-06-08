#!/bin/bash

arg=$1

shift

for flag in $@; do
  if [[ "${flag}" =~ [a-z] ]]; then
    echo "Error.." && exit 1
  fi
done

case "$arg" in
-s) sum=0
    for i in $@; do
      sum=$(($sum + $i ))
    done
    echo $sum;;

-e) even=0
    for i in $@; do
      if [ $((i%2)) -eq 0 ]; then
        even=$(($even + $i))
      fi
    done
    echo $even;;

-o) odd=0
    for i in $@; do
      if [ $((i%2)) -ne 0 ]; then
        odd=$(($odd + $i))
      fi
    done
    echo $odd;;

-m) mean=0
    for i in $@; do
      mean=$(($mean + $i))
    done
    echo $(($mean/$#));;
*)  echo "Error..";;
esac