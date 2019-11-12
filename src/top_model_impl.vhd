library ieee;
use ieee.std_logic_1164.all;
use work.tutorial_package.all;

architecture structural of top_model is

    constant counter_width : positive := 4;

    signal c1_out : std_logic_vector(counter_width-1 downto 0) := (others => '0');
begin
    c1: counter generic map( 
        data_width => counter_width
    )
    port map(
        clk        => clk,
        en         => en,
        rst        => rst,
        q          => c1_out
    );

    lights(0) <= c1_out(0);
end architecture;


