library ieee;
use ieee.std_logic_1164.all;

entity counter is
    generic(
        data_width : positive
    );
    port(
        clk        : in std_logic;
        en         : in std_logic;
        rst        : in std_logic;
        q          : out std_logic_vector(data_width-1 downto 0)
    );
end entity;

