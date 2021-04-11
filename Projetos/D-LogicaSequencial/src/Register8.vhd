-- Elementos de Sistemas
-- by Luciano Soares
-- Register8.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register8 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(7 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(7 downto 0)
	);
end entity;

architecture arch of Register8 is

	component BinaryDigit is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC;
			load:    in STD_LOGIC;
			output: out STD_LOGIC
		);
	end component;


	SIGNAL binarydigitout0, binarydigitout2, binarydigitout3, binarydigitout4, binarydigitout5, binarydigitout6, binarydigitout7, binarydigitout1: std_logic;
begin

	bin0: BinaryDigit Port Map (clock, input(0), load, binarydigitout0);
	bin1: BinaryDigit Port Map (clock, input(1), load, binarydigitout1);
	bin2: BinaryDigit Port Map (clock, input(2), load, binarydigitout2);
	bin3: BinaryDigit Port Map (clock, input(3), load, binarydigitout3);
	bin4: BinaryDigit Port Map (clock, input(4), load, binarydigitout4);
	bin5: BinaryDigit Port Map (clock, input(5), load, binarydigitout5);
	bin6: BinaryDigit Port Map (clock, input(6), load, binarydigitout6);
	bin7: BinaryDigit Port Map (clock, input(7), load, binarydigitout7);

	output(0) <= binarydigitout0;
	output(1) <= binarydigitout1;
	output(2) <= binarydigitout2;
	output(3) <= binarydigitout3;
	output(4) <= binarydigitout4;
	output(5) <= binarydigitout5;
	output(6) <= binarydigitout6;
	output(7) <= binarydigitout7;

end architecture;
