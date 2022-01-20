# VHDL Simple Processor

Very basic 8 bit and 16 bus address processor written in VHDL.

Will be tested in a Spartan 3S500E

## Build instructions

Requires https://github.com/ghdl/ghdl and http://gtkwave.sourceforge.net to build and simulate.


```
cd src
./simulate.sh
gtkwave alu_tb.vcd
gtkwave program_rom_tb.vcd
```
