-- Elementos de Sistemas
-- by Luciano Soares
-- Register16.vhd


Library ieee;
use ieee.std_logic_1164.all;

entity Register16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);

end entity;


architecture arch of Register16 is


	component Register8 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(7 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(7 downto 0)
      );
	end component;

	
	SIGNAL vect1, vect2, entrada1, entrada2: std_logic_vector(7 downto 0);

begin

	entrada1 <= input(15 downto 8);
	entrada2 <= input(7 downto 0);

	register1: Register8 Port Map (clock, entrada1, load, vect1);
	register2: Register8 Port Map (clock, entrada2, load, vect2);

	output <= vect1 & vect2;

end architecture;