library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
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
end entity;

architecture beh of counter is

    type private_register_t is record
        count: natural range 0 to max + 1;
    end record;

    signal reg_in : private_register_t := (count => 0);
    signal reg_out: private_register_t := (count => 0);

begin

    process(reg_out)
        variable v : private_register_t := (count => 0);
    begin
        v := reg_out;

        if v.count + 1 > max then
            v.count := 0;
        else
            v.count := v.count + 1;
        end if;

        reg_in <= v;

    end process;

    process(clk, rst, en)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                reg_out <= (count => 0);
            elsif en = '1' then
                reg_out <= reg_in;
            end if;
        end if;
    end process;

    q <= std_ulogic_vector(to_unsigned(reg_out.count, q'length));

end architecture;
