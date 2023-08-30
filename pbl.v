module pbl(HH0,HH1,B0,B1,LED,MLED,SEG);
	
	//Entradas primárias
	input [3:0]HH0,[3:0]HH1, [1:0]B0, [1:0]B1;
	//Saídas finais
	output [6:0]LEDS [7:0]MLED [7:0]SEG;
	//IS01 - LEDS
	wire P0[6:0],F0[6:0],SEL0; 
	//IS02 - MATRIZ
	wire P1[6:0], F1[6:0], SEL1;
	//Comparadores autenticação e funcionalidade
	wire FI0, CAUT[0:2]; 
	//Saídas dos demultiplexadores da primeira entrada
	wire DEMUX00_IS01_0_to_0_MUX00_MATRIZ, DEMUX00_IS01_1_to_1_MUX00_LEDS, DEMUX01_IS01_0_to_0_MUX01_MATRIZ;
	wire DEMUX01_IS01_1_to_1_MUX01_LEDS, DEMUX02_IS01_0_to_0_MUX02_MATRIZ,DEMUX02_IS01_1_to_1_MUX02_LEDS;
	//Saídas dos demultiplexadores da segunda entrada
	wire DEMUX00_IS02_0_to_1_MUX00_MATRIZ, DEMUX00_IS02_1_to_0_MUX00_LEDS, DEMUX01_IS02_0_to_1_MUX01_MATRIZ;
	wire DEMUX01_IS02_1_to_0_MUX01_LEDS, DEMUX02_IS02_0_to_1_MUX02_MATRIZ, DEMUX02_IS02_1_to_0_MUX02_LEDS);
	
	
	circuito_autenticacao circuito_autenticacao0(
	
	.A(HH0[0]),
	.B(HH0[1]),
	.C(HH0[2]),
	.P(P0),
	);
	
	circuito_funcionalidade circuito_funcionalidade0(
	
	.A(HH0[3]),
	.B(B0[0]),
	.C(B0[1]),
	.F(F0),
	
	);
	
	circuito_seletor_saidas circuito_seletor_saidas0(
	
	.A(HH0[0]),
	.B(HH0[1]),
	.C(HH0[2]),
	.SEL(SEL0),
	
	);
	
	circuito_autenticacao circuito_autenticacao1(
	
	.A(HH1[0]),
	.B(HH1[1]),
	.C(HH1[2]),
	.P(P1),
	
	);
	
	
	circuito_funcionalidade circuito_funcionalidade1(
	
	.A(HH1[3]),
	.B(B1[0]),
	.C(B1[1]),
	.F(F1),
	
	);
	
	
	circuito_seletor_saidas circuito_seletor_saidas1(
	
	.A(HH1[0]),
	.B(HH1[1]),
	.C(HH1[2]),
	.SEL(SEL1),
	
	);
	
	
	circuito_comparador_autenticacao circuito_comparador_autenticacao0(
	
	.A(HH0[0]);
	.B(HH0[1]);
	.C(HH0[2]);
	.D(HH1[0]);
	.E(HH1[1]);
	.F(HH1[2]);
	.AUT1(CAUT[0]);
	.AUT2(CAUT[1]);
	.AUT3(CAUT[2]);
	
	);
	
	
	circuito_comparador_funcionalidade circuito_comparador_funcionalidade0(
	
	.A(HH0[3]);
	.B(B0[0]);
	.C(B0[1]);
	.D(HH1[3]);
	.E(B[0]);
	.F(B[1]);
	.FI(FI0);
	
	);
	
	comparar_permissao_e_funcionalidade comparacao0(
	
	  .P(P0);
	  .F(F0);
	  .P_and_F(P0_and_F0);
	
	)
	
	circuito_codificador_funcionalidade circuito_codificador_funcionalidade0(
	
	.A(P0_and_F0[0]),
	.B(P0_and_FO[1]),
	.C(P0_and_FO[2]),
	.D(P0_and_FO[3]),
	.E(P0_and_FO[4]),
	.F(P0_and_FO[5]),
	.G(P0_and_FO[6]),
	.CF(CF0),
	
	);
	
	demux1_2 demux_00_IS01(
	
	.A(CF0[0]),
	.SEL(SEL0),
	.OUT1(DEMUX00_IS01_0_to_0_MUX00_MATRIZ),
	.OUT2(DEMUX00_IS01_1_to_1_MUX00_LEDS),
	
	);
	
	demux1_2 demux_01_IS01(
	
	.A(CF0[1]),
	.SEL(SEL0),
	.OUT1(DEMUX01_IS01_0_to_0_MUX01_MATRIZ),
	.OUT2(DEMUX01_IS01_1_to_1_MUX01_LEDS),
	
	);
	
	demux1_2 demux_02_IS0(
	
	.A(CF0[2]),
	.SEL(SEL0),
	.OUT1(DEMUX02_IS01_0_to_0_MUX02_MATRIZ),
	.OUT2(DEMUX02_IS01_1_to_1_MUX02_LEDS),
	
	);
	
	comparar_permissao_e_funcionalidade comparacao1(
	
	  .P(P1);
	  .F(F1);
	  .P_and_F(P1_and_F1);
	
	)
	
	circuito_codificador_funcionalidade circuito_codificador_funcionalidade1(
	
	.A(P1_and_F1[0]),
	.B(P1_and_F1[1]),
	.C(P1_and_F1[2]),
	.D(P1_and_F1[3]),
	.E(P1_and_F1[4]),
	.F(P1_and_F1[5]),
	.G(P1_and_F1[6]),
	.CF(CF1),
	
	);
	
	demux1_2 demux_00_IS02(
	
	.A(CF1[0]),
	.SEL(SEL1),
	.OUT1(DEMUX00_IS02_0_to_1_MUX00_MATRIZ),
	.OUT2(DEMUX00_IS02_1_to_0_MUX00_LEDS),
	
	);
	
	demux1_2 demux_01_IS02(
	
	.A(CF1[1]),
	.SEL(SEL1),
	.OUT1(DEMUX01_IS02_0_to_1_MUX01_MATRIZ),
	.OUT2(DEMUX01_IS02_1_to_0_MUX01_LEDS),
	
	);
	
	demux1_2 demux_02_IS02(
	
	
	.A(CF1[2]),
	.SEL(SEL1),
	.OUT1(DEMUX02_IS02_0_to_1_MUX02_MATRIZ),
	.OUT2(DEMUX02_IS02_1_to_0_MUX02_LEDS),
	
	);
	
	seletor_terminais seletor_terminal_saida(
	
	.A(CAUT[0]),
	.B(CAUT[1]),
	.C(CAUT[2]),
	.D(FI0),
	.E(SEL0),
	.F(SEL1), 
	.TERMINAL1(SINAL_MUX_TERMINAL_MATRIZ),
	.TERMINAL2(SINAL_MUX_TERMINAL_LEDS),
	
	);
	
	mux2_1 mux00_matriz(
	
	.A(DEMUX00_IS01_0_to_0_MUX00_MATRIZ),
	.B(DEMUX00_IS02_0_to_1_MUX00_MATRIZ),
	.SEL(SINAL_MUX_TERMINAL_MATRIZ),
	.OUT(),
	
	
	
	);
	
	
	mux2_1 mux01_matriz(
	
	
	.A(DEMUX01_IS01_0_to_0_MUX01_MATRIZ),
	.B(DEMUX01_IS02_0_to_1_MUX01_MATRIZ),
	.SEL(SINAL_MUX_TERMINAL_MATRIZ),
	.OUT(),
	
	
	);
	
	mux2_1 mux02_matriz(
	
	.A(DEMUX02_IS01_0_to_0_MUX02_MATRIZ),
	.B(DEMUX02_IS02_0_to_1_MUX02_MATRIZ),
	.SEL(SINAL_MUX_TERMINAL_MATRIZ),
	.OUT(),
	
	
	
	);
	
	mux2_1 mux00_leds(
	
	.A(DEMUX00_IS02_1_to_0_MUX00_LEDS),
	.B(DEMUX00_IS01_1_to_1_MUX00_LEDS),
	.SEL(SINAL_MUX_TERMINAL_LEDS),
	.OUT(),
	
	
	
	);
	
	mux2_1 mux01_leds(
	
	
	.A(DEMUX01_IS02_1_to_0_MUX01_LEDS),
	.B(DEMUX01_IS01_1_to_1_MUX01_LEDS),
	.SEL(SINAL_MUX_TERMINAL_LEDS),
	.OUT(),
	
	
	);
	
	
	mux2_1 mux02_leds(
	
	.A(DEMUX02_IS02_1_to_0_MUX02_LEDS),
	.B(DEMUX02_IS01_1_to_1_MUX02_LEDS),
	.SEL(SINAL_MUX_TERMINAL_LEDS),
	.OUT(),
	
	
	);
	
	decodificador_leds decodificador_leds0(
	
	
	.A(),
	.B(),
	.C(),
	.LED0(),
	.LED1(),
	.LED2(),
	.LED3(),
	.LED4(),
	.LED5(),
	.LED6(),

	
	);
	
	
	
	decodificador_matriz decodificador_matriz0(
	
	.A(),
	.B(),
	.C(),
	.MLED0(),
	.MLED1(),
	.MLED2(),
	.MLED3(),
	.MLED4(),
	.MLED5(),
	.MLED6(),
	.MLED7(),
	
	
	
	
	);
	
	decodificador_7seg decodificador_7seg0(
	
	
	A(),
	B(),
	C(), 
	SEGA(), 
	SEGB(), 
	SEGC(), 
	SEGD(), 
	SEGE(), 
	SEGF(), 
	SEGG(), 
	SEGDP(),
	
	
	
	
	
	
	);
	
	circuito_seletor_7seg circuito_7seg0(
	
	
	
	.A(),
	.B(),
	.C(),
	.D(),
	.E(),
	.F(),
	.G(), 
	.SEL7SEG(),
	
	
	
	
	
	
	);
	circuito_7seg_f2 circuito_7seg_f2_0(
	
	.A(), 
	.B(),
	.C(),
	.D(),
	.E(),
	.F(),
	.F2U1(),
	.F2U2(),
	
	
	);
	
	
	
endmodule 

module comparar_permissao_e_funcionalidade(P,F,P_and_F);

	input P[6:0],F[6:0];
	output P_and_F[0:6];

   and_gate and1(.E1(P[0]),E2(F[0]), OUT(P_and_F[0]));
	and_gate and2(.E1(P[1]),E2(F[1]), OUT(P_and_F[1]));
	and_gate and3(.E1(P[2]), E2(F[2]), OUT(P_and_F[2]));
	and_gate and4(.E1(P[3]), E2(F[3]), OUT(P_and_F[3]));
   and_gate and5(.E1(P[4]), E2(F[4]), OUT(P_and_F[4]));
	and_gate and6(.E1(P[5]), E2(F[5]), OUT(P_and_F[5]));
	and_gate and7(.E1(P[6]), E2(F[6]), OUT(P_and_F[6]));

endmodule 

module and_gate(E1,E2,OUT);

	input E1,E2;
	output OUT

	and(out,E1,E2);


endmodule 