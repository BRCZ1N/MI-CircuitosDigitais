	module decodificador_7seg(A,B,C, SEG);

	input A, B, C;
	output [7:0] SEG;
	wire NA = !A, NB = !B, NC = !C;
	wire signal_high = "1b'1";
	
	//Seg 1
	and(SEG[0], NA,NB,C);
	
	//Seg 2
	wire A_and_NB_and_C, A_and_B_and_NC;
	and(A_and_NB_and_C,A,NB,C);
	and(A_and_B_and_NC, A, B, NC);
	or(SEG[1],A_and_NB_and_C,A_and_B_and_NC);
	
	
	//Seg 3
	wire NA_and_NC, NB_and_NC, A_and_B_and_C;
	and(NA_and_NC,NA,NC);
	and(NB_and_NC, NB, NC);
	and(A_and_B_and_C, A,B,C);
	or(SEG[2],NA_and_NC, NB_and_NC,A_and_B_and_C);
	
	
	//Seg 4
	wire NA_and_NB;
	and(NA_and_NB, NA, NB);	
	or(SEG[3],NA_and_NB, NA_and_NC, NB_and_NC,  A_and_B_and_C);
	
	//Seg 5
	wire NA_and_C;
	and(NA_and_C,NA,C);
	or(SEG[4], NA_and_C, NB_and_C);
	
	//Seg6
	
	and(SEG[5],NA_and_C);
	
	//Seg 7
	and(SEG[6],NA, NB, C);
	
	//Seg 8 
	assign SEG[7] = signal_high;
	
endmodule 