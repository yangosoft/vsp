library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 

 
ENTITY bank_register_tb IS
END bank_register_tb;
 
ARCHITECTURE behavior OF bank_register_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
  

    COMPONENT bank_register is
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
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(15 downto 0);
   signal add_A : std_logic_vector (2 downto 0);
   signal add_B : std_logic_vector (2 downto 0);
   signal add_D : std_logic_vector (2 downto 0);
   signal WrD:     STD_LOGIC;    
   signal Clk:    STD_LOGIC;

 	--Outputs
   signal A : std_logic_vector(15 downto 0);
   signal B : std_logic_vector(15 downto 0);
   
  
  



   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bank_register PORT MAP (
          A => A,
          B => B,
          D => D,
          WrD => WrD,
          Clk => Clk,
          add_A => add_A,
          add_B => add_B,
          add_D => add_D
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
     
	    for i in 7 downto 0 loop
            WrD <= '0';
            Clk <= '0';
            add_A <= std_logic_vector(to_unsigned(i,add_A'length)); 
            add_B <= std_logic_vector(to_unsigned(10-i,add_B'length)); 
			wait for 1 us;
        end loop;
        add_D <= std_logic_vector(to_unsigned(0,add_D'length));
        D <= x"CAFE";
        WrD <= '1';
        Clk <= '1';
        wait for 1 us;
        Clk <= '0';
        add_A <= std_logic_vector(to_unsigned(0,add_A'length));
        wait for 1 us;

        add_B <= std_logic_vector(to_unsigned(1,add_B'length)); 
        add_D <= std_logic_vector(to_unsigned(1,add_D'length));
        D <= x"BEEF";
        WrD <= '1';
        Clk <= '1';
        wait for 1 us;
        Clk <= '0';
        add_B <= std_logic_vector(to_unsigned(1,add_B'length));
        wait for 1 us;
        for i in 7 downto 0 loop
            WrD <= '0';
            Clk <= '0';
            add_A <= std_logic_vector(to_unsigned(i,add_A'length)); 
            add_B <= std_logic_vector(to_unsigned(10-i,add_B'length)); 
			wait for 1 us;
        end loop;

      wait;
   end process;

END;