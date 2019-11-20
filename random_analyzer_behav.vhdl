architecture behav of random_analyzer is
begin
  process(clk, res_n) is
  begin
    if clk'event and clk = '1' and res_n = '1' then
      report "Current number: " & std_logic'image(rnd(0)) & std_logic'image(rnd(1));
    end if;
  end process;
end architecture behav;
