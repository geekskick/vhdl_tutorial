library ieee;
use ieee.std_logic_1164.all;

package tutorial_package is

    component top_model is
        generic(
            num_lights : positive
        );
        port(
            clk        : in std_logic;
            en         : in std_logic;
            rst        : in std_logic;
            lights     : out std_logic_vector(num_lights-1 downto 0)
        );
    end component;
    component counter is
        generic(
            data_width : positive
        );
        port(
            clk        : in std_logic;
            en         : in std_logic;
            rst        : in std_logic;
            q          : out std_logic_vector(data_width-1 downto 0)
        );
    end component;
end package;
