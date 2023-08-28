module seletor_terminais(A,B,C,D,E,F, TERMINAL1,TERMINAL2);

	input A, B, C, D, E, F;
	output TERMINAL1,TERMINAL2;
	wire NA = !A, NB = !B, NC = !C, ND = !D, NE = !E, NF = !F;
	wire NA_and_NB, ND_and_NF, NC_and_E, NC_and_D, ND_and_NF_or_NC_and_E;
	
	and (TERMINAL1,NA,NB);
	and (ND_and_NF,ND,NF);
	and (NC_and_E,NC,E);
	and (NC_and_D,NC,D);
	
	
	or(ND_and_NF_or_NC_and_E,ND_and_NF,NC_and_E);
	or(TERMINAL2,D_and_NF_or_NC_and_E,NC_and_D);
endmodule 