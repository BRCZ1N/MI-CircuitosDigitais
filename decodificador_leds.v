module decodificador_leds(A,B,C,LED);

	input A, B, C;
	output [6:0] LED;
	wire NA, NB, NC;
	
	not(NA,A);
	not(NB,B);
	not(NC,C);
	
	and(LED[6],NA,NB,C);
	and(LED[5],NA,B,NC);
	and(LED[4],NA,B,C);
	and(LED[3],A,NB,NC);
	and(LED[2],A,NB,C);
	and(LED[1],A,B,NC);
	and(LED[0],A,B,C);
	
endmodule 