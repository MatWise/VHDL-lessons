library ieee; use ieee.std_logic_1164.all;

architecture struct of galois_lfsr_tb is
  signal clk, res_n, reset: std_logic;
  signal q: std_logic_vector(7 downto 0);
  signal fb: std_logic_vector(7 downto 1);
begin

  clk_res_gen: entity work.clk_res_gen
  port map(
    clk => clk,
    res_n => res_n);
  
  tester: entity work.galois_tester
  port map(
    clk => clk,
    res_n => res_n,
    reset => reset,
    fb => fb);
  
  galois_lfsr: entity work.galois_lfsr
  port map(
    clk => clk,
    res_n => res_n,
    reset => reset,
    fb => fb,
    q => q);
  
  analyzer: entity work.galois_analyzer
  port map(
    clk => clk,
    res_n => res_n,
    reset => reset,
    q => q);
end architecture struct;
