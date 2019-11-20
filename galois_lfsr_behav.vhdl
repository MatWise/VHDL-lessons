architecture behav of galois_lfsr is
begin
  shift: process(clk, res_n) is
    variable q_int: std_logic_vector(7 downto 0) := "11111010";
  begin
    if res_n = '0' then
      q_int := "11111010";
    else
      if clk'event and clk = '1' then
        if reset = '1' then
          q_int := "11111010";
        else
          if q_int(7) = '1' then
            q_int := (q_int(6 downto 0) xor fb) & q_int(7);
          else
            q_int := q_int(6 downto 0) & q_int(7);
          end if;
        end if;
      end if;
    end if;
    q <= q_int;
  end process shift;
end architecture behav;
