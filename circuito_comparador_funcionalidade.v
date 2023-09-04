module circuito_comparador_funcionalidade(A,B,C,D,E,F,FI);	

	input A,B,C,D,E,F;
	output FI;
	
	wire [5:0] N_inputs, inputs;
	wire NA, NB, NC, ND, NE, NF;
	wire combinacao_entrada_1,combinacao_entrada_2, combinacao_entrada_3, combinacao_entrada_4;
	wire combinacao_entrada_5,combinacao_entrada_6, combinacao_entrada_7,combinacao_entrada_8;
	wire input_0, input_1, input_2, input_3, input_4,input_5, input_6, input_7, input_8;
	wire input_9, input_10, input_11, input_12, input_13,input_14, input_15;
	wire or_0, or_1;
	
	not(NA,A);
	not(NB,B);
	not(NC,C);
	not(ND,D);	
	not(NE,E);
	not(NF,F);
	
	assign N_inputs = {NA,NB,NC,ND,NE,NF};
	assign inputs = {A, B, C, D, E, F};
	
	and_gate_3_inputs NA_and_NB_and_NC(.A(N_inputs[5]), .B(N_inputs[4]),.C(N_inputs[3]),.S(input_0),);
	and_gate_3_inputs NA_and_NB_and_C(.A(N_inputs[5]),.B(N_inputs[4]),.C(inputs[3]),.S(input_1),);
	and_gate_3_inputs NA_and_B_and_NC(.A(N_inputs[5]),.B(inputs[4]),.C(N_inputs[3]),.S(input_2),);
	and_gate_3_inputs NA_and_B_and_C(.A(N_inputs[5]),.B(inputs[4]),.C(inputs[3]),.S(input_3),);
	
	and_gate_3_inputs A_and_NB_and_NC(.A(inputs[5]),.B(N_inputs[4]),.C(N_inputs[3]),.S(input_4),);
	and_gate_3_inputs A_and_NB_and_C(.A(inputs[5]),.B(N_inputs[4]),.C(inputs[3]),.S(input_5),);
	and_gate_3_inputs A_and_B_and_NC(.A(inputs[5]),.B(inputs[4]),.C(N_inputs[3]),.S(input_6),);
	and_gate_3_inputs A_and_B_and_C(.A(inputs[5]),.B(inputs[4]),.C(inputs[3]),.S(input_7),);
	
	and_gate_3_inputs ND_and_NF_and_NE(.A(N_inputs[2]),.B(N_inputs[1]),.C(N_inputs[0]),.S(input_8),); 
	and_gate_3_inputs ND_and_NF_and_E(.A(N_inputs[2]),.B(N_inputs[1]),.C(inputs[0]),.S(input_9),); 
	and_gate_3_inputs ND_and_F_and_NE(.A(N_inputs[2]),.B(inputs[1]),.C(N_inputs[0]),.S(input_10),); 
	and_gate_3_inputs ND_and_F_and_E(.A(N_inputs[2]),.B(inputs[1]),.C(inputs[0]),.S(input_11),); 
	
	and_gate_3_inputs D_and_NF_and_NE(.A(inputs[2]),.B(N_inputs[1]),.C(N_inputs[0]),.S(input_12),); 
	and_gate_3_inputs D_and_NF_and_E(.A(inputs[2]),.B(N_inputs[1]),.C(inputs[0]),.S(input_13),); 
	and_gate_3_inputs D_and_F_and_NE(.A(inputs[2]),.B(inputs[1]),.C(N_inputs[0]),.S(input_14),); 
	and_gate_3_inputs D_and_F_and_E(.A(inputs[2]),.B(inputs[1]),.C(inputs[0]),.S(input_15),); 
	
	and_gate_2_inputs NA_and_NB_and_NC_and_ND_and_NF_and_NE(
	
		.A(input_0),
		.B(input_8),
		.S(combinacao_entrada_1),
	
	);
	
	and_gate_2_inputs NA_and_NB_and_C_and_ND_and_NF_and_E(
	
		.A(input_1),
		.B(input_9),
		.S(combinacao_entrada_2),
	
	);
	
	and_gate_2_inputs NA_and_B_and_NC_and_ND_and_F_and_E(
	
		.A(input_2),
		.B(input_10),
		.S(combinacao_entrada_3),
	
	);
	
	and_gate_2_inputs NA_and_B_and_C_and_ND_and_F_and_E(
	
		.A(input_3),
		.B(input_11),
		.S(combinacao_entrada_4),
	
	);
	
	and_gate_2_inputs A_and_NB_and_NC_and_D_and_NF_and_NE(
	
		.A(input_4),
		.B(input_12),
		.S(combinacao_entrada_5),
	
	);
	
	and_gate_2_inputs A_and_NB_and_C_and_D_and_NF_and_E(
	
		.A(input_5),
		.B(input_13),
		.S(combinacao_entrada_6),
	
	);
	
	and_gate_2_inputs A_and_B_and_NC_and_D_and_F_and_NE(
	
		.A(input_6),
		.B(input_14),
		.S(combinacao_entrada_7),
	
	);
	
	and_gate_2_inputs A_and_B_and_C_and_D_and_F_and_E(
	
		.A(input_7),
		.B(input_15),
		.S(combinacao_entrada_8),
	
	);
	
	or_gate_4_inputs or_0_output(
	
		.A(combinacao_entrada_1),
		.B(combinacao_entrada_2),
		.C(combinacao_entrada_3),
		.D(combinacao_entrada_4),
		.S(or_0),
	
	);
	
	or_gate_4_inputs or_1_output(
	
		.A(combinacao_entrada_5),
		.B(combinacao_entrada_6),
		.C(combinacao_entrada_7),
		.D(combinacao_entrada_8),
		.S(or_1),
	
	);
	
	or(FI,or_0,or_1);
	
endmodule 
