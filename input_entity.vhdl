library ieee; use ieee.std_logic_1164.all;

entity input is
  port(
    clk, res_n: in std_logic;
    key_in_n: in std_logic_vector(3 downto 0);
    key_valid: out std_logic;
    key_color: out std_logic_vector(1 downto 0));
end entity input;