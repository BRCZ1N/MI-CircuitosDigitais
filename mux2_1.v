module mux2_1(A,B,SEL,OUT);

	input A,B,SEL;
	output OUT;
	wire NA = !A, NB = !B, NSEL = !SEL;
	wire NSEL_and_A, SEL_and_B;
	and(NSEL_and_A, NSEL, A);
	and(SEL_and_B,SEL,B);
	or(OUT,NSEL_and_A,SEL_and_B);
	
	
endmodule 