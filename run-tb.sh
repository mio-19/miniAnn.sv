#!/bin/sh
set -e
cd "$(dirname "$0")"
cd src
run_sv(){
for f in tb_*.sv; do
  echo "  --  $f  --"
  iverilog -g2005-sv -Y .sv -y . "$f"
  ./a.out
  rm a.out
done
}
run_v(){
for f in tb_*.v; do
  echo "  --  $f  --"
  iverilog -y . "$f"
  ./a.out
  rm a.out
done
}
run_v
echo Success!
