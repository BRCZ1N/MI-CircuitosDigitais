module decodificador_leds(A,B,C,LED0,LED1,LED2,LED3,LED4,LED5,LED6);

	input A, B, C;
	output LED0,LED1,LED2,LED3,LED4,LED5,LED6;
	wire NA = !A, NB = !B, NC = !C;
	
endmodule 