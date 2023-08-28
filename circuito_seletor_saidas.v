module circuito_seletor_saidas(A,B,C,BITE);

	input A, B, C;
	output BITE;
	wire NA = !A, NB = !B, NC = !C;
	wire NA_and_NB, A_and_B;
	
	
	and (NA_and_NB,NA,NB);
	and (A_and_B,A,B);

	or(BITE,NA_and_NB,A_and_B);

endmodule 