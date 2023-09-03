module circuito_seletor_saidas(A,B,C,SEL);

	input A, B, C;
	output SEL;
	wire NA, NB, NC;
	wire NA_and_NB, A_and_B;
	
	not(NA,A);
	not(NB,B);
	not(NC,C);
	
	and (NA_and_NB,NA,NB);
	and (A_and_B,A,B);

	or(SEL,NA_and_NB,A_and_B);

endmodule 