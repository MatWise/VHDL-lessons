library ieee; use ieee.std_logic_1164.all;

entity reset_counter is
generic(
  SIZE: positive
);
port(
  clk, res_n: in std_logic;
  reset: in std_logic;
  increment: in std_logic;
  q: out std_logic_vector(SIZE-1 downto 0));
end entity reset_counter;
  
