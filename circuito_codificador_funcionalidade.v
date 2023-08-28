module circuito_codificador_funcionalidade(A,B,C,D,E,F,G,F1,F2,F3);

	input A,B,C,D,E,F,G;
	output F1,F2,F3;
	wire NA = !A, NB = !B, NC = !C, ND = !D, NE = !E, NF = !F, NG = !G;
	
	//F1
	
	wire NA_and_NB_and_NC,ND_and_NE_and_NF,NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G;
	wire ND_and_NE_and_F,NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG;
	wire ND_and_E_and_NF,NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG;
	wire D_and_NE_and_NF, NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG;
	wire NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G_or_NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG;
	wire NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG_or_NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG;
	
	and(NA_and_NB_and_NC,NA,NB,NC);
	and(ND_and_NE_and_NF,ND,NE,NF);
	and(ND_and_NE_and_F,ND,NE,F);
	and(ND_and_E_and_NF,ND,E,NF);
	and(D_and_NE_and_NF,D,NE,NF);

	and(NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G,NA_and_NB_and_NC,ND_and_NE_and_NF,G);
	and(NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG,NA_and_NB_and_NC,ND_and_NE_and_F,NG);
	and(NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG,NA_and_NB_and_NC,ND_and_E_and_NF,NG);
	and(NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG,NA_and_NB_and_NC,D_and_NE_and_NF,NG);
	
	or(NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G_or_NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG,NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G,NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG);
	or(NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG_or_NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG,NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG,NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG); 
	
	or(F1,NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG_or_NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG,NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG_or_NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG);
	
	//F2
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//F3
	
	
	
	
	
	
	
endmodule 