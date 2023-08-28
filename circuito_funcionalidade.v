module circuito_funcionalidade(A,B,C,F1,F2,F3,F4,F5,F6,F7);

	input A, B, C;
	output F1,F2,F3,F4,F5,F6,F7;
	wire NA = !A, NB = !B, NC = !C;
	wire NA_and_B, A_and_NB;
	wire signal_high = "1b'1";
	
	//F1
	and (F1,NA,NB,C);
	
	//F2
	and (F2,NA,B,NC);
	
	//F3
	and (F3,NA,B,C);

	//F4
	and (F4,A,NB,NC);
	
	//F5
	and (F5,A,NB,C);
	
	//F6
	and (F6,A,B,NC);
	
	//F7
	and (F7,A,B,C);
	
endmodule 