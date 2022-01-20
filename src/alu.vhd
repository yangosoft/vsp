library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
    generic (
        ARITHMETIC_OPERATION_ADD: std_logic_vector(7 downto 0) := x"00";
        ARITHMETIC_OPERATION_AND: std_logic_vector(7 downto 0) := x"01";
        ARITHMETIC_OPERATION_OR: std_logic_vector(7 downto 0)  := x"02";
        ARITHMETIC_OPERATION_SUB: std_logic_vector(7 downto 0) := x"03";
        ARITHMETIC_OPERATION_SHL: std_logic_vector(7 downto 0) := x"04";
        ARITHMETIC_OPERATION_NOT: std_logic_vector(7 downto 0) := x"05";
        ARITHMETIC_OPERATION_SHA: std_logic_vector(7 downto 0) := x"06";
        ARITHMETIC_OPERATION_XOR: std_logic_vector(7 downto 0) := x"07"
        --ARITHMETIC_OPERATION_ADD: unsigned(7 downto 0) := x"00";
        --ARITHMETIC_OPERATION_AND: unsigned(7 downto 0) := x"01"
        );
    

    port (
        
        operation : in std_logic_vector (7 downto 0);
        cmp_alu : in std_logic;
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
        process(A,B, operation, cmp_alu)
            variable temp : unsigned(8 downto 0);
            variable op :   unsigned(7 downto 0);
            variable temp_A : unsigned(7 downto 0); 
            variable temp_B : unsigned(7 downto 0);
        begin
            op := resize(unsigned(operation),8);
            temp_A := resize(unsigned(A),8);
            temp_B := resize(unsigned(B),8);
            -- COMPARATOR
            
            if cmp_alu = '1' then
                dataOut <= x"FF";
            else


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
                z <= '1' when temp = 0 else '0';
                dataOut <= std_logic_vector(resize(temp,8));
            elsif operation = ARITHMETIC_OPERATION_AND then
                temp := resize(unsigned(A and B),temp'length);
                dataOut <= std_logic_vector(resize(temp,8));
                z <= '1' when temp = 0 else '0';
                ovf <= '0';
            elsif operation = ARITHMETIC_OPERATION_OR then
                temp := resize(unsigned(A or B),temp'length);
                dataOut <= std_logic_vector(resize(temp,8));
                z <= '1' when temp = 0 else '0';
                ovf <= '0';
            elsif operation = ARITHMETIC_OPERATION_XOR then
                temp := resize(unsigned(A xor B),temp'length);
                dataOut <= std_logic_vector(resize(temp,8));
                z <= '1' when temp = 0 else '0';
                ovf <= '0';
            elsif operation = ARITHMETIC_OPERATION_NOT then
                temp := resize(unsigned(NOT A),temp'length);
                dataOut <= std_logic_vector(resize(temp,8));
                z <= '1' when temp = 0 else '0';
                ovf <= '0'; 
            elsif operation = ARITHMETIC_OPERATION_SHL then
                temp := resize(unsigned(to_stdlogicvector(to_bitvector(A) sll to_integer(unsigned(B)))),temp'length);
                dataOut <= std_logic_vector(resize(temp,8));
                --to_stdlogicvector(to_bitvector(A) sra to_integer(unsigned(B)));
                z <= '1' when temp = 0 else '0';
                ovf <= '0'; 
            elsif operation = ARITHMETIC_OPERATION_SHA then
                temp := resize(unsigned(to_stdlogicvector(to_bitvector(A) sla to_integer(signed(B)))),temp'length);
                dataOut <= std_logic_vector(resize(temp,8));
                --to_stdlogicvector(to_bitvector(A) sra to_integer(unsigned(B)));
                z <= '1' when temp = 0 else '0';
                ovf <= '0'; 
            else
                dataOut <= x"AB";
                z <= '1';
                ovf <= '1';
            end if;
        end if;
        end process;
end architecture;