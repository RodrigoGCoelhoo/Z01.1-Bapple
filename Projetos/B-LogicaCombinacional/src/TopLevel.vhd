--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
    port(
      CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(9 downto 0);
      HEX0     : out std_logic_vector(6 downto 0); -- 7seg0
      HEX1     : out std_logic_vector(6 downto 0); -- 7seg0
		HEX2     : out std_logic_vector(6 downto 0); -- 7seg0
		
		intermediario1 		 : inout std_logic_vector(3 downto 0);
		intermediario2		 	 : inout std_logic_vector(3 downto 0);
		intermediario3 		 : inout std_logic_vector(3 downto 0);


		LEDR     : out std_logic_vector(9 downto 0)
    );
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------
	
---------------
-- implementacao
---------------
begin
	

	with SW(3 downto 0) select
		HEX0 <= "0000001" when "0000", --numero 0 
				"1001111" when "0001", --numero 1
				"0010010" when "0010", --numero 2
				"0000110" when "0011", --numero 3
				"1001100" when "0100", --numero 4
				"0100100" when "0101", --numero 5
				"0100000" when "0110", --numero 6
				"0001111" when "0111", --numero 7
				"1111111" when "1000", --numero 8
				"0000100" when others; --numero 9
	
	with SW(6 downto 3) select
		HEX1 <= "0000001" when "0000", --numero 0 
				"1001111" when "0001", --numero 1
				"0010010" when "0010", --numero 2
				"0000110" when "0011", --numero 3
				"1001100" when "0100", --numero 4
				"0100100" when "0101", --numero 5
				"0100000" when "0110", --numero 6
				"0001111" when "0111", --numero 7
				"1111111" when "1000", --numero 8
				"0000100" when others; --numero 9

	with SW(9 downto 6) select
		HEX2 <= "0000001" when "0000", --numero 0 
				"1001111" when "0001", --numero 1
				"0010010" when "0010", --numero 2
				"0000110" when "0011", --numero 3
				"1001100" when "0100", --numero 4
				"0100100" when "0101", --numero 5
				"0100000" when "0110", --numero 6
				"0001111" when "0111", --numero 7
				"1111111" when "1000", --numero 8
				"0000100" when others; --numero 9
end rtl;