architecture behav of reset_counter is
begin
  process(clk, res_n) is
    constant MAX: integer := 2 ** SIZE - 1;
    variable q_int: integer range 0 to MAX;
  begin
    if res_n = '0' then
      q_int := 0;
    elsif clk'event and clk = '1' then
      if q_int = MAX then
        q_int := 0;
      else
        q_int := q_int + 1;
      end if;
    end if;
  
    for i in q'range loop
      if q_int mod 2 ** (i + 1) >= 2 ** i then
        q(i) <= '1';
      else
        q(i) <= '0';
      end if;
    end loop;
  end process;
end architecture behav;   
