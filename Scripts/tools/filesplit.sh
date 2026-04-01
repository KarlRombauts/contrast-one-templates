#!/bin/bash

mkdir -p "$2"
cp "$1" "$2"
cd $2
csplitb --prefix chunk --number 1 00 "$1"
rm -f "$1"
find . -type f -name "*.dat" -size -5 -delete

for f in ./*
do
  if grep -q "<GraphData>" "$f"; then
    mv "$f" graph.xml
  fi

  if grep -q "object .\+: TcxLabel" "$f"; then
    mv "$f" screen.dfm
  fi

  if grep -q "{\\\rtf1\\\ansi" "$f"; then
    mv "$f" template.rtf
  fi

  if grep -q "procedure StartScript;" "$f"; then
    mv "$f" script.pas
  fi

  if grep -q "date,date,D" "$f"; then
    mv "$f" mappings.csv
  fi
done

for f in ./*
do
  echo "Processing $f file..."
  perl -pi -e 's/[^[:ascii:]]//g' "$f"
  perl -pi -e 's/[\x00]//g' "$f" 
  perl -pi -e 's/(\x1C\x0C|O\x01|\x02)//g' "$f"
  perl -pi -e 's/[\x00\x01\x02\x04\x05\x1E]//g' "$f"
done

perl -pi -e 's/~//g' mappings.csv 
