library ieee; use ieee.std_logic_1164.all;

entity output is
  port( 
    led_on, all_on: in std_logic;
    color: in std_logic_vector(1 downto 0);
    leds: out std_logic_vector(3 downto 0));
end entity output;
    