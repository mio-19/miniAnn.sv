// generated by sv2v
module neuron_learn_layer24 (
	clock,
	valid,
	learn,
	in,
	out,
	weights,
	activation_upper_bound,
	activation_lower_bound,
	expected_out,
	expected_in
);
	parameter N = 16;
	input wire clock;
	input wire valid;
	input wire learn;
	input wire [(N * 16) - 1:0] in;
	output wire [383:0] out;
	output wire [((24 * N) * 17) - 1:0] weights;
	output wire [407:0] activation_upper_bound;
	output wire [407:0] activation_lower_bound;
	input wire [383:0] expected_out;
	output wire [(N * 16) - 1:0] expected_in;
	wire [((24 * N) * 16) - 1:0] unavg_expected_in;
	unit_arr_average #(
		.N(24),
		.LEN(N)
	) avg(
		.in(unavg_expected_in),
		.out(expected_in)
	);
	neuron_learn #(.N(N)) instance0(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[0+:16]),
		.weights(weights[0+:17 * N]),
		.activation_upper_bound(activation_upper_bound[0+:17]),
		.activation_lower_bound(activation_lower_bound[0+:17]),
		.expected_out(expected_out[0+:16]),
		.expected_in(unavg_expected_in[0+:16 * N])
	);
	neuron_learn #(.N(N)) instance1(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[16+:16]),
		.weights(weights[17 * N+:17 * N]),
		.activation_upper_bound(activation_upper_bound[17+:17]),
		.activation_lower_bound(activation_lower_bound[17+:17]),
		.expected_out(expected_out[16+:16]),
		.expected_in(unavg_expected_in[16 * N+:16 * N])
	);
	neuron_learn #(.N(N)) instance2(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[32+:16]),
		.weights(weights[17 * (2 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[34+:17]),
		.activation_lower_bound(activation_lower_bound[34+:17]),
		.expected_out(expected_out[32+:16]),
		.expected_in(unavg_expected_in[16 * (2 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance3(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[48+:16]),
		.weights(weights[17 * (3 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[51+:17]),
		.activation_lower_bound(activation_lower_bound[51+:17]),
		.expected_out(expected_out[48+:16]),
		.expected_in(unavg_expected_in[16 * (3 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance4(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[64+:16]),
		.weights(weights[17 * (4 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[68+:17]),
		.activation_lower_bound(activation_lower_bound[68+:17]),
		.expected_out(expected_out[64+:16]),
		.expected_in(unavg_expected_in[16 * (4 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance5(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[80+:16]),
		.weights(weights[17 * (5 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[85+:17]),
		.activation_lower_bound(activation_lower_bound[85+:17]),
		.expected_out(expected_out[80+:16]),
		.expected_in(unavg_expected_in[16 * (5 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance6(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[96+:16]),
		.weights(weights[17 * (6 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[102+:17]),
		.activation_lower_bound(activation_lower_bound[102+:17]),
		.expected_out(expected_out[96+:16]),
		.expected_in(unavg_expected_in[16 * (6 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance7(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[112+:16]),
		.weights(weights[17 * (7 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[119+:17]),
		.activation_lower_bound(activation_lower_bound[119+:17]),
		.expected_out(expected_out[112+:16]),
		.expected_in(unavg_expected_in[16 * (7 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance8(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[128+:16]),
		.weights(weights[17 * (8 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[136+:17]),
		.activation_lower_bound(activation_lower_bound[136+:17]),
		.expected_out(expected_out[128+:16]),
		.expected_in(unavg_expected_in[16 * (8 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance9(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[144+:16]),
		.weights(weights[17 * (9 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[153+:17]),
		.activation_lower_bound(activation_lower_bound[153+:17]),
		.expected_out(expected_out[144+:16]),
		.expected_in(unavg_expected_in[16 * (9 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance10(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[160+:16]),
		.weights(weights[17 * (10 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[170+:17]),
		.activation_lower_bound(activation_lower_bound[170+:17]),
		.expected_out(expected_out[160+:16]),
		.expected_in(unavg_expected_in[16 * (10 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance11(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[176+:16]),
		.weights(weights[17 * (11 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[187+:17]),
		.activation_lower_bound(activation_lower_bound[187+:17]),
		.expected_out(expected_out[176+:16]),
		.expected_in(unavg_expected_in[16 * (11 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance12(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[192+:16]),
		.weights(weights[17 * (12 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[204+:17]),
		.activation_lower_bound(activation_lower_bound[204+:17]),
		.expected_out(expected_out[192+:16]),
		.expected_in(unavg_expected_in[16 * (12 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance13(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[208+:16]),
		.weights(weights[17 * (13 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[221+:17]),
		.activation_lower_bound(activation_lower_bound[221+:17]),
		.expected_out(expected_out[208+:16]),
		.expected_in(unavg_expected_in[16 * (13 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance14(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[224+:16]),
		.weights(weights[17 * (14 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[238+:17]),
		.activation_lower_bound(activation_lower_bound[238+:17]),
		.expected_out(expected_out[224+:16]),
		.expected_in(unavg_expected_in[16 * (14 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance15(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[240+:16]),
		.weights(weights[17 * (15 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[255+:17]),
		.activation_lower_bound(activation_lower_bound[255+:17]),
		.expected_out(expected_out[240+:16]),
		.expected_in(unavg_expected_in[16 * (15 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance16(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[256+:16]),
		.weights(weights[17 * (16 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[272+:17]),
		.activation_lower_bound(activation_lower_bound[272+:17]),
		.expected_out(expected_out[256+:16]),
		.expected_in(unavg_expected_in[16 * (16 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance17(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[272+:16]),
		.weights(weights[17 * (17 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[289+:17]),
		.activation_lower_bound(activation_lower_bound[289+:17]),
		.expected_out(expected_out[272+:16]),
		.expected_in(unavg_expected_in[16 * (17 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance18(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[288+:16]),
		.weights(weights[17 * (18 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[306+:17]),
		.activation_lower_bound(activation_lower_bound[306+:17]),
		.expected_out(expected_out[288+:16]),
		.expected_in(unavg_expected_in[16 * (18 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance19(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[304+:16]),
		.weights(weights[17 * (19 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[323+:17]),
		.activation_lower_bound(activation_lower_bound[323+:17]),
		.expected_out(expected_out[304+:16]),
		.expected_in(unavg_expected_in[16 * (19 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance20(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[320+:16]),
		.weights(weights[17 * (20 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[340+:17]),
		.activation_lower_bound(activation_lower_bound[340+:17]),
		.expected_out(expected_out[320+:16]),
		.expected_in(unavg_expected_in[16 * (20 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance21(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[336+:16]),
		.weights(weights[17 * (21 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[357+:17]),
		.activation_lower_bound(activation_lower_bound[357+:17]),
		.expected_out(expected_out[336+:16]),
		.expected_in(unavg_expected_in[16 * (21 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance22(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[352+:16]),
		.weights(weights[17 * (22 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[374+:17]),
		.activation_lower_bound(activation_lower_bound[374+:17]),
		.expected_out(expected_out[352+:16]),
		.expected_in(unavg_expected_in[16 * (22 * N)+:16 * N])
	);
	neuron_learn #(.N(N)) instance23(
		.clock(clock),
		.valid(valid),
		.learn(learn),
		.in(in),
		.out(out[368+:16]),
		.weights(weights[17 * (23 * N)+:17 * N]),
		.activation_upper_bound(activation_upper_bound[391+:17]),
		.activation_lower_bound(activation_lower_bound[391+:17]),
		.expected_out(expected_out[368+:16]),
		.expected_in(unavg_expected_in[16 * (23 * N)+:16 * N])
	);
endmodule