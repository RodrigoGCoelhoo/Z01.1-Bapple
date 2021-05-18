library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dmux16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC;
			q0:   out STD_LOGIC_VECTOR(15 downto 0);
            q1:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture arch of dMux16 is
begin

	q0 <= a when sel = '0';
	q1 <= a when sel = '1';

end architecture;