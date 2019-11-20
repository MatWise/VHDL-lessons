architecture behav of button is
  signal sync_out: std_logic;
  type state is (IDLE, TRIGGERED, WAIT_FOR_ZERO);
  signal current_state, next_state: state;
begin
  synchronizer: process(clk, res_n) is
    variable sync_rank1, sync_rank2: std_logic;
  begin
    if res_n <= '0' then
      sync_rank1 := '0';
      sync_rank2 := '0';
      sync_out <= '0';
    else 
      if clk'event and clk = '1' then
        sync_rank2 := sync_rank1;
        sync_rank1 := not tx_n;
        sync_out <= sync_rank2;
      end if;
    end if;
  end process;
  
  shortener_state: process(clk, res_n) is
  begin
    if res_n = '0' then
      current_state <= IDLE;
    else
      if clk'event and clk = '1' then
        current_state <= next_state;
      end if;
    end if;
  end process shortener_state;

  shortener_out: process(current_state) is
  begin
    case current_state is
    when IDLE | WAIT_FOR_ZERO =>
      key <= '0';
    when TRIGGERED =>
      key <= '1';
    end case;
  end process shortener_out;
  
  shortener_transition: process(current_state, sync_out) is
  begin
    case current_state is
    when IDLE =>
      if sync_out = '0' then
        next_state <= IDLE;
      else
        next_state <= TRIGGERED;
      end if;
    when TRIGGERED =>
      if sync_out = '0' then
        next_state <= IDLE;
      else
        next_state <= WAIT_FOR_ZERO;
      end if;
    when WAIT_FOR_ZERO =>
      if sync_out = '0' then
        next_state <= IDLE;
      else
        next_state <= WAIT_FOR_ZERO;
      end if;
    end case;
  end process shortener_transition;
end architecture behav;
