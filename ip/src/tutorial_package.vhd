library ieee;
use ieee.std_logic_1164.all;

package tutorial_package is

    -- Not strictly needed for it to work, but it's good practice when sharing code
    component top_model is
        generic(
            num_lights : positive
        );
        port(
            clk        : in std_ulogic;
            en         : in std_ulogic;
            rst        : in std_ulogic;
            lights     : out std_ulogic_vector(num_lights-1 downto 0)
        );
    end component;
    component counter is
        generic(
            data_width : positive;
            max        : positive
        );
        port(
            clk        : in std_ulogic;
            en         : in std_ulogic;
            rst        : in std_ulogic;
            q          : out std_ulogic_vector(data_width-1 downto 0)
        );
    end component;

    component user_defined is
        port(
            switch1 : in std_ulogic;
            switch2 : in std_ulogic;
            output  : out std_ulogic
        );
     end component;

end package;
