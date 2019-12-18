library ieee; use ieee.std_logic_1164.all;

entity timer_tester is
  port(
    clk, res_n: in std_logic;
    timer_expired: in std_logic;
    start_timer, dec_duration, res_duration: out std_logic);
end entity timer_tester;
