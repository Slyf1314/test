#!/bin/bash
sudo parted $1 mklabel gpt
sudo parted $1 mkpart primary $2 0% 100%
