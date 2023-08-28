module seletor_terminais(A,B,C,D,E,F, TERMINAL1,TERMINAL2);

	input A, B, C, D, E, F;
	output TERMINAL1,TERMINAL2;
	wire NA = !A, NB = !B, NC = !C, ND = !D, NE = !E, NF = !F;
	wire ND_and_NF, NC_and_E, NC_and_D;
	
	and (TERMINAL1,NA,NB);
	
	and (ND_and_NF,ND,NF);
	and (NC_and_E,NC,E);
	and (NC_and_D,NC,D);
	
	or(TERMINAL2,ND_and_NF,NC_and_E,NC_and_D);
	
endmodule 