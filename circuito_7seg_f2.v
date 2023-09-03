module circuito_7seg_f2(A,B,C,D,E,F,F2U1,F2U2);

	input A,B,C,D,E,F;
	output F2U1,F2U2;
	wire NA, NB, NC, ND, NE, NF;
	
	not(NA,A);
	not(NB,B);
	not(NC,C);
	not(ND,D);
	not(NE,E);
	not(NF,F);
	
	and(F2U1,NA,B,NC);
	and(F2U2,ND,E,NF);

endmodule 