--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:55:25 01/19/2022
-- Design Name:   
-- Module Name:   /home/developer/test1/program_rom_tb.vhd
-- Project Name:  test1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: program_rom
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY program_rom_tb IS
END program_rom_tb;
 
ARCHITECTURE behavior OF program_rom_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT program_rom
    PORT(
         dataOut : OUT  std_logic_vector(15 downto 0);
         address : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(7 downto 0);

 	--Outputs
   signal dataOut : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: program_rom PORT MAP (
          dataOut => dataOut,
          address => address
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
           address <= std_logic_vector(to_unsigned(i,8)); 
			  wait for 1 us;
      end loop;
		
				address <= x"01";
				wait for 1 us;
				address <= x"AB";
      wait;
   end process;

END;
