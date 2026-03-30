#!/bin/bash

cat **/script.pas > allFullFuncDefs.pas 
python3 funcExtract.py allFullFuncDefs.pas temp.pas
cat temp.pas | sort | uniq -c | sort -r > allFullFuncDefs.pas
rm temp.pas 