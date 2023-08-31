module decodificador_matriz(A,B,C,MLED);

	input A, B, C;
	output [7:0] MLED;
	wire NA = !A, NB = !B, NC = !C;
		
	or(MLED[7],C,B,A);
	or(MLED[6],NC,B,A);
	or(MLED[5],NB,C,A);
	or(MLED[4],NB,NC,A);
	or(MLED[3],NA,C,B);
	or(MLED[2],NA,NC,B);
	or(MLED[1],NA,NB,C);
	or(MLED[0],NA,NB,NC);

endmodule 