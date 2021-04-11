-- Elementos de Sistemas
-- by Luciano Soares
-- Register64.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register64 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(63 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(63 downto 0)
	);
end entity;

architecture arch of Register64 is

	component Register32 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(31 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(31 downto 0)
      );
	end component;

	SIGNAL vect1, vect2, entrada1, entrada2: std_logic_vector(31 downto 0);

begin

	entrada1 <= input(63 downto 32);
	entrada2 <= input(31 downto 0);

	register1: Register32 Port Map (clock, entrada1, load, vect1);
	register2: Register32 Port Map (clock, entrada2, load, vect2);

	output <= vect1 & vect2;

end architecture;
