architecture behav of clk_res_gen is
begin
  clk_p: process is
  begin
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
  end process clk_p;
  res_n_p: process is
  begin
    res_n <= '0';
    wait for 30 ns;
    res_n <= '1';
    wait;
  end process res_n_p;
end architecture behav;
