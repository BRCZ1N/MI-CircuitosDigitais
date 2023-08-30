module circuito_codificador_funcionalidade(A,B,C,D,E,F,G,CF);

	input A,B,C,D,E,F,G;
	output [2:0] CF;
	wire NA = !A, NB = !B, NC = !C, ND = !D, NE = !E, NF = !F, NG = !G;
	
	//F1
	
	wire NA_and_NB_and_NC,ND_and_NE_and_NF_and_G, NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G;
	wire ND_and_NE_and_F_and_NG,NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG;
	wire ND_and_E_and_NF_and_NG,NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG;
	wire D_and_NE_and_NF_and_NG,NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG;
	wire NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G_or_NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG;
	wire NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG_or_NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG;
	
	and(NA_and_NB_and_NC,NA,NB,NC);
	and(ND_and_NE_and_NF_and_G,ND,NE,NF,G);
	and(ND_and_NE_and_F_and_NG, ND,NE,F,NG);
	and(ND_and_E_and_NF_and_NG, ND, E, NF, NG);
	and(D_and_NE_and_NF_and_NG, D, NE, NF, NG);
	
	and(NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G,NA_and_NB_and_NC,ND_and_NE_and_NF_and_G);
	and(NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG,NA_and_NB_and_NC,ND_and_NE_and_F_and_NG);
	and(NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG,NA_and_NB_and_NC,ND_and_E_and_NF_and_NG);
	and(NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG,NA_and_NB_and_NC,D_and_NE_and_NF_and_NG);
	
	or(NA_and_NB_and_NC_and_ND_and_NE_and_NF_or_NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG,NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G,NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG);
	or(NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG_or_NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG,NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG,NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG);
	
	or(CF[0],NA_and_NB_and_NC_and_ND_and_NE_and_NF_or_NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG,NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG_or_NA_and_NB_and_NC_and_D_and_NE_and_NF_and_NG); 
	
	//F2
	
	wire NA_and_NB_and_C,ND_and_NE_and_NF_and_NG,NA_and_NB_and_C_and_ND_and_NE_and_NF_and_NG;
	wire NA_and_B_and_NC,NA_and_B_and_NC_and_ND_and_NE_and_NF_and_NG;
	
	wire NA_and_NB_and_C_and_ND_and_NE_and_NF_and_NG_or_NA_and_B_and_NC_and_ND_and_NE_and_NF_and_NG;//OK
	
	and(NA_and_NB_and_C,NA,NB,C);
	and(ND_and_NE_and_NF_and_NG, ND,NE,NF,NG);
	and(NA_and_B_and_NC,NA,B,NC);
	
	and(NA_and_NB_and_C_and_ND_and_NE_and_NF_and_NG,NA_and_NB_and_C,ND_and_NE_and_NF_and_NG);
	and(NA_and_B_and_NC_and_ND_and_NE_and_NF_and_NG,NA_and_B_and_NC,ND_and_NE_and_NF_and_NG);
	
	or(NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G_or_NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG,NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G,NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG);
	or(NA_and_NB_and_C_and_ND_and_NE_and_NF_and_NG_or_NA_and_B_and_NC_and_ND_and_NE_and_NF_and_NG,NA_and_NB_and_C_and_ND_and_NE_and_NF_and_NG,NA_and_B_and_NC_and_ND_and_NE_and_NF_and_NG);
	
	or(CF[1],NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G_or_NA_and_NB_and_NC_and_ND_and_NE_and_F_and_NG,NA_and_NB_and_C_and_ND_and_NE_and_NF_and_NG_or_NA_and_B_and_NC_and_ND_and_NE_and_NF_and_NG); 
	
	
	//F3
	
	wire A_and_NB_and_NC,A_and_NB_and_NC_and_ND_and_NE_and_NF_and_NG;
	
	wire NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G_or_NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG; //OK
	wire NA_and_NB_and_C_and_ND_and_NE_and_NF_and_NG_or_A_and_NB_and_NC_and_ND_and_NE_and_NF_and_NG;//OK
	
	and(A_and_NB_and_NC,A,NB,NC);
	and(A_and_NB_and_NC_and_ND_and_NE_and_NF_and_NG,A_and_NB_and_NC,ND_and_NE_and_NF_and_NG);
	
	or(NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G_or_NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG,NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G,NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG);
	or(NA_and_NB_and_C_and_ND_and_NE_and_NF_and_NG_or_A_and_NB_and_NC_and_ND_and_NE_and_NF_and_NG,NA_and_NB_and_C_and_ND_and_NE_and_NF_and_NG,A_and_NB_and_NC_and_ND_and_NE_and_NF_and_NG);
	
	or(CF[2],NA_and_NB_and_NC_and_ND_and_NE_and_NF_and_G_or_NA_and_NB_and_NC_and_ND_and_E_and_NF_and_NG,NA_and_NB_and_C_and_ND_and_NE_and_NF_and_NG_or_A_and_NB_and_NC_and_ND_and_NE_and_NF_and_NG); 
	
	
endmodule 