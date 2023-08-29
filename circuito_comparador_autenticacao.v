module circuito_comparador_autenticacao(A,B,C,D,E,F,AUT1,AUT2,AUT3);

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

	and();
	
	
	//AUT2
	
	//part1
	wire NA_and_NB_and_C,ND_and_NE_and_F,ND_and_E_and_F;
	wire NA_and_NB_and_C_and_ND_and_NE_and_F,NA_and_B_and_C_and_ND_and_E_and_F;
	wire NA_and_NB_and_C_and_ND_and_NE_and_F_or_NA_and_B_and_C_and_ND_and_E_and_F;
	
	
	and(NA_and_NB_and_C, NA, NB, C);
	and(ND_and_NE_and_F, ND, NE, F);
	and(NA_and_NB_and_C_and_ND_and_NE_and_F,NA_and_NB_and_C,ND_and_NE_and_F);
	
	and(NA_and_B_and_C, NA, B, C);
	and(ND_and_E_and_F, ND, E, F);
	and(NA_and_B_and_C_and_ND_and_E_and_F,NA_and_B_and_C,ND_and_E_and_F);
	
	//part 2
	wire A_and_NB_and_C, D_and_NE_and_F,A_and_B_and_NC, C_and_E_and_NF;
	wire A_and_NB_and_C_and_D_and_NE_and_F, A_and_B_and_NC_and_C_and_E_and_NF;
	wire A_and_NB_and_C_and_D_and_NE_and_F_or_A_and_B_and_NC_and_C_and_E_and_NF;
	
	and(A_and_NB_and_C, A,NB,C);
	and(D_and_NE_and_F, D, NE, F);
	and(A_and_NB_and_C_and_D_and_NE_and_F,A_and_NB_and_C,D_and_NE_and_F);
	
	
	and(A_and_B_and_NC, A, B, NC);
	and(C_and_E_and_NF, C, E, NF);
	and(A_and_B_and_NC_and_C_and_E_and_NF,A_and_B_and_NC,C_and_E_and_NF);
	
	
	or(NA_and_NB_and_C_and_ND_and_NE_and_F_or_NA_and_B_and_C_and_ND_and_E_and_F,NA_and_NB_and_C_and_ND_and_NE_and_F,NA_and_B_and_C_and_ND_and_E_and_F);
	or(A_and_NB_and_C_and_D_and_NE_and_F_or_A_and_B_and_NC_and_C_and_E_and_NF,A_and_NB_and_C_and_D_and_NE_and_F,A_and_B_and_NC_and_C_and_E_and_NF);
	or(AUT2,NA_and_NB_and_C_and_ND_and_NE_and_F_or_NA_and_B_and_C_and_ND_and_E_and_F,A_and_NB_and_C_and_D_and_NE_and_F_or_A_and_B_and_NC_and_C_and_E_and_NF);
	//AUT 3
	
	//part1
	
	wire NA_and_NB_and_ND,E_and_F,NA_and_NC, NB_and_NC;
	wire NA_and_NB_and_ND_and_E_and_F,NA_and_NC_and_NB_and_NC;
	wire NA_and_NB_and_ND_and_E_and_F_or_NA_and_NC_and_NB_and_NC; //or1
	
	and(NA_and_NB_and_ND, NA, NB, ND);
	and(E_and_F, E, F);
	and(NA_and_NC, NA, NC);
	and(NB_and_NC, NB,NC);
	and(NA_and_NB_and_ND_and_E_and_F,NA_and_NB_and_ND,E_and_F);
	and(NA_and_NC_and_NB_and_NC,NA_and_NC,NB_and_NC);
	or(NA_and_NB_and_ND_and_E_and_F_or_NA_and_NC_and_NB_and_NC,NA_and_NB_and_ND_and_E_and_F,NA_and_NC_and_NB_and_NC);
	
	
	//part2
	
	wire NA_and_NC_or_NB_and_NC;//or2
	wire NA_and_NB_and_ND_and_E_and_F_or_NA_and_NC_and_NB_and_NC_or_NA_and_NC_or_NB_and_NC; //or3
	and(NA_and_NC, NA,NC);
	and(NB_and_NC, NB,NC);
	or(NA_and_NC_or_NB_and_NC,NA_and_NCNB_and_NC);
	or(NA_and_NB_and_ND_and_E_and_F_or_NA_and_NC_and_NB_and_NC_or_NA_and_NC_or_NB_and_NC,NA_and_NB_and_ND_and_E_and_F_or_NA_and_NC_and_NB_and_NC,NA_and_NC_or_NB_and_NC);
	
	//part 3
	wire A_and_B_and_C,A_and_B,ND_and_F,B_and_D,NE_and_F;
	wire A_and_B_and_ND_and_F,B_and_D_and_NE_and_F,A_and_B_and_C_or_A_and_B_and_ND_and_F;//or4
	wire A_and_B_and_C_or_A_and_B_and_ND_and_F_or_B_and_D_and_NE_and_F;
	
	
	and(A_and_B_and_C,A,B,C);
	and(A_and_B,A,B);
	and(ND_and_F,ND,F);
	and(B_and_D,B,D);
	and(NE_and_F,NE,F);
	and(A_and_B_and_ND_and_F,A_and_B,ND_and_F);
	and(B_and_D_and_NE_and_F,B_and_D,NE_and_F);
	or(A_and_B_and_C_or_A_and_B_and_ND_and_F, A_and_B_and_C,A_and_B_and_ND_and_F);
	or(A_and_B_and_C_or_A_and_B_and_ND_and_F_or_B_and_D_and_NE_and_F,A_and_B_and_C_or_A_and_B_and_ND_and_F,B_and_D_and_NE_and_F);
	or(AUT3,NA_and_NB_and_ND_and_E_and_F_or_NA_and_NC_and_NB_and_NC_or_NA_and_NC_or_NB_and_NC,A_and_B_and_C_or_A_and_B_and_ND_and_F_or_B_and_D_and_NE_and_F);
	
	
endmodule 