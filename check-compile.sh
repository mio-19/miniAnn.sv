#!/bin/sh
set -e
cd "$(dirname "$0")"
cd src
rm -f *.v
echo *.sv | xargs --max-args=1 --max-procs="$(nproc)" verilator --cc
#echo *.sv | xargs --max-args=4 --max-procs="$(nproc)" verilator --cc
