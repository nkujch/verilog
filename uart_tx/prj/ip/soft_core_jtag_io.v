// megafunction wizard: %Altera Soft Core JTAG IO v13.1%
// GENERATION: XML
// soft_core_jtag_io.v

// Generated using ACDS version 13.1 162 at 2020.10.13.17:34:53

`timescale 1 ps / 1 ps
module soft_core_jtag_io #(
		parameter ENABLE_JTAG_IO_SELECTION = 1
	) (
		input  wire  tms,         //        jtag.tms
		input  wire  tdi,         //            .tdi
		output wire  tdo,         //            .tdo
		input  wire  tck,         //         tck.clk
		input  wire  select_this  // select_this.select_this
	);

	altera_soft_core_jtag_io #(
		.ENABLE_JTAG_IO_SELECTION (ENABLE_JTAG_IO_SELECTION)
	) soft_core_jtag_io_inst (
		.tms         (tms),         //        jtag.tms
		.tdi         (tdi),         //            .tdi
		.tdo         (tdo),         //            .tdo
		.tck         (tck),         //         tck.clk
		.select_this (select_this)  // select_this.select_this
	);

endmodule
// Retrieval info: <?xml version="1.0"?>
//<!--
//	Generated by Altera MegaWizard Launcher Utility version 1.0
//	************************************************************
//	THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//	************************************************************
//	Copyright (C) 1991-2020 Altera Corporation
//	Any megafunction design, and related net list (encrypted or decrypted),
//	support information, device programming or simulation file, and any other
//	associated documentation or information provided by Altera or a partner
//	under Altera's Megafunction Partnership Program may be used only to
//	program PLD devices (but not masked PLD devices) from Altera.  Any other
//	use of such megafunction design, net list, support information, device
//	programming or simulation file, or any other related documentation or
//	information is prohibited for any other purpose, including, but not
//	limited to modification, reverse engineering, de-compiling, or use with
//	any other silicon devices, unless such use is explicitly licensed under
//	a separate agreement with Altera or a megafunction partner.  Title to
//	the intellectual property, including patents, copyrights, trademarks,
//	trade secrets, or maskworks, embodied in any such megafunction design,
//	net list, support information, device programming or simulation file, or
//	any other related documentation or information provided by Altera or a
//	megafunction partner, remains with Altera, the megafunction partner, or
//	their respective licensors.  No other licenses, including any licenses
//	needed under any third party's intellectual property, are provided herein.
//-->
// Retrieval info: <instance entity-name="altera_soft_core_jtag_io" version="13.1" >
// Retrieval info: 	<generic name="ENABLE_JTAG_IO_SELECTION" value="1" />
// Retrieval info: </instance>
// IPFS_FILES : soft_core_jtag_io.vo
// RELATED_FILES: soft_core_jtag_io.v
