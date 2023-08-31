module circuito_autenticacao(A,B,C,P);

	input A, B, C;
	output [6:0] P;
	wire NA = !A, NB = !B, NC = !C;
	wire NA_and_B, A_and_NB;
	wire signal_high = "1b'1";
	
	//P1
	assign P[6] = signal_high;
	
	//P2
	and (NA_and_B,NA,B);
	and (A_and_NB,A,NB);
	or (P[5],NA_and_B,A_and_NB);
	
	//P3
	assign P[4] = C;

	//P4
	assign P[3] = C;
	
	//P5
	and(P[2],A,NB);
	
	//P6
	assign P[1] = signal_high;
	
	//P7
	and(P[0],A,NB);
	
endmodule 