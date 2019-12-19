library ieee;
use ieee.std_logic_1164.all;

entity user_defined is
    port(
        switch1 : in std_ulogic;
        switch2 : in std_ulogic;
        output  : out std_ulogic
    );
end entity;

architecture foo of user_defined is

begin

    output <= '0';

end architecture;
