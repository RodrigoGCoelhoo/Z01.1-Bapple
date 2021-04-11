-- Elementos de Sistemas
-- by Luciano Soares
-- Register32.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register32 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(31 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(31 downto 0)
	);
end entity;

architecture arch of Register32 is

	component Register16 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(15 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(15 downto 0)
      );
	end component;

	SIGNAL vect1, vect2, entrada1, entrada2: std_logic_vector(15 downto 0);

begin

	entrada1 <= input(31 downto 16);
	entrada2 <= input(15 downto 0);

	register1: Register16 Port Map (clock, entrada1, load, vect1);
	register2: Register16 Port Map (clock, entrada2, load, vect2);

	output <= vect1 & vect2;



end architecture;
