
module pll_top(
    input iws_reset_n,
    input iws_clk_50M,
    
    output ows_clk0,
    output ows_clk1,
    output ows_clk2,
    output ows_locked);


    pll_0 u0_pll_0(
	.areset(iws_reset_n),
	.inclk0(iws_clk_50M),
	.c0(ows_clk0),
	.c1(ows_clk1),
	.c2(ows_clk2),
	.locked(ows_locked));
    
    
endmodule