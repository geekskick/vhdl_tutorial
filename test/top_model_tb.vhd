library ieee;
use ieee.std_logic_1164.all;

entity top_model_tb is
end entity;

architecture beh of top_model_tb is

    constant num_lights : positive := 1;
    constant period     : time := 100 ns;
    signal clk          : std_ulogic := '0';
    signal en           : std_ulogic := '0';
    signal rst          : std_ulogic := '0';
    signal lights       : std_ulogic_vector(num_lights-1 downto 0) := (others => '0');
    signal done         : boolean := false;

begin
    uut: entity work.top_model 
    generic map(
        num_lights => num_lights
    )
    port map(
        clk        => clk,
        en         => en,
        rst        => rst,
        lights     => lights
    );

    tick: process
    begin
        while not done loop
            clk <= '0';
            wait for period/2;
            clk <= '1';
            wait for period/2;
        end loop;
        wait;
    end process;

    stim:process
    begin
        rst <= '0';
        en <= '1';
        wait for period * 20;
        done <= true;
        wait;
    end process;

end architecture;
