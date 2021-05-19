library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux2Way16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC;
			q0:  out STD_LOGIC_VECTOR(15 downto 0);
			q1:  out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture rtl of DMux2Way16 is
begin

	q0 <= a when sel = '0' else x"0000";
	q1 <= a when sel = '1' else x"0000";
	
end architecture;
