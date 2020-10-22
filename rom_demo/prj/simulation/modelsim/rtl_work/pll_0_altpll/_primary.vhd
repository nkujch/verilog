library verilog;
use verilog.vl_types.all;
entity pll_0_altpll is
    port(
        activeclock     : out    vl_logic;
        areset          : in     vl_logic;
        clk             : out    vl_logic_vector(4 downto 0);
        inclk           : in     vl_logic_vector(1 downto 0);
        locked          : out    vl_logic
    );
end pll_0_altpll;
