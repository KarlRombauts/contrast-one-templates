#!/bin/bash

cat **/script.pas > allFuncDefs.pas 
python3 getFuncDefs.py allFuncDefs.pas temp.pas
cat temp.pas | sort | uniq -cd | sort -r > allFuncDefs.pas
rm temp.pas 