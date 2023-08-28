module circuito_7seg_f2(A,B,C,D,E,F,F2U1,F2U2);

	input A,B,C,D,E,F;
	output F2U1,F2U2;
	wire NA = !A, NB = !B, NC = !C, ND = !D, NE = !E, NF = !F;
	
	and(F1U1,NA,B,NC);
	and(F2U2,ND,E,NF);

endmodule 