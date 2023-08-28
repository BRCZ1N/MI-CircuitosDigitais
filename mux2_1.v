module mux2_1(A,B,SEL,OUT);

	input A,B,SEL;
	output OUT;

	assign OUT = ( SEL == 1'b0 ) ? A : B;
	
endmodule 