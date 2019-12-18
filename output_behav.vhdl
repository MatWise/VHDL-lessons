architecture behav of output is
begin
  process(led_on, all_on, color) is
  begin
    if led_on = '1' then
      case color is
      when "00" =>
        leds <= "0001"; -- red
      when "01" =>
        leds <= "0010"; -- yellow
      when "10" =>
        leds <= "0100"; -- green
      when "11" =>
        leds <= "1000"; -- blue
      when others =>
        assert(false);
      end case;
    else
      leds <= "0000";  
    end if;
    if all_on = '1' then
      leds <= "1111";
    end if;
  end process;
end architecture behav;
