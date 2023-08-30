module decodificador_matriz(A,B,C,MLED);

	input A, B, C;
	output [0:7] MLED;
	wire NA = !A, NB = !B, NC = !C;
	
	or(MLED[0],B,A);
	or(MLED[1],NC,B,A);
	or(MLED[2],NB,C,A);
	or(MLED[3],NB,NC,NA);
	or(MLED[4],NA,C,B);
	or(MLED[5],NA,NC,B);
	or(MLED[6],NA,NB,C);
	or(MLED[7],NA,NB,NC);

endmodule 