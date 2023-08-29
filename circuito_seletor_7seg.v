module circuito_seletor_7seg(A,B,C,D,E,F,G, SEL7SEG);

	input A, B, C, D, E, F, G;
	output SEL7SEG;
	wire NA = !A, NB = !B, NC = !C, ND = !D, NE = !E, NF = !F, NG = !G;
	wire NC_and_D;	
	
	and(NC_and_D,NC,D); 
	or(SEL7SEG, NE,NC_and_D);
	

endmodule 