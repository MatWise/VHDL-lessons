architecture behav of random_tester is
begin
  process is
  begin
    next_rnd <= '0';
    store_rnd <= '0';
    restore_rnd <= '0';
    wait until res_n = '1';
    loop
      wait on clk until clk = '1';
      -- Count upwards 8 times
      store_rnd <= '0';
      restore_rnd <= '0';
      next_rnd <= '1';
      for i in 0 to 7 loop
        wait on clk until clk = '1';
      end loop;

      -- Store current random
      next_rnd <= '0';
      store_rnd <= '1';
      wait on clk until clk = '1';
      
      -- Count upwards 8 times
      store_rnd <= '0';
      next_rnd <= '1';
      for i in 0 to 7 loop
        wait on clk until clk = '1';
      end loop;

      -- Restore number
      store_rnd <= '0';
      restore_rnd <= '1';
      next_rnd <= '0';
      wait on clk until clk = '1';
    end loop;
  end process;
end architecture behav;
