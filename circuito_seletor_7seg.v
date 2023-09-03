module circuito_seletor_7seg(A,B,C,D,E,F,G, SEL7SEG);

	input A, B, C, D, E, F, G;
	output SEL7SEG;
	wire NA, NB, NC, ND, NE, NF, NG;
	wire NC_and_D;	
	
	not(NA,A);
	not(NB,B);
	not(NC,C);
	not(ND,D);
	not(NE,E);
	not(NF,F);
	not(NG,G);
	
	and(NC_and_D,NC,D); 
	or(SEL7SEG, NE,NC_and_D);
	

endmodule 