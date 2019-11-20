library ieee; use ieee.numeric_std.all;

architecture behav of counter is
  constant SIZE: positive := 6;
  constant MAX: positive := 2 ** SIZE - 1;
  signal step, score: std_logic_vector(SIZE-1 downto 0);
  signal low_bcd, high_bcd: std_logic_vector(3 downto 0);
begin
  handle_step: process(clk, res_n) is
    variable step_int: natural range 0 to MAX;
  begin
    if res_n = '0' then
      step_int := 0;
    elsif clk'event and clk = '1' then
      if res_step = '1' then
        step_int := 0;
      elsif inc_step = '1' then
        if step_int = MAX then
          step_int := 0;
        else
          step_int := step_int + 1;
        end if;
      end if;
    end if;
    step <= std_logic_vector(to_unsigned(step_int, SIZE));
  end process handle_step;

  handle_score: process(clk, res_n) is
    variable score_int: natural range 0 to MAX;
  begin
    if res_n = '0' then
      score_int := 0;
    elsif clk'event and clk = '1' then
      if res_score = '1' then
        score_int := 0;
      elsif inc_score = '1' then
        if score_int = MAX then
          score_int := 0;
        else
          score_int := score_int + 1;
        end if;
      end if;
    end if;
    score <= std_logic_vector(to_unsigned(score_int, SIZE));
  end process handle_score;

  step_eq_score <= '1' when step = score else '0';
  
  -- Use the double dabble algorithm
  bin2bcd: process(score) is
    variable temp: std_logic_vector(SIZE-1 downto 0);
    -- high = bcd(7 downto 4)
    -- low = bcd(3 downto 0)
    variable bcd: unsigned(7 downto 0) := (others => '0');
  begin
    bcd := (others => '0');
    temp(SIZE-1 downto 0) := score;

    for i in 0 to 5 loop
      if bcd(3 downto 0) > 4 then 
        bcd(3 downto 0) := bcd(3 downto 0) + 3;
      end if;
      if bcd(7 downto 4) > 4 then 
        bcd(7 downto 4) := bcd(7 downto 4) + 3;
      end if;
      bcd := bcd(6 downto 0) & temp(SIZE-1);
      temp := temp(SIZE-2 downto 0) & '0';
    end loop;
    
    low_bcd <= std_logic_vector(bcd(3 downto 0));
    high_bcd <= std_logic_vector(bcd(7 downto 4));
  end process bin2bcd;

  bcd2segment: process(low_bcd, high_bcd) is
  begin
    case low_bcd is
      when "0000" => score_low <= "0000001"; ---0
      when "0001" => score_low <= "1001111"; ---1
      when "0010" => score_low <= "0010010"; ---2
      when "0011" => score_low <= "0000110"; ---3
      when "0100" => score_low <= "1001100"; ---4
      when "0101" => score_low <= "0100100"; ---5
      when "0110" => score_low <= "0100000"; ---6
      when "0111" => score_low <= "0001111"; ---7
      when "1000" => score_low <= "0000000"; ---8
      when "1001" => score_low <= "0000100"; ---9
      when others => score_low <= "1111111"; ---null
    end case;
    case high_bcd is
      when "0000" => score_high <= "0000001"; ---0
      when "0001" => score_high <= "1001111"; ---1
      when "0010" => score_high <= "0010010"; ---2
      when "0011" => score_high <= "0000110"; ---3
      when "0100" => score_high <= "1001100"; ---4
      when "0101" => score_high <= "0100100"; ---5
      when "0110" => score_high <= "0100000"; ---6
      when "0111" => score_high <= "0001111"; ---7
      when "1000" => score_high <= "0000000"; ---8
      when "1001" => score_high <= "0000100"; ---9
      when others => score_high <= "1111111"; ---null
    end case;
  end process bcd2segment;
end architecture behav;
