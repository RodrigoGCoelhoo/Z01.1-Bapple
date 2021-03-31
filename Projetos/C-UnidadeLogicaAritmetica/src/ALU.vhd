-- Elementos de Sistemas
-- by Luciano Soares
-- ALU.vhd

-- Unidade Lógica Aritmética (ULA)
-- Recebe dois valores de 16bits e
-- calcula uma das seguintes funções:
-- X+y, x-y, y-x, 0, 1, -1, x, y, -x, -y,
-- X+1, y+1, x-1, y-1, x&y, x|y
-- De acordo com os 6 bits de entrada denotados:
-- zx, nx, zy, ny, f, no.
-- Também calcula duas saídas de 1 bit:
-- Se a saída == 0, zr é definida como 1, senão 0;
-- Se a saída <0, ng é definida como 1, senão 0.
-- a ULA opera sobre os valores, da seguinte forma:
-- se (zx == 1) então x = 0
-- se (nx == 1) então x =! X
-- se (zy == 1) então y = 0
-- se (ny == 1) então y =! Y
-- se (f == 1) então saída = x + y
-- se (f == 0) então saída = x & y
-- se (no == 1) então saída = !saída
-- se (out == 0) então zr = 1
-- se (out <0) então ng = 1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
	port (
			x,y:       in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
			zx:        in STD_LOGIC;                     -- zera a entrada x
			nx:        in STD_LOGIC;                     -- inverte a entrada x
			zy:        in STD_LOGIC;                     -- zera a entrada y
			ny:        in STD_LOGIC;                     -- inverte a entrada y
			f:         in STD_LOGIC_VECTOR(1 downto 0);                     -- se 0 calcula x & y, senão x + y
			xr: 	   in STD_LOGIC;					 -- sinal de xor
			no:        in STD_LOGIC;                     -- inverte o valor da saída
			zr:        out STD_LOGIC;                    -- setado se saída igual a zero
			ng:        out STD_LOGIC;                    -- setado se saída é negativa
			carryOUT:  out STD_LOGIC;					 -- sinal de estouro de saida 
 			saida:     out STD_LOGIC_VECTOR(15 downto 0) -- saída de dados da ALU
	);
end entity;

architecture  rtl OF alu is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

	component zerador16 IS
		port(z   : in STD_LOGIC;
			 a   : in STD_LOGIC_VECTOR(15 downto 0);
			 y   : out STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;

	component inversor16 is
		port(z   : in STD_LOGIC;
			 a   : in STD_LOGIC_VECTOR(15 downto 0);
			 y   : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Add16 is
		port(
			a   :  in STD_LOGIC_VECTOR(15 downto 0);
			b   :  in STD_LOGIC_VECTOR(15 downto 0);
			q   : out STD_LOGIC_VECTOR(15 downto 0);
			carry : out STD_LOGIC
		);
	end component;

	component And16 is
		port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component comparador16 is
		port(
			a   : in STD_LOGIC_VECTOR(15 downto 0);
			zr   : out STD_LOGIC;
			ng   : out STD_LOGIC
    );
	end component;

	component Mux16 is
		port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			c:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

   SIGNAL carry: std_logic;	
   SIGNAL zxout,zyout,nxout,nyout,andout,adderout,muxout,precomp, xorOUT: std_logic_vector(15 downto 0);

begin
  -- Implementação vem aqui!
  
  -- Verifica se precisa zerar as entradas
  zeraX: zerador16 PORT MAP (zx, x, zxout);
  zeraY: zerador16 PORT MAP (zy, y, zyout);
  
  -- Verifica se precisa inverter a saida
  inverteX: inversor16 PORT MAP (nx, zxout, nxout);
  inverteY: inversor16 PORT MAP (ny, zyout, nyout);
  
  -- Faz ambas as combinacoes And e Add e Xor
  xANDy: And16 PORT MAP (nxout, nyout, andout);
  xADDy: Add16 PORT MAP (nxout, nyout, adderout, carry);
  xorOUT <= nxout xor nyout;

  -- Mux16
  mux: Mux16 PORT MAP (andout, adderout, xorOUT, f, muxout);
  
  -- Verifica se precisa inverter a saida
  invertOUT: inversor16 PORT MAP (no, muxout, precomp);
  
  -- Comparador para verificar se saida zero ou neg
  comparador: comparador16 PORT MAP (precomp, zr, ng);
  
  saida <= precomp;
  carryOUT <= carry;

end architecture;
