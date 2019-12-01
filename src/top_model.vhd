library ieee;
use ieee.std_logic_1164.all;
use work.tutorial_package.all;

entity top_model is
    generic(
        num_lights : positive
    );
    port(
        clk        : in std_ulogic;
        en         : in std_ulogic;
        rst        : in std_ulogic;
        lights     : out std_ulogic_vector(num_lights-1 downto 0)
    );
end entity;

-- Structural architecture means we cna expect this to just be connecting modules in a heirarchy
architecture structural of top_model is

    constant counter_width : positive := 4;
    type counter_array is array (0 to num_lights-1) of std_ulogic_vector(counter_width-1 downto 0);
    signal cout : counter_array := (others => (others =>'0'));

begin
    -- Generate is like a for loop, but it means I can instantiate separate counters in a range 
    counters: for i in 0 to num_lights-1 generate
        cx : counter generic map(
            data_width => counter_width,
            max => 10
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


