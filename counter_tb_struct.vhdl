library ieee; use ieee.std_logic_1164.all;

architecture struct of counter_tb is
  signal clk, res_n: std_logic;
  signal res_step, inc_step: std_logic;
  signal res_score, inc_score: std_logic;
  signal step_eq_score: std_logic;
  signal score_low, score_high: std_logic_vector(6 downto 0);
begin

  clk_res_gen: entity work.clk_res_gen
  port map(
    clk => clk,
    res_n => res_n);
  
  tester: entity work.counter_tester
  port map(
    clk => clk,
    res_n => res_n,
    inc_step => inc_step,
    res_step => res_step,
    inc_score => inc_score,
    res_score => res_score);
  
  counter: entity work.counter
  port map(
    clk => clk,
    res_n => res_n,
    inc_step => inc_step,
    res_step => res_step,
    inc_score => inc_score,
    res_score => res_score,    
    step_eq_score => step_eq_score,
    score_low => score_low,
    score_high => score_high);
end architecture struct;
