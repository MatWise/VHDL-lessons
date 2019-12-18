architecture behav of timer is
  subtype timer_counter is time range 0 fs to time'high;
  signal counter: timer_counter;
  signal d: timer_counter;
  constant clk_duration: time := 20 ns;
  
begin
  counter_inc: process(clk, res_n) is
    variable timer_started : std_logic := '0';
    variable cnt: timer_counter;
  begin
    if res_n = '0' then
      counter <= 0 ns;
      cnt := 0 ns;
      timer_started := '0';
    else
      if clk'event and clk = '1' then
        if res_timer = '1' then
          cnt := 0 ns;
          timer_started := '0';
        end if;
        if start_timer = '1' then
          timer_started := '1';
        end if;
        if cnt >= d then
          timer_started := '0';
          cnt := 0 ns;
        end if;
        if timer_started = '1' then
          cnt := cnt + clk_duration;
        end if;
      end if;
      counter <= cnt;
    end if;
  end process counter_inc;

  duration_mod: process(clk, res_n) is
    constant std_d: time := 1 ms; --1000 ms;
    constant duration_decrease: time := 100 us; --100 ms;
  begin
    if res_n = '0' then
      d <= std_d;
    else
      if clk'event and clk = '1' then
        if res_duration = '1' then
          d <= std_d;
        elsif dec_duration = '1' then
          if (d - duration_decrease) > 0 fs then
            d <= d - duration_decrease;
          end if;
        end if;
      end if;
    end if;
  end process duration_mod;
  
  output: process(clk, res_n) is 
    variable te : std_logic;
  begin
    if res_n = '0' then
      timer_expired <= '0';
      te := '0';
    else
      if clk'event and clk = '1' then
        if counter >= d then
          timer_expired <= '1';
          te := '1';
        elsif te = '1' then
          timer_expired <= '0';
          te := '0';
        end if;
      end if;
    end if;
  end process output;
end architecture behav;