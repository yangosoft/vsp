#!/bin/bash
ghdl -a --std=08  alu.vhd
ghdl -e --std=08  alu
ghdl -a --std=08  alu_tb.vhd
ghdl -e --std=08  alu_tb
ghdl -r --std=08   alu_tb --vcd=alu_tb.vcd
