library ieee;
use ieee.std_logic_1164.all;


entity top_model is
    generic(
        num_lights : positive
    );
    port(
        clk        : in std_logic;
        en         : in std_logic;
        rst        : in std_logic;
        lights     : out std_logic_vector(num_lights-1 downto 0)
    );
end entity;

