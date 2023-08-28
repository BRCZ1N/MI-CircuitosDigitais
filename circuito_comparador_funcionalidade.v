module circuito_comparador_funcionalidade(A,B,C,D,E,F,FI);	

	input A,B,C,D,E,F;
	output FI;
	wire NA = !A, NB = !B, NC = !C, ND = !D, NE = !E, NF = !F;
	
	wire NA_and_NB_and_NC,ND_and_NF_and_NE, NA_and_NB_and_NC_and_ND_and_NF_and_NE;
	wire NA_and_NB_and_C,ND_and_NF_and_E,NA_and_NB_and_C_and_ND_and_NF_and_E;
	wire NA_and_B_and_NC,ND_and_F_and_NE,NA_and_B_and_NC_and_ND_and_F_and_NE; 
	
	wire NA_and_B_and_C,ND_and_F_and_E, NA_and_B_and_C_and_ND_and_F_and_E;
	wire A_and_NB_and_NC,D_and_NF_and_NE, A_and_NB_and_NC_and_D_and_NF_and_NE; 
	wire D_and_NF_and_E, NA_and_NB_and_C_and_D_and_NF_and_E;
	
	wire A_and_B_and_NC,D_and_F_and_NE, A_and_B_and_NC_and_D_and_F_and_NE; 
	wire A_and_B_and_C,D_and_F_and_E, A_and_B_and_C_and_D_and_F_and_E;
	
	and(NA_and_NB_and_NC,NA,NB,NC);
	and(NA_and_NB_and_C,NA,NB,C);
	and(NA_and_B_and_NC,NA,B,NC);
	and(NA_and_B_and_C,NA,B,C);
	and(A_and_NB_and_NC,A,NB,NC);
	and(A_and_B_and_NC,A,B,NC);
	and(A_and_B_and_C,A,B,C);
	and(ND_and_NF_and_NE,ND,NF,NE);
	and(ND_and_NF_and_E,ND,NF,E);
	and(ND_and_F_and_NE,ND,F,NE);
	and(ND_and_F_and_E,ND,F,E);
	and(D_and_NF_and_NE,D,NF,NE);
	and(D_and_NF_and_E,D,NF,E);
	and(D_and_F_and_NE,D,F,NE);
	and(D_and_F_and_E,D,F,E);
	
	and(NA_and_NB_and_NC_and_ND_and_NF_and_NE,NA_and_NB_and_NC,ND_and_NF_and_NE);
	and(NA_and_NB_and_C_and_ND_and_NF_and_E,NA_and_NB_and_C,ND_and_NF_and_E);
	and(NA_and_B_and_NC_and_ND_and_F_and_NE,NA_and_B_and_NC,ND_and_F_and_NE);
	and(NA_and_B_and_C_and_ND_and_F_and_E,NA_and_B_and_C,ND_and_F_and_E);
	and(A_and_B_and_C_and_ND_and_F_and_E,A_and_B_and_C,ND_and_F_and_E);
	and(NA_and_NB_and_C_and_D_and_NF_and_E,NA_and_NB_and_C,D_and_NF_and_E);
	and(A_and_B_and_NC_and_D_and_F_and_NE,A_and_B_and_NC,D_and_F_and_NE);
	and(A_and_B_and_C_and_D_and_F_and_E,A_and_B_and_C,D_and_F_and_E);
	
	or(NA_and_NB_and_NC_and_ND_and_NF_and_NE_or_NA_and_NB_and_C_and_ND_and_NF_and_E,NA_and_NB_and_NC_and_ND_and_NF_and_NE,NA_and_NB_and_C_and_ND_and_NF_and_E);	
	or(NA_and_B_and_NC_and_ND_and_F_and_NE_or_NA_and_B_and_C_and_ND_and_F_and_E,NA_and_B_and_NC_and_ND_and_F_and_NE,NA_and_B_and_C_and_ND_and_F_and_E);
	or(NA_and_B_and_C_and_ND_and_F_and_E_or_NA_and_B_and_C_and_ND_and_F_and_E,NA_and_B_and_C_and_ND_and_F_and_E,NA_and_B_and_C_and_ND_and_F_and_E);
	or(A_and_B_and_NC_and_D_and_F_and_NE_or_A_and_B_and_C_and_D_and_F_and_E,A_and_B_and_NC_and_D_and_F_and_NE,A_and_B_and_C_and_D_and_F_and_E);
	
	
	or(NA_and_NB_and_NC_and_ND_and_NF_and_NE_or_NA_and_NB_and_C_and_ND_and_NF_and_E__or__NA_and_B_and_NC_and_ND_and_F_and_NE_or_NA_and_B_and_C_and_ND_and_F_and_E,NA_and_NB_and_NC_and_ND_and_NF_and_NE_or_NA_and_NB_and_C_and_ND_and_NF_and_E,NA_and_B_and_NC_and_ND_and_F_and_NE_or_NA_and_B_and_C_and_ND_and_F_and_E);
	or(NA_and_B_and_C_and_ND_and_F_and_E_or_NA_and_B_and_C_and_ND_and_F_and_E__or__A_and_B_and_NC_and_D_and_F_and_NE_or_A_and_B_and_C_and_D_and_F_and_E,NA_and_B_and_C_and_ND_and_F_and_E_or_NA_and_B_and_C_and_ND_and_F_and_E,     A_and_B_and_NC_and_D_and_F_and_NE_or_A_and_B_and_C_and_D_and_F_and_E);
	
	or(FI,NA_and_NB_and_NC_and_ND_and_NF_and_NE_or_NA_and_NB_and_C_and_ND_and_NF_and_E__or__NA_and_B_and_NC_and_ND_and_F_and_NE_or_NA_and_B_and_C_and_ND_and_F_and_E,NA_and_B_and_C_and_ND_and_F_and_E_or_NA_and_B_and_C_and_ND_and_F_and_E__or__A_and_B_and_NC_and_D_and_F_and_NE_or_A_and_B_and_C_and_D_and_F_and_E);
	
	
	//IE01F = IE02F --> a'b'c'd'f'e' + a'b'cd'f'e + a'bc'd'fe'+ a'bcd'fe + ab'c'df'e' + ab'cdf'e + abc'dfe' + abcdfe

	
	//a'b'c'd'f'e' 
	
	
	//a'b'cd'f'e 
	
	
	// a'bc'd'fe'
	
	
	// a'bcd'fe 
	
	
	//	ab'c'df'e' 
	
	
	//ab'cdf'e 
	
	
	//abc'dfe' 
	
	
	//	abcdfe
	

endmodule 