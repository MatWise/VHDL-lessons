library ieee; use ieee.std_logic_1164.all;

entity random_tester is
  port(
    clk, res_n: in std_logic;
    next_rnd: out std_logic;
    store_rnd: out std_logic;
    restore_rnd: out std_logic);

end entity random_tester;
