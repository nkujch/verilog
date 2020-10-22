library verilog;
use verilog.vl_types.all;
entity uart_tx_top is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        send_en         : in     vl_logic;
        baud_set        : in     vl_logic_vector(2 downto 0);
        data_byte       : in     vl_logic_vector(7 downto 0);
        tx              : out    vl_logic;
        send_done       : out    vl_logic;
        uart_state      : out    vl_logic
    );
end uart_tx_top;
