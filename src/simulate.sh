#!/bin/bash
ghdl -a --std=08  alu.vhd
ghdl -e --std=08  alu
ghdl -a --std=08  alu_tb.vhd
ghdl -e --std=08  alu_tb
ghdl -r --std=08  alu_tb --vcd=alu_tb.vcd


ghdl -a --std=08  bank_register.vhd
ghdl -e --std=08  bank_register
ghdl -a --std=08  bank_register_tb.vhd
ghdl -e --std=08  bank_register_tb
ghdl -r --std=08  bank_register_tb --vcd=bank_register_tb.vcd


ghdl -a --std=08  ins_decoder.vhd
ghdl -e --std=08  ins_decoder
ghdl -a --std=08  ins_decoder_tb.vhd
ghdl -e --std=08  ins_decoder_tb
ghdl -r --std=08  ins_decoder_tb --vcd=ins_decoder_tb.vcd