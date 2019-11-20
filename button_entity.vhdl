library ieee; use ieee.std_logic_1164.all;

entity button is
  port( 
    clk, res_n: in std_logic;
    tx_n: in std_logic;
    key: out std_logic);
end entity button;
