module decodificador_matriz(A,B,C,MLED0,MLED1,MLED2,MLED3,MLED4,MLED5,MLED6,MLED7);

	input A, B, C;
	output MLED0,MLED1,MLED2,MLED3,MLED4,MLED5,MLED6,MLED7;
	wire NA = !A, NB = !B, NC = !C;
	
	or(MLED0,C,B,A);
	or(MLED1,NC,B,A);
	or(MLED2,NB,C,A);
	or(MLED3,NB,NC,NA);
	or(MLED4,NA,C,B);
	or(MLED5,NA,NC,B);
	or(MLED6,NA,NB,C);
	or(MLED7,NA,NB,NC);

endmodule 