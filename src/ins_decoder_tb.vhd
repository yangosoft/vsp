library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 

 
ENTITY ins_decoder_tb IS
END ins_decoder_tb;
 
ARCHITECTURE behavior OF ins_decoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
  

    COMPONENT ins_decoder is
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
    END COMPONENT;
    

   --Inputs
   signal INS : std_logic_vector(15 downto 0);
  

 	--Outputs
    signal add_A : std_logic_vector (2 downto 0);
    signal add_B : std_logic_vector (2 downto 0);
    signal add_D : std_logic_vector (2 downto 0);
    signal WrD:     STD_LOGIC;    
    signal e:    STD_LOGIC;
    signal A : std_logic_vector(15 downto 0);
   signal B : std_logic_vector(15 downto 0);
   signal F:    std_logic_vector (2 downto 0);
   
  
  



   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ins_decoder PORT MAP (
          INS   => INS,
          add_A => add_A,
          add_B => add_B,
          add_D => add_D,
          F     => F,
          e     => e
        );

   -- Clock process definitions
   -- <clock>_process :process
   -- begin
	-- 	<clock> <= '0';
	-- 	wait for <clock>_period/2;
	-- 	<clock> <= '1';
	-- 	wait for <clock>_period/2;
   -- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     -- wait for 1 ns;	

      -- wait for <clock>_period*10;

      -- insert stimulus here 
     
        INS <= x"AAAA";
	    wait for 1 us;
       

      wait;
   end process;

END;