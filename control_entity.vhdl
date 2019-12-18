library ieee; use ieee.std_logic_1164.all;

entity control is
port(
  clk, res_n: in std_logic;
  next_rnd, store_rnd, restore_rnd: out std_logic; -- random in
  rnd: in std_logic_vector(1 downto 0); -- random out
  start_timer, dec_duration, res_duration, res_timer: out std_logic; -- timer in
  timer_expired: in std_logic; -- timer out
  inc_step, inc_score, res_step, res_score: out std_logic; -- counter in
  step_eq_score: in std_logic; -- counter out
  key_valid: in std_logic; -- input out
  key_color: in std_logic_vector(1 downto 0); -- input out
  led_on, all_on: out std_logic -- output in  
);
end entity control;
