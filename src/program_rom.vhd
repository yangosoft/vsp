library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity program_rom is
    port (
        dataOut : out std_logic_vector (15 downto 0);
        address : in std_logic_vector (7 downto 0)
    );
end entity;

architecture arch of program_rom is

    subtype eWord is std_logic_vector (15 downto 0);
    type someWords is array (7 downto 0) of eWord;

    constant memory : someWords := (
        x"AAAA",
        x"BBBB",
        x"CCCC",
        x"DDDD",
        x"EEEE",
        x"FFFF",
        x"0000",
        x"1111"
    );

begin

    dataOut <= memory(to_integer(unsigned(address))) when to_integer(unsigned(address)) < 5 else
	 x"ABAB" when 	to_integer(unsigned(address)) > 4;

end architecture;

