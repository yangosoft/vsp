library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bank_register is
    

    port (
        A :     out std_logic_vector (15 downto 0);
        B :     out std_logic_vector (15 downto 0);
        D :     in std_logic_vector (15 downto 0);
        add_A:  in std_logic_vector (2 downto 0);
        add_B:  in std_logic_vector (2 downto 0);
        add_D:  in std_logic_vector (2 downto 0);
        WrD:    in STD_LOGIC;    
        Clk:    in STD_LOGIC
    );
    
end entity;

architecture arch of bank_register is

    subtype eWord is std_logic_vector (15 downto 0);
    type someWords is array (7 downto 0) of eWord;
    signal memory : someWords := (
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
    

   store: process(Clk)
   begin
     if rising_edge(Clk) then
            if WrD = '1' then
                memory(to_integer(unsigned(add_D))) <= D;
            end if;
     end if;
   end process;

    A <= memory(to_integer(unsigned(add_A)));
    B <= memory(to_integer(unsigned(add_B)));

end architecture;