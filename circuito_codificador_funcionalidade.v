module circuito_codificador_funcionalidade(A,B,C,D,E,F,G,CF);

	input A,B,C,D,E,F,G;
	output [2:0] CF;
	
	wire NA, NB, NC, ND, NE, NF, NG;
	wire [6:0] N_inputs, inputs;
	wire combinacao_entrada_1,combinacao_entrada_2, combinacao_entrada_3, combinacao_entrada_4;
	wire combinacao_entrada_5,combinacao_entrada_6, combinacao_entrada_7;
	wire input_0, input_1, input_2, input_3, input_4,input_5, input_6, input_7, input_8;
	
	not(NA,A);
	not(NB,B);
	not(NC,C);
	not(ND,D);
	not(NE,E);
	not(NF,F);
	not(NG,G);
	
	assign N_inputs = {NA,NB,NC,ND,NE,NF,NG};
	assign inputs = {A, B, C, D, E, F, G};
	
	and_gate_3_inputs NA_and_NB_and_NC(.A(N_inputs[6]), .B(N_inputs[5]),.C(N_inputs[4]),.S(input_0),);
	and_gate_3_inputs NA_and_NB_and_C(.A(N_inputs[6]),.B(N_inputs[5]),.C(inputs[4]),.S(input_1),);
	and_gate_3_inputs NA_and_B_and_NC(.A(N_inputs[6]),.B(inputs[5]),.C(N_inputs[4]),.S(input_2),);
	and_gate_3_inputs A_and_NB_and_NC(.A(inputs[6]),.B(N_inputs[5]),.C(N_inputs[4]),.S(input_3),);
	
	and_gate_4_inputs ND_and_NE_and_NF_and_G(.A(N_inputs[3]),.B(N_inputs[2]),.C(N_inputs[1]),.D(inputs[0]),.S(input_4),);
	and_gate_4_inputs ND_and_NE_and_F_and_NG(.A(N_inputs[3]),.B(N_inputs[2]),.C(inputs[1]),.D(N_inputs[0]),.S(input_5),);
	and_gate_4_inputs ND_and_E_and_NF_and_NG(.A(N_inputs[3]),.B(inputs[2]),.C(N_inputs[1]),.D(N_inputs[0]),.S(input_6),);
	and_gate_4_inputs D_and_NE_and_NF_and_NG(.A(inputs[3]),.B(N_inputs[2]),.C(N_inputs[1]),.D(N_inputs[0]),.S(input_7),); 
	and_gate_4_inputs ND_and_NE_and_NF_and_NG(.A(N_inputs[3]),.B(N_inputs[2]),.C(N_inputs[1]),.D(N_inputs[0]),.S(input_8),);
	
	//F1
	
	and_gate_2_inputs NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G(
	
		.A(input_0),
		.B(input_4),
		.S(combinacao_entrada_1),
		
	);
	
	and_gate_2_inputs NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG(
	
		.A(input_0),
		.B(input_5),
		.S(combinacao_entrada_2),
	
	);
	
	and_gate_2_inputs NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG(
	
		.A(input_0),
		.B(input_6),
		.S(combinacao_entrada_3),
	
	);
	
	and_gate_2_inputs NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG(
	
		.A(input_0),
		.B(input_7),
		.S(combinacao_entrada_4),
	
	);
	
	or_gate_4_inputs or_0(
	
		.A(combinacao_entrada_1),
		.B(combinacao_entrada_2),
		.C(combinacao_entrada_3),
		.D(combinacao_entrada_4),
		.S(CF[2]),
	
	);
	
	//F2
	
	and_gate_2_inputs NA_and_NB_and_C_and_ND_and_NE_and_NF_and_NG(
	
		.A(input_1),
		.B(input_8),
		.S(combinacao_entrada_5),
	
	);
	
	and_gate_2_inputs NA_and_B_and_NC_and_ND_and_NE_and_NF_and_NG(
	
		.A(input_2),
		.B(input_8),
		.S(combinacao_entrada_6),
	
	);
	
	or_gate_4_inputs or_1(
	
		.A(combinacao_entrada_1),
		.B(combinacao_entrada_2),
		.C(combinacao_entrada_5),
		.D(combinacao_entrada_6),
		.S(CF[1]),
	
	);
	
	//F3
	
	and_gate_2_inputs A_and_NB_and_NC_and_ND_and_NE_and_NF_and_NG(
	
	
		.A(input_3),
		.B(input_8),
		.S(combinacao_entrada_7),
	
	);
	
	or_gate_4_inputs or_2(
	
		.A(combinacao_entrada_1),
		.B(combinacao_entrada_3),
		.C(combinacao_entrada_5),
		.D(combinacao_entrada_7),
		.S(CF[0]),
	
	); 

endmodule 

module and_gate_3_inputs(A,B,C,S);

	input A,B,C;
	output S;

	and(S,A,B,C);

endmodule 

module and_gate_4_inputs(A,B,C,D,S);

	input A,B,C,D;
	output S;

	and(S,A,B,C,D);

endmodule 

module or_gate_4_inputs(A,B,C,D,S);

	input A,B,C,D;
	output S;
	
	or(S,A,B,C,D);


endmodule

module and_gate_2_inputs(A,B,S);

	input A,B;
	output S;
	
	and(S,A,B);


endmodule 