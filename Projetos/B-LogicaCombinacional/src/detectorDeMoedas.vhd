library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detectorDeMoedas is
	port (
    Q,D,N : in  STD_LOGIC;
    cents     : out STD_LOGIC_VECTOR(4 downto 0));
end entity;

architecture arch of detectorDeMoedas is

begin

    cents <= "11001" when (Q = '1' AND D = '0' AND N = '0') else
            "01010" when (Q = '0' AND D = '1' AND N = '0') else
            "00101" when (Q = '0' AND D = '0' AND N = '1') else
            "00000";

end architecture;
