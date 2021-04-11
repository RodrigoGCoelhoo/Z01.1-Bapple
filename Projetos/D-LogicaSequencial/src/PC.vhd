-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of PC is

 signal muxIn, muxOut, registerOut, incOut : std_logic_vector(15 downto 0);

  component Inc16 is
      port(
          a   :  in STD_LOGIC_VECTOR(15 downto 0);
          q   : out STD_LOGIC_VECTOR(15 downto 0)
          );
  end component;

  component Mux16 is
      port(
          a  :   in  STD_LOGIC_VECTOR(15 downto 0);
          b  :   in  STD_LOGIC_VECTOR(15 downto 0);
          sel:   in  STD_LOGIC;
          q  :   out STD_LOGIC_VECTOR(15 downto 0)
          );
  end component;

  component Register16 is
      port(
          clock:   in STD_LOGIC;
          input:   in STD_LOGIC_VECTOR(15 downto 0);
          load:    in STD_LOGIC;
          output: out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

begin

  inc: Inc16 PORT MAP(registerOut, incOut);

  muxIn <= registerOut when increment = '0' else incOut;

  reg16: Register16 PORT MAP(clock, muxOut, '1', registerOut);

  mux: Mux16 PORT MAP(muxIn, input, load, muxOut);


  process(clock) begin
    if reset = '1' then
        output <= "0000000000000000";
    elsif load = '1' then
        output <= input;
    elsif increment = '1' then
        output <= incOut;
    else
        output <= registerOut;
    end if;
  end process;

end architecture;
