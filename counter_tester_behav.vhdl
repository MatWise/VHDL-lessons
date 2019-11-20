architecture behav of counter_tester is
begin
  process(clk, res_n) is
    variable score, step: natural range 0 to 99;
  begin
    if res_n = '0' then
      score := 0;
      step := 0;
      inc_step <= '0';
      res_step <= '0';
      inc_score <= '0';
      res_score <= '0';
    elsif clk'event and clk = '1' then
      if step = score then
        inc_step <= '0';
        res_step <= '1';
        inc_score <= '1';
        res_score <= '0';
        score := score + 1;
        step := 0;
      elsif score = 20 then
        inc_step <= '0';
        res_step <= '1';
        inc_score <= '0';
        res_score <= '1';
        score := 0;
        step := 0;
      else
        inc_step <= '1';
        res_step <= '0';
        inc_score <= '0';
        res_score <= '0';
        step := step + 1;
      end if;
    end if;
  end process;
end architecture behav;
