module demux1_2(A,SEL,OUT1,OUT2);

	input A,SEL;
	output OUT1,OUT2;
	wire NA = !A, NSEL = !NSEL;
	
	and(OUT1,A,SEL);
	and(OUT2,A,NSEL);
	
endmodule 