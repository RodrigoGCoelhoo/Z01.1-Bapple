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

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		SW      : in  std_logic_vector(9 downto 0);
		LEDR    : out std_logic_vector(9 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------

  signal x : std_logic_vector(15 downto 0) := x"0073"; -- 115
  signal y : std_logic_vector(15 downto 0) := x"005F"; -- 95

--------------
-- component
--------------
  component HalfAdder is
    port(
      a,b:         in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
      );
  end component;

  component FullAdder is
      port(
          a,b,c:      in STD_LOGIC;   -- entradas
          soma,vaium: out STD_LOGIC   -- sum e carry
          );
    end component;

---------------
-- implementacao
---------------
begin

  x(0) <= SW(0);
  y(0) <= SW(2);
  x(1) <= SW(1);
  y(1) <= SW(3);
      
  u1 : FullAdder port map(
	 a => x(0), 
	 b => y(0), 
	 c => '0', 
	 soma => LEDR(0), 
	 vaium => x(2)
  );
  
  u2 : FullAdder port map(
	 a => x(1), 
	 b => y(1), 
	 c => x(2), 
	 soma => LEDR(1), 
	 vaium => LEDR(3)
  );
  
end rtl;
