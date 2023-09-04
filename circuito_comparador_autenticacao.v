module circuito_comparador_autenticacao(A,B,C,D,E,F,AUT);

	input A, B, C, D, E, F;
	output [2:0] AUT;
	wire [5:0] N_inputs, inputs;
	
	wire NA, NB, NC, ND, NE, NF;
	wire combinacao_entrada_1,combinacao_entrada_2, combinacao_entrada_3, combinacao_entrada_4;
	wire combinacao_entrada_5,combinacao_entrada_6, combinacao_entrada_7, combinacao_entrada_8, combinacao_entrada_9;
	wire input_0, input_1, input_2, input_3, input_4,input_5, input_6, input_7, input_8;
	wire input_9, input_10, input_11, input_12, input_13,input_14, input_15, input_16, input_17,input_18;
	wire input_19 , input_20, input_21, input_22, input_23,input_24, input_25;
	
	wire or_0, or_1, or_2, or_3, or_4, or_5, or_6;
	
	not(NA,A);
	not(NB,B);
	not(NC,C);
	not(ND,D);
	not(NE,E);
	not(NF,F);
	
	assign N_inputs = {NA,NB,NC,ND,NE,NF};
	assign inputs = {A, B, C, D, E, F};
	
	//AUT1
	
	and_gate_3_inputs NA_and_B_and_C(.A(N_inputs[5]), .B(inputs[4]),.C(inputs[3]),.S(input_0),);
	and_gate_4_inputs A_and_NB_and_C_and_ND (.A(inputs[5]),.B(N_inputs[4]),.C(inputs[3]),.D(N_inputs[2]),.S(input_1),);
	and_gate_2_inputs NA_and_C(.A(N_inputs[5]),.B(inputs[3]),.S(input_2),);
	and_gate_2_inputs NB_and_C(.A(N_inputs[4]),.B(inputs[3]),.S(input_3),);
	
	and_gate_2_inputs ND_and_NE(.A(N_inputs[2]),.B(N_inputs[1]),.S(input_4),);
	and_gate_2_inputs ND_and_NF(.A(N_inputs[2]),.B(N_inputs[0]),.S(input_5),);
	and_gate_2_inputs NE_and_NF(.A(N_inputs[1]),.B(N_inputs[0]),.S(input_6),); 
	and_gate_3_inputs D_and_E_and_F(.A(inputs[2]),.B(inputs[1]),.C(inputs[0]),.S(input_7),);
	and_gate_2_inputs D_and_E(.A(inputs[2]),.B(inputs[1]),.S(input_8),);
	
	and_gate_2_inputs NA_and_B_and_C_and_ND_and_NE(
	
		.A(input_0),
		.B(input_4),
		.S(combinacao_entrada_1),
	
	);
	
	//input 1 = A_and_NB_and_C_and_ND
	
	//input 5 = ND_and_NF
	
	//input 6 = NE_and_NF
	
	//input 7 = D_and_E_and_F
	
	and_gate_2_inputs NA_and_C_and_D_and_E(
	
		.A(input_2),
		.B(input_8),
		.S(combinacao_entrada_2),
	
	);
	
	and_gate_2_inputs NB_and_C_and_D_and_E(
	
		.A(input_3),
		.B(input_8),
		.S(combinacao_entrada_3),
	
	);
	
	or(or_0,combinacao_entrada_1,input_1,input_5, input_6);
	or(or_1, input_7, combinacao_entrada_2, combinacao_entrada_3);
	
	or(AUT[2], or_0, or_1);
	
	
	//AUT2
	
	and_gate_3_inputs NA_and_NB_and_C(.A(N_inputs[5]), .B(N_inputs[4]),.C(inputs[3]),.S(input_9),);
	and_gate_3_inputs A_and_NB_and_C(.A(inputs[5]),.B(N_inputs[4]),.C(inputs[3]),.S(input_11),);
	and_gate_3_inputs A_and_B_and_NC(.A(inputs[5]),.B(inputs[4]),.C(N_inputs[3]),.S(input_12),);
	
	and_gate_3_inputs ND_and_NE_and_F(.A(N_inputs[2]),.B(N_inputs[1]),.C(inputs[0]),.S(input_13),);
	and_gate_3_inputs ND_and_E_and_F_(.A(N_inputs[2]),.B(inputs[1]),.C(inputs[0]),.S(input_14),);
	and_gate_3_inputs D_and_NE_and_F(.A(inputs[2]),.B(N_inputs[1]),.C(inputs[0]),.S(input_15),);
	and_gate_3_inputs D_and_E_and_NF(.A(inputs[2]),.B(inputs[1]),.C(N_inputs[0]),.S(input_16),); 
	
	and_gate_2_inputs NA_and_NB_and_C_and_ND_and_NE_and_F(
	
		.A(input_9),
		.B(input_13),
		.S(combinacao_entrada_4),
	
	);
	
	and_gate_2_inputs NA_and_B_and_C_and_ND_and_E_and_F(

		.A(input_0),
		.B(input_14),
		.S(combinacao_entrada_5),
	
	);
	
	and_gate_2_inputs A_and_NB_and_C_and_D_and_NE_and_F(
	
		.A(input_11),
		.B(input_15),
		.S(combinacao_entrada_6),
	
	);
	
	and_gate_2_inputs A_and_B_and_NC_and_D_and_E_and_NF(
	
		.A(input_12),
		.B(input_16),
		.S(combinacao_entrada_7),
	
	);
	
	or(or_2,combinacao_entrada_4,combinacao_entrada_5);
	or(or_3,combinacao_entrada_6,combinacao_entrada_7);
	
	or(AUT[1],or_2,or_3);
	
	//AUT 3
	
	and_gate_2_inputs NA_and_NB(.A(N_inputs[5]), .B(N_inputs[4]),.S(input_17),);
	and_gate_4_inputs NA_and_D_and_NE_and_F(.A(N_inputs[5]),.B(inputs[2]),.C(N_inputs[1]),.D(inputs[0]),.S(input_18),);
	and_gate_2_inputs NA_and_NC(.A(N_inputs[5]), .B(N_inputs[3]),.S(input_19),);
	and_gate_2_inputs NB_and_NC(.A(N_inputs[4]), .B(N_inputs[3]),.S(input_20),);
	and_gate_3_inputs A_and_B_and_C(.A(inputs[5]),.B(inputs[4]),.C(inputs[3]),.S(input_21),);
	and_gate_2_inputs A_and_B(.A(inputs[5]), .B(inputs[4]),.S(input_22),);
	
	and_gate_3_inputs ND_and_E_and_F(.A(N_inputs[2]),.B(inputs[1]),.C(inputs[0]),.S(input_23),);
	and_gate_4_inputs B_and_D_and_NE_and_F(.A(inputs[4]), .B(inputs[2]), .C(N_inputs[1]), .D(inputs[0]),.S(input_24),);
	and_gate_2_inputs ND_and_F(.A(N_inputs[2]), .B(inputs[0]),.S(input_25),);
	
	
	and_gate_2_inputs NA_and_NB_and_ND_and_E_and_F(
	
		.A(input_17),
		.B(input_23),
		.S(combinacao_entrada_8),
		
	
	);
	
	// input 18
	
	// input 19 
	
	// input 20
	
	// input 21
	
	and_gate_2_inputs A_and_B_and_ND_and_F (
	
		.A(input_22),
		.B(input_25),
		.S(combinacao_entrada_9),

	);
	
	//input 24
	
	or(or_4,combinacao_entrada_8,input_18);
	or(or_5,input_19,input_20);
	or(or_6,input_21,combinacao_entrada_9, input_24);
	
	or(AUT[0], or_4,or_5,or_6);
	
endmodule 