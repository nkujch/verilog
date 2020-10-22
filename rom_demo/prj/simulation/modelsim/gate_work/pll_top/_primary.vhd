library verilog;
use verilog.vl_types.all;
entity pll_top is
    port(
        iws_reset_n     : in     vl_logic;
        iws_clk_50M     : in     vl_logic;
        ows_clk0        : out    vl_logic;
        ows_clk1        : out    vl_logic;
        ows_clk2        : out    vl_logic;
        ows_locked      : out    vl_logic
    );
end pll_top;
