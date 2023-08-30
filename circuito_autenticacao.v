module circuito_autenticacao(A,B,C,P);

	input A, B, C;
	output P[6:0]
	wire NA = !A, NB = !B, NC = !C;
	wire NA_and_B, A_and_NB;
	wire signal_high = "1b'1";
	
	//P1
	assign P[0] = signal_high;
	
	//P2
	and (NA_and_B,NA,B);
	and (A_and_NB,A,NB);
	or (P[1],NA_and_B,A_and_NB);
	
	//P3
	assign P[2] = C;

	//P4
	assign P[3] = C;
	
	//P5
	and(P[4],A,NB);
	
	//P6
	assign P[5] = signal_high;
	
	//P7
	and(P[6],A,NB);
	
endmodule 