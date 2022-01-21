library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 

 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
  

    COMPONENT ALU is
        port (
            operation : in std_logic_vector (7 downto 0);
            cmp_alu : in std_logic;
            A : in std_logic_vector (7 downto 0);
            B : in std_logic_vector (7 downto 0);
            W : out std_logic_vector (15 downto 0);
            z:     out STD_LOGIC;    
            ovf:   out STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0);
   signal B : std_logic_vector(7 downto 0);

 	--Outputs
   signal W : std_logic_vector(15 downto 0);


   signal operation : std_logic_vector (7 downto 0);
   
   signal z:     STD_LOGIC;    
   signal ovf:    STD_LOGIC;

   signal cmp_alu :  std_logic;

   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          W => W,
          z => z,
          ovf => ovf,
          operation => operation,
          cmp_alu => cmp_alu
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
      operation <= x"00";
      cmp_alu <= '0';
		for i in 10 downto 0 loop
           A <= std_logic_vector(to_unsigned(i,8)); 
           B <= std_logic_vector(to_unsigned(10-i,8)); 
			  wait for 1 us;
      end loop;
      wait for 1 us;
      A <= x"00";
      B <= x"00";
      wait for 1 us;
      A <= x"FF";
      B <= x"01";
      wait for 1 us;
      operation <= x"AB";
      wait for 1 us;

      -- TEST AND
      operation <= x"01";
      A <= x"FF";
      B <= x"00";
      wait for 1 us;
      A <= x"F0";
      B <= x"01";
      wait for 1 us;
      A <= x"AB";
      B <= x"FF";
      wait for 1 us;
      A <= x"FF";
      B <= x"FF";
      wait for 1 us;
      -- TEST OR
      operation <= x"02";
      A <= x"FF";
      B <= x"00";
      wait for 1 us;
      A <= x"00";
      B <= x"01";
      wait for 1 us;
     -- TEST SUB
     operation <= x"03";
     for i in 7 downto 0 
     loop
        A <= std_logic_vector(to_unsigned(i,8)); 
        B <= std_logic_vector(to_unsigned(7-i,8)); 
           wait for 1 us;
      end loop;

      -- TEST SHL
      operation <= x"04";
      A <= x"01";
      B <= x"01";
      wait for 1 us;

      -- TEST NOT
      operation <= x"05";
      A <= x"FF";
      B <= x"05";
      wait for 1 us;

      -- TEST SHA
      operation <= x"06";
      A <= x"01";
      B <= x"01";
      wait for 1 us;

      -- TEST XOR
      operation <= x"07";
      A <= x"FF";
      B <= x"FF";
      wait for 1 us;

      -- TEST COMPARATOP
      cmp_alu <= '1';
      A <= x"01";
      B <= x"FF";

      -- CMP_OPERATION_LT
      operation <= x"00";
      wait for 1 us;
      -- CMP_OPERATION_LE
      operation <= x"01";
      B <= x"01";
      wait for 1 us;
      -- CMP_OPERATION_EQ
      operation <= x"03";
      B <= x"FF";
      wait for 1 us;
      -- CMP_OPERATION_LTU
      operation <= x"04";
      B <= x"FF";
      wait for 1 us;
      -- CMP_OPERATION_LEU
      operation <= x"05";
      wait for 1 us;
      wait;
   end process;

END;