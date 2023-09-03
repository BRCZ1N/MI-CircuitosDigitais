module circuito_7seg_f2(A,B,C,F2U);

	input A,B,C;
	output F2U;
	wire NA, NB, NC;
	
	not(NA,A);
	not(NB,B);
	not(NC,C);
	
	and(F2U,NA,B,NC);

endmodule 