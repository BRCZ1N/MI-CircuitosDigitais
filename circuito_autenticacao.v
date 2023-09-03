module circuito_autenticacao(A,B,C,P);

	input A, B, C;
	output [6:0] P;
	wire NA, NB, NC;
	wire NA_and_C, NB_and_C, A_and_B_and_NC;
	wire NA_and_B_and_C, A_and_NB_and_C;
	
	not(NA,A);
	not(NB,B);
	not(NC,C);
	
	and(NA_and_C,NA,C);
	and(NB_and_C,NB,C);
	and(A_and_B_and_NC,A,B,NC);
	and(NA_and_B_and_C,NA,B,C);
	and(A_and_NB_and_C,A,NB,C);
	
	//P1
	or(P[6],NA_and_C,NB_and_C,A_and_B_and_NC);
	
	//P2
	or (P[5],NA_and_B_and_C,A_and_NB_and_C);
	
	//P3
	or(P[4],NA_and_C,NB_and_C);

	//P4
	or(P[3],NA_and_C,NB_and_C);
	
	//P5
	assign P[2] = A_and_NB_and_C;
	
	//P6
	or(P[1],NA_and_C,NB_and_C,A_and_B_and_NC);
	
	//P7
	assign P[0] = A_and_NB_and_C;
	
endmodule 