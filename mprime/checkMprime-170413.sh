#!/bin/bash

pass_lines=$(grep pass results.txt |wc -l)
nonsense_lines=$(grep '\[' results.txt |wc -l)
total_lines=$(cat results.txt|wc -l)

if [ $total_lines -eq $((pass_lines+nonsense_lines)) ]; then
  #echo $pass_lines
  #echo $nonsense_lines
  #echo $total_lines
  echo -e  "\033[32m mprime test PASSED\033[0m"
else
  echo $pass_lines
  echo $nonsense_lines
  echo $total_lines
  echo -e "\033[31m mprime test FAILED!\033[0m"
fi
