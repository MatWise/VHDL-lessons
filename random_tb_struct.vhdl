library ieee; use ieee.std_logic_1164.all;

architecture struct of random_tb is
  signal clk, res_n: std_logic;
  signal next_rnd, store_rnd, restore_rnd: std_logic;
  signal rnd: std_logic_vector(1 downto 0);
begin

  clk_res_gen: entity work.clk_res_gen
  port map(
    clk => clk,
    res_n => res_n);
  
  tester: entity work.random_tester
  port map(
    clk => clk,
    res_n => res_n,
    next_rnd => next_rnd,
    store_rnd => store_rnd,
    restore_rnd => restore_rnd);
  
  random: entity work.random
  port map(
    clk => clk,
    res_n => res_n,
    next_rnd => next_rnd,
    store_rnd => store_rnd,
    restore_rnd => restore_rnd,
    rnd => rnd);
  
  analyzer: entity work.random_analyzer
  port map(
    clk => clk,
    res_n => res_n,
    rnd => rnd);
end architecture struct;
