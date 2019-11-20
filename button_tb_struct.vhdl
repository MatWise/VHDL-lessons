library ieee; use ieee.std_logic_1164.all;

architecture struct of button_tb is
  signal clk, res_n: std_logic;
  signal key, tx_n: std_logic;
begin
  clk_res_gen: entity work.clk_res_gen
  port map(
    clk => clk,
    res_n => res_n);

  button: entity work.button
  port map(
    clk => clk,
    res_n => res_n,
    key => key,
    tx_n => tx_n);
  
  tester: entity work.button_tester
  port map(
    tx_n => tx_n);
end architecture struct;