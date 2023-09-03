module circuito_funcionalidade(A,B,C,F);

	input A, B, C;
	output [6:0] F;
	wire NA, NB, NC;
	wire NA_and_B, A_and_NB;
	
	not(NA,A);
	not(NB,B);
	not(NC,C);
	
	//F1
	and (F[6],NA,NB,C);
	
	//F2
	and (F[5],NA,B,NC);
	
	//F3
	and (F[4],NA,B,C);

	//F4
	and (F[3],A,NB,NC);
	
	//F5
	and (F[2],A,NB,C);
	
	//F6
	and (F[1],A,B,NC);
	
	//F7
	and (F[0],A,B,C);
	
endmodule 