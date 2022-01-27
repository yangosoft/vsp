library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ins_decoder is
    

    port (
        INS :       in std_logic_vector (15 downto 0);
        IMMED :     out std_logic_vector (7 downto 0);
        add_A:      out std_logic_vector (2 downto 0);
        add_B:      out std_logic_vector (2 downto 0);
        add_D:      out std_logic_vector (2 downto 0);
        F:          out std_logic_vector (2 downto 0);
        OP:         out std_logic_vector (2 downto 0);
        e:          out STD_LOGIC;    
        Rb_I:       out STD_LOGIC;   
        In_Ld:      out STD_LOGIC;   
        InLd_Alu:   out STD_LOGIC;   
        WrD:        out STD_LOGIC;   
        WrIO:       out STD_LOGIC;   
        WrMem:      out STD_LOGIC;   
        TknBr:      out STD_LOGIC
    );
    
end entity;

architecture arch of ins_decoder is

    signal dec_value : integer(7 downto 0) := (others => '0');
    
begin
    

  add_B     <= INS(2 downto 0);
  F         <= INS(5 downto 3);
  add_A     <= INS(8 downto 6);
  add_D     <= INS(11 downto 9);
  OP        <= INS(14 downto 12);
  e         <= INS(8);

  --dec_value <= to_integer( INS(14 downto 12), dec_value'length) ;

 

end architecture;