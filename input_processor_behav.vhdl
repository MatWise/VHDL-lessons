architecture behav of input_processor is
begin
  process(shortened_keys) is
  begin
    key_valid <= '1';
    case shortened_keys is
    when "0000" =>
      key_valid <= '0'; -- not valid if no button was pressed.
    when "0010" =>
      key_color <= "01"; -- yellow
    when "0100" =>
      key_color <= "10"; -- green
    when "1000" =>
      key_color <= "11"; -- blue
    when others =>
      key_color <= "00"; -- red (use as default)
    end case;
  end process;
end architecture behav;