#!/bin/sh
set -e
cd "$(dirname "$0")"
cd src
#echo *.sv | xargs --max-args=1 --max-procs="$(nproc)" verilator --cc
echo *.sv | xargs --max-procs="$(nproc)" verilator --cc
