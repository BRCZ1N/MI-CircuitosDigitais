module decodificador_leds(A,B,C,LED);

	input A, B, C;
	output [6:0] LED;
	wire NA = !A, NB = !B, NC = !C;
	
	and(LED[0],NA,NB,C);
	and(LED[1],NA,B,NC);
	and(LED[2],NA,B,C);
	and(LED[3],A,NB,NC);
	and(LED[4],A,NB,C);
	and(LED[5],A,B,NC);
	and(LED[6],A,B,C);
	
endmodule 