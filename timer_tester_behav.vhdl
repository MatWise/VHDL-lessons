architecture behav of timer_tester is
begin
  process(clk, res_n) is 
    variable duration_dec_cnt: natural range 0 to 4;
  begin
    if res_n = '0' then
      start_timer <= '0';
    else
      if clk'event and clk = '1' then
        start_timer <= '1';
        if timer_expired = '1' then
          if duration_dec_cnt = 4 then
            duration_dec_cnt := 0;
            res_duration <= '1';
            dec_duration <= '0';
          else
            dec_duration <= '1';
            res_duration <= '0';
            duration_dec_cnt := duration_dec_cnt + 1;
          end if;
        else
          res_duration <= '0';
          dec_duration <= '0';
        end if;
      end if;
    end if;
  end process;
end architecture behav;
