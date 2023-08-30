	module decodificador_7seg(A,B,C, SEG);

	input A, B, C;
	output [0:7] SEG;
	wire NA = !A, NB = !B, NC = !C;
	wire NA_and_NB,NA_and_NC,NB_and_NC,A_and_B_and_C;
	wire signal_high = "1b'1";
	
	//Seg 1
	and(NA_and_NB,NA,NB);
	and(NA_and_NC,NA,NC);
	and(NB_and_NC,NB,NC);
	and(A_and_B_and_C,A,B,C);
	
	
	wire	NA_and_NB_or_NA_and_NC, NB_and_NC_or_A_and_B_and_C;
	or(NA_and_NB_or_NA_and_NC,NA_and_NB,NA_and_NC);
	or(NB_and_NC_or_A_and_B_and_C,NB_and_NC,A_and_B_and_C);
	or(SEG[0], NA_and_NB_or_NA_and_NC,NB_and_NC_or_A_and_B_and_C);
	
	
	//Seg 2
	or(SEG[1],A,NC);
	
	
	//Seg 3
	wire A_and_B,NA_and_NC_or_NB_and_NC;
	and(A_and_B,A,B);
	or(NA_and_NC_or_NB_and_NC,NA_and_NC,NB_and_NC);
	or(SEG[2],NA_and_NC_or_NB_and_NC,A_and_B);
	
	//Seg 4
	
	or(SEG[3], NA_and_NB_or_NA_and_NC,NB_and_NC_or_A_and_B_and_C);
	
	//Seg 5
	
	or(SEG[4],NA,NB,C);
	
	//Seg6
	
	wire B_and_C;
	and(B_and_C,B,C);
	or(SEG[5],NA_and_NC,B_and_C,A);
	
	//Seg 7
	
	or(SEG[6],NA_and_NC_or_NB_and_NC,A_and_B);
	
	//Seg 8 
	assign SEG[7] = signal_high;
	
endmodule 