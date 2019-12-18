library ieee; use ieee.std_logic_1164.all;

architecture struct of timer_tb is
  signal clk, res_n: std_logic;
  signal start_timer, timer_expired, res_timer, res_duration, dec_duration: std_logic;
begin
  clk_res_gen: entity work.clk_res_gen
  port map(
    clk => clk,
    res_n => res_n);

  timer: entity work.timer
  port map(
    clk => clk,
    res_n => res_n,
    res_duration => res_duration,
    dec_duration => dec_duration,
    start_timer => start_timer,
    timer_expired => timer_expired,
    res_timer => res_timer);
  
  tester: entity work.timer_tester
  port map(
    clk => clk,
    res_n => res_n,
    timer_expired => timer_expired,
    dec_duration => dec_duration,
    res_duration => res_duration,
    start_timer => start_timer);
end architecture struct;
