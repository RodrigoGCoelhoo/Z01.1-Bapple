-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :           in STD_LOGIC_VECTOR(15 downto 0);
		b   :           in STD_LOGIC_VECTOR(15 downto 0);
    saidacarry:     out STD_LOGIC;
    q   :           out STD_LOGIC_VECTOR(15 downto 0)
    
	);
end entity;

architecture rtl of Add16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  signal carry0, carry1, carry2, carry3, carry4, carry5, carry6, carry7, carry8, carry9, carry10, carry11, carry12, carry13, carry14 : std_logic;

  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
    );
  end component;

begin
  -- Implementação vem aqui!

  u0 : FullAdder port map(
    a => a(0),
    b => b(0),
    c => '0',
    soma => q(0),
    vaium => carry0
  );

  u1 : FullAdder port map(
    a => a(1),
    b => b(1),
    c => carry0,
    soma => q(1),
    vaium => carry1
  );

  u2 : FullAdder port map(
    a => a(2),
    b => b(2),
    c => carry1,
    soma => q(2),
    vaium => carry2
  );

  u3 : FullAdder port map(
    a => a(3),
    b => b(3),
    c => carry2,
    soma => q(3),
    vaium => carry3
  );

  u4 : FullAdder port map(
    a => a(4),
    b => b(4),
    c => carry3,
    soma => q(4),
    vaium => carry4
  );

  u5 : FullAdder port map(
    a => a(5),
    b => b(5),
    c => carry4,
    soma => q(5),
    vaium => carry5
  );

  u6 : FullAdder port map(
    a => a(6),
    b => b(6),
    c => carry5,
    soma => q(6),
    vaium => carry6
  );

  u7 : FullAdder port map(
    a => a(7),
    b => b(7),
    c => carry6,
    soma => q(7),
    vaium => carry7
  );

  u8 : FullAdder port map(
    a => a(8),
    b => b(8),
    c => carry7,
    soma => q(8),
    vaium => carry8
  );

  u9 : FullAdder port map(
    a => a(9),
    b => b(9),
    c => carry8,
    soma => q(9),
    vaium => carry9
  );

  u10 : FullAdder port map(
    a => a(10),
    b => b(10),
    c => carry9,
    soma => q(10),
    vaium => carry10
  );

  u11 : FullAdder port map(
    a => a(11),
    b => b(11),
    c => carry10,
    soma => q(11),
    vaium => carry11
  );

  u12 : FullAdder port map(
    a => a(12),
    b => b(12),
    c => carry11,
    soma => q(12),
    vaium => carry12
  );

  u13 : FullAdder port map(
    a => a(13),
    b => b(13),
    c => carry12,
    soma => q(13),
    vaium => carry13
  );

  u14 : FullAdder port map(
    a => a(14),
    b => b(14),
    c => carry13,
    soma => q(14),
    vaium => carry14
  );

  u15 : FullAdder port map(
    a => a(15),
    b => b(15),
    c => carry14,
    soma => q(15),
    vaium => saidacarry
    --vaium => OPEN
  );
  
end architecture;
