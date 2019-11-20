library ieee; use ieee.std_logic_1164.all;

entity galois_tester is
  port(
    clk: in std_logic;
    res_n: in std_logic;
    reset: out std_logic;
    fb: out std_logic_vector(7 downto 1));
end entity galois_tester;
