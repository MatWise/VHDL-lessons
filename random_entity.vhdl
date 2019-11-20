library ieee; use ieee.std_logic_1164.all;

entity random is
  port(
    clk, res_n: in std_logic;

    -- If set and 'restore_rnd' is not set, a new random number 
    -- will be generated upon the start of the next clock cycle.
    -- Note that this number is based on the previous one.
    next_rnd: in std_logic;
    
    -- Stores the current random number in a separate register
    -- if set.
    store_rnd: in std_logic;

    -- Restores the previously saved random number.
    restore_rnd: in std_logic;
    
    -- First and second bit of the current random number.
    rnd: out std_logic_vector(1 downto 0));
end entity random;
