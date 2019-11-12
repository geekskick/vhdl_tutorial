library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tutorial_package.all;

architecture beh of counter is
    type private_register_t is record
        count: integer range 0 to q'high;
    end record;

    signal reg_in : private_register_t := (count => 0);
    signal reg_out: private_register_t := (count => 0);
begin

    process(reg_out, clk, rst, en)
        variable v : private_register_t := (count => 0);
    begin
        v := reg_out;

        if v.count + 1 > q'high then
            v.count := 0;
        else
            v.count := v.count + 1;
        end if;
        reg_in <= v;
        q <= std_logic_vector(to_unsigned(reg_out.count, q'length));

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

end architecture;
