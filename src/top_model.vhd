library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tutorial_package.all;

entity top_model is
    generic(
        num_lights : positive;
        threshold  : positive
    );
    port(
        clk        : in std_ulogic;
        en         : in std_ulogic;
        rst        : in std_ulogic;
        switch1    : in std_ulogic;
        switch2    : in std_ulogic;
        lights     : out std_ulogic_vector(num_lights-1 downto 0)
    );
end entity;

architecture structural of top_model is

    constant counter_width  : integer := 27;
    constant counter_max    : integer := 100000000;
    
    signal counter_output   : std_ulogic_vector(counter_width - 1 downto 0) := (others => '0');

    signal ud_out           : std_ulogic := '0';
    signal threshold_output : std_ulogic := '0';
    signal pwm_light        : std_ulogic := '0';
       
begin
    c: counter generic map(
        data_width => counter_width,
        max        => counter_max
    )
    port map(
        clk        => clk,
        en         => en,
        rst        => rst,
        q          => counter_output
    );

    stub1: user_defined port map(
        switch1 => switch1,
        switch2 => switch2,
        output  => ud_out
    );
    
    pwm_light_process: process(counter_output)
        variable counter_output_as_integer: integer range 0 to counter_max + 1 := 0;
    begin
    
        counter_output_as_integer := to_integer(unsigned(counter_output)) + 1;
        pwm_light <= '1';
        if counter_output_as_integer > threshold then
            pwm_light <= '0';
        end if;
    end process;
    
    
    lights(0) <= counter_output(0);                 -- Should look on all the time
    lights(1) <= pwm_light;                         -- Should look on for hald a second
    lights(2) <= switch1 and pwm_light;              
    lights(3) <= not switch1;
    
    -- Just a 4 bit counter basically
    lights(4) <= counter_output(23);
    lights(5) <= counter_output(24);
    lights(6) <= counter_output(25);
    lights(7) <= counter_output(26);
    
end architecture;


