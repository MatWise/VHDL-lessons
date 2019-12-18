architecture behav of control is
type state is (
  initial, 
  init_game, 
  init_replay, 
  next_play, 
  wait_while_leds_on, 
  wait_while_leds_off, 
  round_won, 
  wait_for_input, 
  correct_button_pressed,
  next_replay,
  game_lost);
signal current_state : state;

begin
  process(clk, res_n) is
  begin
    if res_n = '0' then
      current_state <= initial;
      next_rnd <= '0';
      store_rnd<= '0';
      restore_rnd <= '0';
      inc_step <= '0';
      inc_score <= '0';
      res_step<= '0';
      res_score <= '0';
      led_on<= '0';
      all_on <= '0';
      start_timer <= '0';
      dec_duration <= '0'; 
      res_duration <= '0'; 
      res_timer <= '0';
 

     elsif clk'event and clk = '1' then
      case current_state is
      when initial =>
        next_rnd <= '1';
        store_rnd<= '0';
        restore_rnd <= '0';
        inc_step <= '0';
        inc_score <= '0';
        res_step<= '1';
        res_score <= '1';
        led_on <= '0';
        all_on <= '0';
        start_timer <= '0';
        dec_duration <= '0'; 
        res_duration <= '1'; 
        res_timer <= '1';
        

        if key_valid = '1' then
          current_state <= init_game;
        end if;
      when init_game => 
        next_rnd <= '0';
        store_rnd <= '1';
        restore_rnd <= '0';
        inc_step <= '0';
        inc_score <= '0';
        res_step<= '0';
        res_score <= '0';
        led_on <= '0';
        all_on <= '0';
        start_timer <= '0';
        dec_duration <= '0'; 
        res_duration <= '0'; 
        res_timer <= '0';

        current_state <= wait_while_leds_on;

      when wait_while_leds_on =>
        next_rnd <= '0';
        store_rnd <= '0';
        restore_rnd <= '0';
        inc_step <= '0';
        inc_score <= '0';
        res_step<= '0';
        res_score <= '0';
        led_on <= '1';
        all_on <= '0';
        start_timer <= '1';
        dec_duration <= '0'; 
        res_duration <= '0'; 
        res_timer <= '0';

        if timer_expired = '1' then
          current_state <= wait_while_leds_off;
        end if;

      when wait_while_leds_off =>
        next_rnd <= '0';
        store_rnd <= '0';
        restore_rnd <= '0';
        inc_step <= '0';
        inc_score <= '0';
        res_step<= '0';
        res_score <= '0';
        led_on <= '0';
        all_on <= '0';
        start_timer <= '1';
        dec_duration <= '0'; 
        res_duration <= '0'; 
        res_timer <= '0';

        if timer_expired = '1' then
          if step_eq_score = '1' then
            current_state <= init_replay;
          else
            current_state <= next_play;
          end if;
        end if; 

      when next_play =>
        next_rnd <= '1';
        store_rnd <= '0';
        restore_rnd <= '0';
        inc_step <= '1';
        inc_score <= '0';
        res_step<= '0';
        res_score <= '0';
        led_on <= '0';
        all_on <= '0';
        start_timer <= '0';
        dec_duration <= '0'; 
        res_duration <= '0'; 
        res_timer <= '0';
        
        current_state <= wait_while_leds_on;

      when init_replay =>
        next_rnd <= '0';
        store_rnd <= '0';
        restore_rnd <= '1';
        inc_step <= '0';
        inc_score <= '0';
        res_step <= '1';
        res_score <= '0';
        led_on <= '0';
        all_on <= '0';
        start_timer <= '0';
        dec_duration <= '0'; 
        res_duration <= '0'; 
        res_timer <= '0';

        current_state <= wait_for_input;

      when wait_for_input =>
        next_rnd <= '0';
        store_rnd <= '0';
        restore_rnd <= '0';
        inc_step <= '0';
        inc_score <= '0';
        res_step<= '0';
        res_score <= '0';
        led_on <= '0';
        all_on <= '0';
        start_timer <= '0';
        dec_duration <= '0'; 
        res_duration <= '0'; 
        res_timer <= '0';

        if (key_valid = '1') and (key_color = rnd) then
          current_state <= correct_button_pressed;
        elsif (key_valid = '1') and (key_color /= rnd) then
          current_state <= game_lost;
        end if; 

      when correct_button_pressed =>
        next_rnd <= '0';
        store_rnd <= '0';
        restore_rnd <= '0';
        inc_step <= '0';
        inc_score <= '0';
        res_step<= '0';
        res_score <= '0';
        led_on <= '1';
        all_on <= '0';
        start_timer <= '1';
        dec_duration <= '0'; 
        res_duration <= '0'; 
        res_timer <= '0';
        
        if timer_expired = '1' then
          if step_eq_score = '1' then
            current_state <= round_won;
          else
            current_state <= next_replay;
          end if;
        end if;

      when next_replay =>
        next_rnd <= '1';
        store_rnd <= '0';
        restore_rnd <= '0';
        inc_step <= '1';
        inc_score <= '0';
        res_step<= '0';
        res_score <= '0';
        led_on <= '0';
        all_on <= '0';
        start_timer <= '0';
        dec_duration <= '0'; 
        res_duration <= '0'; 
        res_timer <= '0';
        
        current_state <= wait_for_input;

      when round_won =>
        next_rnd <= '0';
        store_rnd <= '0';
        restore_rnd <= '1';
        inc_step <= '0';
        inc_score <= '1';
        res_step <= '1';
        res_score <= '0';
        led_on <= '0';
        all_on <= '0';
        start_timer <= '0';
        dec_duration <= '1'; 
        res_duration <= '0'; 
        res_timer <= '0';

        current_state <= wait_while_leds_on;

      when game_lost =>
        next_rnd <= '0';
        store_rnd <= '0';
        restore_rnd <= '0';
        inc_step <= '0';
        inc_score <= '0';
        res_step <= '0';
        res_score <= '0';
        led_on <= '1';
        all_on <= '1';
        start_timer <= '1';
        dec_duration <= '0'; 
        res_duration <= '0'; 
        res_timer <= '0';
        
        if timer_expired = '1' then
          current_state <= initial;
        end if;
      end case;
    end if;
  end process;
end architecture behav;
