-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: CPU.vhd
-- date: 4/4/2017

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CPU is
  port(
    clock:       in  STD_LOGIC;                        -- sinal de clock para CPU
    reset:       in  STD_LOGIC;                        -- reinicia toda a CPU (inclusive o Program Counter)
    inM:         in  STD_LOGIC_VECTOR(15 downto 0);    -- dados lidos da memória RAM
    instruction: in  STD_LOGIC_VECTOR(17 downto 0);    -- instrução (dados) vindos da memória ROM
    outM:        out STD_LOGIC_VECTOR(15 downto 0);    -- dados para gravar na memória RAM
    writeM:      out STD_LOGIC;                        -- faz a memória RAM gravar dados da entrada
    addressM:    out STD_LOGIC_VECTOR(14 downto 0);    -- envia endereço para a memória RAM
    pcout:       out STD_LOGIC_VECTOR(14 downto 0)     -- endereço para ser enviado a memória ROM
    );
end entity;

architecture arch of CPU is

  component Mux16 is
    port (
      a:   in  STD_LOGIC_VECTOR(15 downto 0);
      b:   in  STD_LOGIC_VECTOR(15 downto 0);
      sel: in  STD_LOGIC;
      q:   out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component DMux2Way16 is
    port (
      a:   in  STD_LOGIC_VECTOR(15 downto 0);
      sel: in  STD_LOGIC;
      q0:  out STD_LOGIC_VECTOR(15 downto 0);
      q1:  out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component ALU is
    port (
      x,y:   in STD_LOGIC_VECTOR(15 downto 0);
      zx:    in STD_LOGIC;
      nx:    in STD_LOGIC;
      zy:    in STD_LOGIC;
      ny:    in STD_LOGIC;
      f:     in STD_LOGIC;
      no:    in STD_LOGIC;
      zr:    out STD_LOGIC;
      ng:    out STD_LOGIC;
      saida: out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component Register16 is
    port(
      clock:   in std_logic;
      input:   in STD_LOGIC_VECTOR(15 downto 0);
      load:    in std_logic;
      output: out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component pc is
    port(
      clock     : in  STD_LOGIC;
      increment : in  STD_LOGIC;
      load      : in  STD_LOGIC;
      reset     : in  STD_LOGIC;
      input     : in  STD_LOGIC_VECTOR(15 downto 0);
      output    : out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component ControlUnit is
    port(
      instruction                 : in STD_LOGIC_VECTOR(17 downto 0);
      zr,ng                       : in STD_LOGIC;
      muxALUI_AD                   : out STD_LOGIC;
      dmuxALUI_AD                 : out STD_LOGIC;
      muxAM                       : out STD_LOGIC;
      zx, nx, zy, ny, f, no       : out STD_LOGIC;
      loadA, loadD, loadM, loadPC : out STD_LOGIC
      );
  end component;

  signal c_muxALUI_AD: STD_LOGIC;
  signal c_dmuxALUI_AD: STD_LOGIC;
  signal c_muxAM: STD_LOGIC;
  signal c_zx: STD_LOGIC;
  signal c_nx: STD_LOGIC;
  signal c_zy: STD_LOGIC;
  signal c_ny: STD_LOGIC;
  signal c_f: STD_LOGIC;
  signal c_no: STD_LOGIC;
  signal c_loadA: STD_LOGIC;
  signal c_loadD: STD_LOGIC;
  signal c_loadPC: STD_LOGIC;
  signal c_zr: std_logic := '0';
  signal c_ng: std_logic := '0';

  signal s_muxALUI_ADout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_dmuxALUI_Aout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_dmuxALUI_Dout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_muxAM_out: STD_LOGIC_VECTOR(15 downto 0);
  signal s_regAout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_regDout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_ALUout: STD_LOGIC_VECTOR(15 downto 0);

  signal s_pcout: STD_LOGIC_VECTOR(15 downto 0);

begin

 ula: ALU PORT MAP (s_regDout, s_muxAM_out, c_zx, c_nx, c_zy, c_ny, c_f, c_no, c_zr, c_ng, s_ALUout);
 
 control_unit: ControlUnit PORT MAP (instruction, c_zr, c_ng, c_muxALUI_AD, c_dmuxALUI_AD, c_muxAM, c_zx, c_nx, c_zy, c_ny, c_f, c_no, c_loadA, c_loadD, writeM, c_loadPC);
 
 muxALUI_AD: Mux16 PORT MAP (s_ALUout, instruction(15 downto 0), c_muxALUI_AD, s_muxALUI_ADout);

 dmuxALUI_AD: DMux2Way16 PORT MAP (s_muxALUI_ADout, c_dmuxALUI_AD, s_dmuxALUI_Dout, s_dmuxALUI_Aout);
 
 reg_A: Register16 PORT MAP (clock, s_dmuxALUI_Aout, c_loadA, s_regAout);
 
 muxAM: Mux16 PORT MAP (s_regAout, inM, c_muxAM, s_muxAM_out);
 
 reg_D: Register16 PORT MAP (clock, s_dmuxALUI_Dout, c_loadD, s_regDout);
 
 pece: pc PORT MAP (clock, '1', c_loadPC, reset, s_regAout, s_pcout);
 
 outM <= s_ALUout;
 
 addressM <= s_regAout(14 downto 0);
 
 pcout <= s_pcout(14 downto 0);

end architecture;
