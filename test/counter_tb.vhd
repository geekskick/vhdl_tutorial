library ieee;
use ieee.std_logic_1164.all;

entity counter_tb is
end entity;

architecture beh of counter_tb is

    constant data_width : positive := 4;
    constant max        : positive := 10;
    constant period     : time := 100 ns;
    signal clk          : std_ulogic := '1';
    signal en           : std_ulogic := '0';
    signal rst          : std_ulogic := '0';
    signal done         : boolean := false;
    signal q            : std_ulogic_vector(data_width-1 downto 0) := (others => '0');

begin
    uut: entity work.counter 
    generic map(
        data_width => data_width,
        max        => max
    )
    port map(
        clk        => clk,
        en         => en,
        rst        => rst,
        q          => q
    );

    tick: process
    begin
        while not done loop
            wait for period/2;
            clk <= not clk;
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
