library ieee; use ieee.std_logic_1164.all;

entity random_analyzer is
  port(
    clk: in std_logic;
    res_n: in std_logic;
    rnd: in std_logic_vector(1 downto 0));
end entity random_analyzer;
