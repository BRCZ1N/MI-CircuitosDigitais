module demux1_2(A,SEL,OUT1,OUT2);

	input A,SEL;
	output OUT1,OUT2;
	wire NA, NSEL;
	
	not(NA,A);
	not(NSEL,SEL);
	
	and(OUT1,A,NSEL);
	and(OUT2,A,SEL);
	
endmodule 