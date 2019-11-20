architecture struct of input is
  signal shortened_keys: std_logic_vector(3 downto 0);
begin
  red: entity work.button
  port map(
    clk => clk,
    res_n => res_n,
    tx_n => key_in_n(0),
    key => shortened_keys(0));

  yellow: entity work.button
  port map(
    clk => clk,
    res_n => res_n,
    tx_n => key_in_n(1),
    key => shortened_keys(1));


  green: entity work.button
  port map(
    clk => clk,
    res_n => res_n,
    tx_n => key_in_n(2),
    key => shortened_keys(2));


  blue: entity work.button
  port map(
    clk => clk,
    res_n => res_n,
    tx_n => key_in_n(3),
    key => shortened_keys(3));
  
  input_processor: entity work.input_processor
  port map(
    shortened_keys => shortened_keys,
    key_valid => key_valid,
    key_color => key_color);
end architecture struct;