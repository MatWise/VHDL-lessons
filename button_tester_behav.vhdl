architecture behav of button_tester is
begin
  process is
  begin
    tx_n <= '1';
    wait for 94 ns;
    tx_n <= '0';
    wait for 48 ns;
  end process;
end architecture behav;
