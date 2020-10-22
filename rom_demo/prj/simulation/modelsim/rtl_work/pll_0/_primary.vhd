library verilog;
use verilog.vl_types.all;
entity pll_0 is
    port(
        areset          : in     vl_logic;
        inclk0          : in     vl_logic;
        inclk1          : in     vl_logic;
        activeclock     : out    vl_logic;
        c0              : out    vl_logic;
        c1              : out    vl_logic;
        c2              : out    vl_logic;
        locked          : out    vl_logic
    );
end pll_0;
