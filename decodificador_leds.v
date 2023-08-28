module decodificador_leds(A,B,C,LED0,LED1,LED2,LED3,LED4,LED5,LED6);

	input A, B, C;
	output LED0,LED1,LED2,LED3,LED4,LED5,LED6;
	wire NA = !A, NB = !B, NC = !C;
	
	and(LED0,NA,NB,C);
	and(LED1,NA,B,NC);
	and(LED2,NA,B,C);
	and(LED3,A,NB,NC);
	and(LED4,A,NB,C);
	and(LED5,A,B,NC);
	and(LED6,A,B,C);
	
endmodule 