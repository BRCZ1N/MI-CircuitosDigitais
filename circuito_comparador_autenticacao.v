module circuito_comparador_autenticacao(A,B,C,D,E,F,AUT1,AUT2,AuT3);

	input A, B, C, D, E, F;
	output AUT1,AUT2,AUT3;
	wire NA = !A, NB = !B, NC = !C, ND = !D, NE = !E, NF = !F;
	wire NA_and_B_and_C, ND_and_NE,NA_and_B_and_C_and_ND_and_NE;
	wire A_and_NB,C_and_ND,A_and_NB_and_C_and_ND;
	wire ND_and_NF;
	wire NA_and_B_and_C_and_ND_and_NE_or_A_and_NB_and_C_and_ND_or_ND_and_NF;//or1
	
	//AUT1
	
	and(NA_and_B_and_C,NA,B,C);
	and(ND_and_NE,ND,NE);
	and(NA_and_B_and_C_and_ND_and_NE,NA_and_B_and_C,ND_and_NE);
	and(A_and_NB,A,NB);
	and(C_and_ND, C, ND);
	and(A_and_NB_and_C_and_ND,A_and_NB, C_and_ND,);
	and(ND_and_NF,ND,NF);
	
	wire NE_and_NF, D_and_E_and_F, NB_and_C, D_and_E;
	wire NA_and_C_and_D_and_E,NB_and_C_and_D_and_E;
	
	
	wire NA_and_C_and_D_and_E_or_NB_and_C_and_D_and_E, NE_and_NF_or_D_and_E_and_F_or_NA_and_C_and_D_and_E_or_NB_and_C_and_D_and_E;//or2 e or3

	
	 

	and(NE_and_NF,NE,NF);
	and(D_and_E_and_F,D,E,F);
	and(NA_and_C_and_D_and_E,NA,C,D,E);
	
	
	and(NB_and_C,NB,C);
	and(D_and_E, D, E);
	
	and(NB_and_C_and_D_and_E,NB_and_C,D_and_E);
	
	
	or(NA_and_B_and_C_and_ND_and_NE_or_A_and_NB_and_C_and_ND_or_ND_and_NF,NA_and_B_and_C_and_ND_and_NE,A_and_NB_and_C_and_ND,A_and_NB,ND_and_NF);
	or(NA_and_C_and_D_and_E_or_NB_and_C_and_D_and_E,NA_and_C_and_D_and_E, NB_and_C_and_D_and_E);
	or(NE_and_NF_or_D_and_E_and_F_or_NA_and_C_and_D_and_E_or_NB_and_C_and_D_and_E,NE_and_NF,D_and_E_and_F,NA_and_C_and_D_and_E_or_NB_and_C_and_D_and_E);
	or(AUT1,NA_and_B_and_C_and_ND_and_NE_or_A_and_NB_and_C_and_ND_or_ND_and_NF,NE_and_NF_or_D_and_E_and_F_or_NA_and_C_and_D_and_E_or_NB_and_C_and_D_and_E);

	
	
	//AUT2
endmodule 