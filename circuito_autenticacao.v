module circuito_autenticacao(A,B,C,P1,P2,P3,P4,P5,P6,P7);

	input A, B, C;
	output P1,P2,P3,P4,P5,P6,P7;
	wire NA = !A, NB = !B, NC = !C;
	wire NA_and_B, A_and_NB;
	wire signal_high = "1b'1";
	
	
	//P1
	assign P1 = signal_high;
	
	//P2
	and (NA_and_B,NA,B);
	and (A_and_NB,A,NB);
	or (P2,NA_and_B,A_and_NB);
	
	//P3
	assign P3 = C;

	//P4
	assign P4 = C;
	
	//P5
	and(P5,A,NB);
	
	//P6
	assign P6 = signal_high;
	
	//P7
	and(P7,A,NB);
	
endmodule 