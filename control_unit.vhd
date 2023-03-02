library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_unit is
    Port ( instruction : in std_logic_vector(31 downto 0);
           opcode : out std_logic_vector(5 downto 0);
           shamt : out std_logic_vector(4 downto 0);
           funct : out std_logic_vector(5 downto 0);
           is_add : out std_logic ;
			  is_sub : out std_logic;
			  is_and : out std_logic;
			  is_or : out std_logic;
			  is_nor : out std_logic;
			  is_slt : out std_logic);
			  
			  
end control_unit;

architecture Behavioral of control_unit is
	signal opcode_temp : std_logic_vector(5 downto 0) ;	
	signal shamt_temp : std_logic_vector(4 downto 0);
	signal funct_temp : std_logic_vector(5 downto 0) ;
	
begin
    opcode_temp <= instruction(31 downto 26);
    shamt_temp <= instruction(10 downto 6);
    funct_temp <= instruction(5 downto 0);
    
    -- Check if the instruction is ADD (opcode=0, funct=32)
    is_add <= '1' when (opcode_temp = "000000" and funct_temp = "100000") else '0';
	 is_sub <= '1' when (opcode_temp = "000000" and funct_temp = "100010") else '0';
	 is_and <= '1' when (opcode_temp = "000000" and funct_temp = "100100") else '0';
	 is_or <= '1' when (opcode_temp = "000000" and funct_temp = "100101") else '0';
	 is_nor <= '1' when (opcode_temp = "000000" and funct_temp = "100111") else '0';
	 is_slt <= '1' when (opcode_temp = "000000" and funct_temp = "101010") else '0';
end Behavioral;
