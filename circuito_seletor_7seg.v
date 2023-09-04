module circuito_seletor_7seg(A,B,C,D,E,SEL7SEG,AC);

	input A, B, C, D, E;
	output SEL7SEG;
	output [3:0] AC;
	wire NA, NB, NC, ND, NE;
	wire NB_and_NC_and_D;
	wire signal_high = "1b'1";
	
	wire NA_and_NB_and_NC, ND_and_NE, B_and_C, A_and_C, A_and_B;
	wire or_0, or_1;
	
	not(NA,A);
	not(NB,B);
	not(NC,C);
	not(ND,D);
	not(NE,E);

	//SEL7SEG
	
	and(NB_and_NC_and_D,NB,NC,D); 
	or(SEL7SEG,NE,NB_and_NC_and_D);
	
	//AC1
	
	and(NA_and_NB_and_NC,NA,NB,NC);
	and(ND_and_NE,ND,NE);
	and(B_and_C,B,C);
	and(A_and_C,A,C);
	and(A_and_B,A,B);
	
	or(or_0,NA_and_NB_and_NC,ND_and_NE);
	or(or_1,B_and_C,A_and_C,A_and_B);
	or(AC[3],or_0,or_1);
	
	//AC2
	
	assign AC[2] = signal_high;
	
	//AC3
	
	assign AC[1] = signal_high;
	
	//AC4
	
	assign AC[0] = signal_high;
	
	

endmodule 