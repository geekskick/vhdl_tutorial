library ieee;
use ieee.std_logic_1164.all;
use work.tutorial_package.all;

architecture structural of top_model is

    constant counter_width : positive := 4;
    type counter_array is array (0 to num_lights-1) of std_logic_vector(counter_width-1 downto 0);
    signal cout : counter_array := (others => (others =>'0'));

begin
    counters: for i in 0 to num_lights-1 generate
        cx : counter generic map(
            data_width => counter_width
        )
        port map(
            clk        => clk,
            en         => en,
            rst        => rst,
            q          => cout(i)
        );
    end generate;

    lights(0) <= cout(0)(0);
end architecture;


