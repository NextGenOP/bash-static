#!/bin/bash

bash_version=$(curl -s https://ftp.gnu.org/gnu/bash/ | grep -oP 'bash-\K[0-9.]+'  | tail -n 1 | sed 's/.$//')
bash_patch_level=$(curl -s https://ftp.gnu.org/gnu/bash/bash-${bash_version}-patches/ | grep -oP "bash$(echo ${bash_version} | sed 's/\.//g')-\K[0-9]+" | sort -V | tail -n 1)
musl_version=$(curl -s https://musl.libc.org/releases/ | grep -oP 'musl-\K[0-9.]+' | sort -V | tail -n 1 | sed 's/.$//')

export bash_version
export bash_patch_level
export musl_version
echo $bash_version
echo $bash_patch_level
echo $musl_version
