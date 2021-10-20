#!/bin/bash
read -p  "Your command history will be cleared, continue? y/n: " yn
case $yn in
    y|Y)
    echo "~/.bash_history will be cleared..."
    > ~/.bash_history
    history -c
    ;;
    n|N)
    echo "Nothing done."; exit
    ;;
    *)
    echo "Only y/Y or n/N can be selected!";exit
    ;;
esac
