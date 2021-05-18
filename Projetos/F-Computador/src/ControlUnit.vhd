-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017
-- Modificação:
--   - Rafael Corsi : nova versão: adicionado reg S
--
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e
                                                                     -- ng (se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- instrução  e ALU para reg. A
		muxAM                       : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- reg. A e Mem. RAM para ALU
                                                                     -- A  e Mem. RAM para ALU
    dmux_as                     : out STD_LOGIC;                     -- S -> 1 e A -> 0 
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadM, loadPC, loadS : out STD_LOGIC               -- sinais de load do reg. A,
                                                                     -- reg. D, Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is
  signal c_loadS: STD_LOGIC;

begin

  c_loadS <= instruction(17) and instruction(16) and instruction(3);

  loadS <= c_loadS;

  --tanto  o bit 17 quanto o bit 4 tem que ser 1
  loadD <= instruction(17) and instruction(4);
  --tanto o bit 17 quanto o bit 5 tem que ser 1
  loadM <= instruction(17) and instruction(5);
  loadA <= (not(instruction(17)) or (instruction(17) and instruction(3))) and not(c_loadS);
  --tem que verificar o bit 17
  muxALUI_A <= not(instruction(17));
  --tem que receber o bit 12
  zx <= (instruction(12)) and (instruction(17));
  nx <= instruction(11) and instruction(17);
  muxAM <= instruction(13) and instruction(17);
  f <= instruction(8) and instruction(17);
  
  zy <= instruction(10) and instruction(17);
  ny <= instruction(9) and instruction(17);
  no <= instruction(7) and instruction(17);

  LoadPC <=  (instruction(17) and instruction(2) and instruction(1) and instruction(0)) or --JMP
              (instruction(17) and instruction(1) and instruction(2) and not(instruction(0)) and (zr or ng)) or -- JLE
              (instruction(17) and instruction(0) and instruction(2) and not(instruction(1)) and not(zr)) or -- JNE
              (instruction(17) and not(instruction(0)) and instruction(2) and not(instruction(1)) and not(zr) and ng) or --JL
              (instruction(17) and instruction(0) and instruction(1) and not(instruction(2)) and not(ng)) or --JGE
              (instruction(17) and not(instruction(0)) and instruction(1) and not(instruction(2)) and zr and not(ng)) or --JE
              (instruction(17) and not(instruction(2)) and instruction(0) and not(instruction(1)) and not(zr) and not(ng)); -- JG
  
  
  dmux_as <= instruction(17) and instruction(16);

end architecture;
