library ieee; use ieee.std_logic_1164.all;

architecture struct of senso is
  signal clk, res_n: std_logic; --clk_res_gen
  signal start_timer, timer_expired, res_duration, dec_duration, res_timer: std_logic; --timer
  signal next_rnd, store_rnd, restore_rnd: std_logic; --random
  signal rnd: std_logic_vector(1 downto 0); --random
  signal key_valid: std_logic; --input 
  signal key_color: std_logic_vector(1 downto 0); --input
  signal key_in_n: std_logic_vector(3 downto 0); --input
  signal led_on, all_on: std_logic; --output
  signal leds: std_logic_vector(3 downto 0); --output
  signal inc_step, inc_score, res_step, res_score, step_eq_score: std_logic; --counter 
  signal score_low, score_high: std_logic_vector(6 downto 0);
begin
  clk_res_gen: entity work.clk_res_gen
  port map(
    clk => clk,
    res_n => res_n);
  
  timer: entity work.timer
  port map(
    start_timer => start_timer,
    timer_expired => timer_expired,
    res_duration  => res_duration,
    dec_duration => dec_duration,
    res_timer => res_timer,
    clk => clk,
    res_n => res_n);

  random: entity work.random
  port map(
    next_rnd => next_rnd,
    store_rnd => store_rnd,
    restore_rnd => restore_rnd,
    rnd => rnd,
    clk => clk,
    res_n => res_n);
  
  input: entity work.input
  port map(
    key_valid => key_valid,
    key_color => key_color,
    key_in_n => key_in_n, 
    clk => clk,
    res_n => res_n);

  output: entity work.output
  port map(
    led_on => led_on,
    all_on => all_on,
    color => rnd, 
    leds => leds);
  
  counter: entity work.counter
  port map(
    clk => clk,
    res_n => res_n,
    res_step => res_step, 
    inc_step => inc_step,
    res_score => res_score, 
    inc_score => inc_score,
    step_eq_score => step_eq_score,
    score_low => score_low, 
    score_high => score_high);
  
  control: entity work.control
  port map(
    clk => clk,
    res_n => res_n,
    next_rnd => next_rnd,
    store_rnd => store_rnd,
    restore_rnd => restore_rnd,
    rnd => rnd,
    start_timer => start_timer,
    dec_duration => dec_duration,
    res_duration => res_duration, 
    res_timer => res_timer,
    timer_expired => timer_expired,
    inc_step => inc_step,
    inc_score => inc_score,
    res_step => res_step, 
    res_score => res_score,
    step_eq_score => step_eq_score,
    key_valid => key_valid,
    key_color => key_color,
    led_on => led_on,
    all_on => all_on);

end architecture struct;
