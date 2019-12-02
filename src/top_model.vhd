library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tutorial_package.all;

entity top_model is
    generic(
        num_lights : positive
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
    constant counter_max    : integer := 1000000;
    constant num_thresholds : integer := num_lights - 1;
    
    type threshold_array is array(num_thresholds - 1 downto 0) of integer range 1 to counter_max + 1;
    constant thresholds     : threshold_array := (1, 660000, 1000000);

    signal counter_output   : std_ulogic_vector(counter_width - 1 downto 0) := (others => '0');
    signal threshold_met    : std_ulogic_vector(num_thresholds - 1 downto 0) := (others => '0');

    signal counter_output_as_integer : integer range 1 to counter_max + 1 := 1;
       
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

    process(counter_output)
    begin
        counter_output_as_integer <= to_integer(unsigned(counter_output)) + 1;

        threshold_met(0) <= not threshold_met(0) when counter_output_as_integer mod thresholds(0) = 0 else threshold_met(0);
        threshold_met(1) <= not threshold_met(1) when counter_output_as_integer mod thresholds(1) = 0 else threshold_met(1);
        threshold_met(2) <= not threshold_met(2) when counter_output_as_integer mod thresholds(2) = 0 else threshold_met(2);

    end process;

    lights <= threshold_met;
end architecture;


