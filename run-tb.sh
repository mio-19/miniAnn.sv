#!/bin/sh
set -e
cd "$(dirname "$0")"
cd src
for f in *.sv; do
  echo "  --  $f  --"
  iverilog -g2005-sv "$f"
  ./a.out
  rm a.out
done
echo Success!
