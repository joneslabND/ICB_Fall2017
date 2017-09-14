#!/usr/bin/env bash

# a script for pulling the atom with the minimu value in column 5 from each of six .pdb files
# usage ./pdbScript.sh

cat cubane.pdb | grep ATOM | sort -n -k 5 | head -n 1 | tr -s " " | cut -d " " -f 3,5 >> results.txt
cat propane.pdb | grep ATOM | sort -n -k 5 | head -n 1 | tr -s " " | cut -d " " -f 3,5 >> results.txt


# a;sdfiaupdfoiuadpfj
