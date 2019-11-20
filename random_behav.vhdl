library ieee; use ieee.numeric_std.all;

architecture behav of random is
  -- Used for storing the most recent random number.
  signal current_rnd: std_logic_vector(7 downto 0);
  -- Used for saving the number in sr_reg.
  signal saved_rnd: std_logic_vector(7 downto 0);
  -- Output of the shift register that is not yet stored.
  signal lfsr_out: std_logic_vector(7 downto 0);
begin

  -- Produces the next random number based on the one saved in current_rnd.
  lfsr: process(clk, res_n) is
    -- Use a pattern that has a maximum cycle count as it was tested
    -- via the galois test bench.
    constant xor_pattern: integer := 14;
  begin
    if res_n = '0' then
      lfsr_out <= "00000001";
    elsif clk'event and clk = '1' then
      if current_rnd(7) = '1' then
        lfsr_out <= (current_rnd(6 downto 0) 
        xor std_logic_vector(to_unsigned(xor_pattern, 7))) & current_rnd(7);
      else
        lfsr_out <= current_rnd(6 downto 0) & current_rnd(7);
      end if;
    end if;
  end process lfsr;
  
  -- Selects the first and the second bit of the current random number
  -- as output.
  set_rnd_out: process(clk, res_n) is
  begin
    if res_n = '0' then
      rnd(0) <= '0';
      rnd(1) <= '0';
    elsif clk'event and clk = '1' then
      rnd(0) <= current_rnd(0);
      rnd(1) <= current_rnd(1);
    end if;
  end process set_rnd_out;

  -- Modifies saved_rnd and current_rnd, based on the input signals.
  -- If 'store_rnd' is 1, save the current number in 'saved_rnd'.
  -- If 'restore_rnd' is set, set the current number to the saved value.
  -- If 'restore_rnd' is not set and 'next_rnd' is, overwrite the current
  -- number with the output from the shift reg.
  set_rnd_numbers: process(clk, res_n) is
  begin
    if res_n = '0' then
      current_rnd <= "00000001";
      saved_rnd <= "00000001";
    elsif clk'event and clk = '1' then
      if store_rnd = '1' then
        saved_rnd <= current_rnd;
      end if;
      if restore_rnd = '1' then
        current_rnd <= saved_rnd;
      elsif next_rnd = '1' then
        current_rnd <= lfsr_out;
      end if;
    end if;
  end process set_rnd_numbers;
end architecture behav;