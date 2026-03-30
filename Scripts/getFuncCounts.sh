#!/bin/bash
cat "$1" > temp1.pas 
python3 getFuncDefs.py temp1.pas temp2.pas
cat temp2.pas | sort | uniq -c | sort -r > temp1.pas
cat temp1.pas
rm temp1.pas temp2.pas