library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
    generic (
        ARITHMETIC_OPERATION_ADD: std_logic_vector(7 downto 0) := x"00";
        ARITHMETIC_OPERATION_AND: std_logic_vector(7 downto 0) := x"01";
        ARITHMETIC_OPERATION_OR: std_logic_vector(7 downto 0)  := x"02";
        ARITHMETIC_OPERATION_SUB: std_logic_vector(7 downto 0) := x"03"
        --ARITHMETIC_OPERATION_ADD: unsigned(7 downto 0) := x"00";
        --ARITHMETIC_OPERATION_AND: unsigned(7 downto 0) := x"01"
        );
    

    port (
        
        operation : in std_logic_vector (7 downto 0);
        A : in std_logic_vector (7 downto 0);
        B : in std_logic_vector (7 downto 0);
        clk: in STD_LOGIC;
        dataOut : out std_logic_vector (7 downto 0);
        z:     out STD_LOGIC;    
        ovf:   out STD_LOGIC
    );
    
end entity;

architecture arch of ALU is

begin

    --if rising_edge(clk) then
        process(A,B, operation)
            variable temp : unsigned(8 downto 0);
            variable op :   unsigned(7 downto 0); 
        begin
            op := resize(unsigned(operation),8);
            -- TODO case is not working
            --case op is
            --    when ARITHMETIC_OPERATION_ADD =>
            --    temp := resize(unsigned(A), temp'length) + unsigned(B);
            --    dataOut <= std_logic_vector(resize(temp,8));
            --    z <= '1' when temp = 0 else '0';
            --    ovf <= '1' when temp > 255 else '0';
            --    when others => dataOut <= x"AB";
            --    z <= '1';
            --    ovf <= '1';
            --end case;

            if operation = ARITHMETIC_OPERATION_ADD then
                temp := resize(unsigned(A), temp'length) + unsigned(B);
                dataOut <= std_logic_vector(resize(temp,8));
                z <= '1' when temp = 0 else '0';
                ovf <= '1' when temp > 255 else '0';
            elsif operation = ARITHMETIC_OPERATION_SUB then
                temp := resize(unsigned(A), temp'length) - unsigned(B);
                dataOut <= std_logic_vector(resize(temp,8));
            elsif operation = ARITHMETIC_OPERATION_AND then
                dataOut <= A and B;
                z <= '0';
                ovf <= '0';
            elsif operation = ARITHMETIC_OPERATION_OR then
                dataOut <= A or B;
                z <= '0';
                ovf <= '0'; 
            else
                dataOut <= x"AB";
                z <= '1';
                ovf <= '1';
            end if;
        end process;
end architecture;