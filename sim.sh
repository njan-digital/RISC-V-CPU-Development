#!/bin/bash
# Build a SystemVerilog testbench with Verilator, delete intermediate
# build files, then run the simulation.
# usage: ./sim.sh <top_module> <file1.sv> [file2.sv ...]
# example: ./sim.sh tb_decoder Components/tb_decoder.sv Components/DECODER.sv

if [ $# -lt 2 ]; then
    echo "usage: $0 <top_module> <file.sv> [more files...]"
    exit 1
fi

top=$1; shift

verilator --binary --timing --trace -Wno-fatal --top-module "$top" "$@" || exit 1

# Remove intermediates; keep only the executable.
rm -f obj_dir/*.cpp obj_dir/*.h obj_dir/*.mk obj_dir/*.o obj_dir/*.a obj_dir/*.d obj_dir/*.dat

./obj_dir/V"$top".exe
