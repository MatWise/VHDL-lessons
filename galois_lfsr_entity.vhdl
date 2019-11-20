library ieee; use ieee.std_logic_1164.all;

entity galois_lfsr is
  port(
    clk: in std_logic;
    res_n: in std_logic;
    reset: in std_logic;
    fb: in std_logic_vector(7 downto 1);
    q: out std_logic_vector(7 downto 0));
end entity galois_lfsr;
