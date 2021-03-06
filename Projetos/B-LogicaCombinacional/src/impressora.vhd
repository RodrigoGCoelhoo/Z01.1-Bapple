library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity impressora is
	port (
    SW1,SW2,SW3,SW4 : in  STD_LOGIC;
    x : out STD_LOGIC );
end entity;

architecture arch of impressora is

begin
	x <= '1' when (SW1='1' and SW2='1') or
					  (SW1='1' and SW3='1') or
					  (SW2='1' and SW3='1') or
					  (SW2='1' and SW4='1') or
					  (SW3='1' and SW4='1') else
					  '0';
end architecture;
