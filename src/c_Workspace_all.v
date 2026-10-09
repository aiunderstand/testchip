module c_Workspace (
	input input_0,
	input input_1,
	output output_0
);
	wire [1:0] tnet_0;
	wire [1:0] tnet_1;
	wire bnet_0;

	f_ZZV f_ZZV_0 (
		.B({input_0,!input_0}),
		.A({input_1,!input_1}),
		.Q(tnet_0)
	);

	f_ZRP f_ZRP_0 (
		.B({input_0,!input_0}),
		.A({input_1,!input_1}),
		.Q(tnet_1)
	);

	f_TPP_bin f_TPP_bin_0 (
		.B(input_0),
		.A(input_1),
		.Q(bnet_0)
	);

	assign output_0 = tnet_0[1];
endmodule

module f_ZZV (
	input wire [1:0] B,
	input wire [1:0] A,
	output wire [1:0] Q
);
	assign Q = 
		(B == 2'b01) & (A == 2'b01) ? 2'b01 :
		(B == 2'b11) & (A == 2'b01) ? 2'b10 :
		(B == 2'b10) & (A == 2'b01) ? 2'b10 :
		(B == 2'b01) & (A == 2'b11) ? 2'b10 :
		(B == 2'b11) & (A == 2'b11) ? 2'b10 :
		(B == 2'b10) & (A == 2'b11) ? 2'b10 :
		(B == 2'b01) & (A == 2'b10) ? 2'b10 :
		(B == 2'b11) & (A == 2'b10) ? 2'b10 :
		(B == 2'b10) & (A == 2'b10) ? 2'b10 :
		2'b11;
endmodule

module f_ZRP (
	input wire [1:0] B,
	input wire [1:0] A,
	output wire [1:0] Q
);
	assign Q = 
		(B == 2'b01) & (A == 2'b01) ? 2'b01 :
		(B == 2'b10) & (A == 2'b01) ? 2'b10 :
		(B == 2'b10) & (A == 2'b11) ? 2'b10 :
		(B == 2'b01) & (A == 2'b10) ? 2'b10 :
		(B == 2'b11) & (A == 2'b10) ? 2'b10 :
		(B == 2'b10) & (A == 2'b10) ? 2'b10 :
		2'b11;
endmodule

module f_TPP_bin (
	input wire B,
	input wire A,
	output wire Q
);
	assign Q = 
		(B == 1'b1) & (A == 1'b0) ? 1'b1 :
		(B == 1'b0) & (A == 1'b1) ? 1'b1 :
		(B == 1'b1) & (A == 1'b1) ? 1'b1 :
		1'b0;
endmodule