----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:26 01/18/2022 
-- Design Name: 
-- Module Name:    test1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE; use IEEE.STD_LOGIC_1164.ALL; use IEEE.STD_LOGIC_ARITH.ALL; use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity VSP is

    Port ( A : out  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk : in STD_LOGIC);
end VSP;

architecture Behavioral of VSP is
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
begin

	prom: program_rom PORT MAP (
          dataOut => dataOut,
          address => address
        );

	--Counter to drive blinking pins 
	count: process(clk)
   begin
     if rising_edge(clk) then
       counter <= counter+1;
     end if;
   end process;
	--Pins are connected to the counter to cause blinking at varying frequencies 
	A <= counter(35 downto 20);
	B <= counter(31 downto 16);
	C <= counter(15 downto 0); 
end Behavioral; 
