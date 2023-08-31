module pbl(HH0,HH1,B0,B1,OUT_LEDS,OUT_MLEDS,OUT_SEGS);
	
	//Entradas primárias
	input [3:0] HH0, HH1; 
	input [1:0] B0, B1;
	//Saídas finais
	output [6:0] OUT_LEDS;
	output [7:0] OUT_MLEDS, OUT_SEGS;
	//IS01 - LEDS
	wire [6:0] P0, F0, P1, F1, P0_and_F0, P1_and_F1;
	wire SEL0, SEL1, FI0,SINAL_MUX_TERMINAL_MATRIZ,SINAL_MUX_TERMINAL_LEDS; 
	//IS02 - MATRIZ
	//Comparadores autenticação e funcionalidade
	wire [2:0] CAUT, FMATRIZ, FLEDS, CF0, CF1; 
	//Saídas dos demultiplexadores da primeira entrada
	wire DEMUX00_IS01_0_to_0_MUX00_MATRIZ, DEMUX00_IS01_1_to_1_MUX00_LEDS, DEMUX01_IS01_0_to_0_MUX01_MATRIZ;
	wire DEMUX01_IS01_1_to_1_MUX01_LEDS, DEMUX02_IS01_0_to_0_MUX02_MATRIZ,DEMUX02_IS01_1_to_1_MUX02_LEDS;
	//Saídas dos demultiplexadores da segunda entrada
	wire DEMUX00_IS02_0_to_1_MUX00_MATRIZ, DEMUX00_IS02_1_to_0_MUX00_LEDS, DEMUX01_IS02_0_to_1_MUX01_MATRIZ;
	wire DEMUX01_IS02_1_to_0_MUX01_LEDS, DEMUX02_IS02_0_to_1_MUX02_MATRIZ, DEMUX02_IS02_1_to_0_MUX02_LEDS;
	
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
	
	.A(HH0[0]),
	.B(HH0[1]),
	.C(HH0[2]),
	.D(HH1[0]),
	.E(HH1[1]),
	.F(HH1[2]),
	.AUT(CAUT),
	
	);
	
	
	circuito_comparador_funcionalidade circuito_comparador_funcionalidade0(
	
	.A(HH0[3]),
	.B(B0[0]),
	.C(B0[1]),
	.D(HH1[3]),
	.E(B1[0]),
	.F(B1[1]),
	.FI(FI0),
	
	);
	
	comparar_permissao_e_funcionalidade comparacao0(
	
	  .P(P0),
	  .F(F0),
	  .P_and_F(P0_and_F0),
	
	);
	
	circuito_codificador_funcionalidade circuito_codificador_funcionalidade0(
	
	.A(P0_and_F0[0]),
	.B(P0_and_F0[1]),
	.C(P0_and_F0[2]),
	.D(P0_and_F0[3]),
	.E(P0_and_F0[4]),
	.F(P0_and_F0[5]),
	.G(P0_and_F0[6]),
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
	
	demux1_2 demux_02_IS01(
	
	.A(CF0[2]),
	.SEL(SEL0),
	.OUT1(DEMUX02_IS01_0_to_0_MUX02_MATRIZ),
	.OUT2(DEMUX02_IS01_1_to_1_MUX02_LEDS),
	
	);
	
	comparar_permissao_e_funcionalidade comparacao1(
	
	  .P(P1),
	  .F(F1),
	  .P_and_F(P1_and_F1),
	
	);
	
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
	
	mux2_1 mux_00_matriz(
	
	.A(DEMUX00_IS01_0_to_0_MUX00_MATRIZ),
	.B(DEMUX00_IS02_0_to_1_MUX00_MATRIZ),
	.SEL(SINAL_MUX_TERMINAL_MATRIZ),
	.OUT(FMATRIZ[0]),
	
	);
	
	
	mux2_1 mux_01_matriz(
	
	
	.A(DEMUX01_IS01_0_to_0_MUX01_MATRIZ),
	.B(DEMUX01_IS02_0_to_1_MUX01_MATRIZ),
	.SEL(SINAL_MUX_TERMINAL_MATRIZ),
	.OUT(FMATRIZ[1]),
	
	
	);
	
	mux2_1 mux_02_matriz(
	
	.A(DEMUX02_IS01_0_to_0_MUX02_MATRIZ),
	.B(DEMUX02_IS02_0_to_1_MUX02_MATRIZ),
	.SEL(SINAL_MUX_TERMINAL_MATRIZ),
	.OUT(FMATRIZ[2]),
	
	
	
	);
	
	mux2_1 mux_00_leds(
	
	.A(DEMUX00_IS02_1_to_0_MUX00_LEDS),
	.B(DEMUX00_IS01_1_to_1_MUX00_LEDS),
	.SEL(SINAL_MUX_TERMINAL_LEDS),
	.OUT(FLEDS[0]),
	
	
	
	);
	
	mux2_1 mux_01_leds(
	
	
	.A(DEMUX01_IS02_1_to_0_MUX01_LEDS),
	.B(DEMUX01_IS01_1_to_1_MUX01_LEDS),
	.SEL(SINAL_MUX_TERMINAL_LEDS),
	.OUT(FLEDS[1]),
	
	
	);
	
	
	mux2_1 mux_02_leds(
	
	.A(DEMUX02_IS02_1_to_0_MUX02_LEDS),
	.B(DEMUX02_IS01_1_to_1_MUX02_LEDS),
	.SEL(SINAL_MUX_TERMINAL_LEDS),
	.OUT(FLEDS[2]),
	
	);
	
	decodificador_matriz decodificador_matriz0(
	
	.A(FMATRIZ[0]),
	.B(FMATRIZ[1]),
	.C(FMATRIZ[2]),
	.MLED(OUT_MLEDS),
	
	);
	
	decodificador_leds decodificador_leds0(
		
	.A(FLEDS[0]),
	.B(FLEDS[1]),
	.C(FLEDS[2]),
	.LED(OUT_LEDS),

	);
	
	decodificador_7seg decodificador_7seg0(
	
	.A(),
	.B(),
	.C(), 
	.SEG(OUT_SEGS), 
	
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

	input [6:0] P, F;
	output [6:0] P_and_F;

   and_gate and1(.E1(P[0]), .E2(F[0]), .OUT(P_and_F[0]));
	and_gate and2(.E1(P[1]), .E2(F[1]), .OUT(P_and_F[1]));
	and_gate and3(.E1(P[2]), .E2(F[2]), .OUT(P_and_F[2]));
	and_gate and4(.E1(P[3]), .E2(F[3]), .OUT(P_and_F[3]));
   and_gate and5(.E1(P[4]), .E2(F[4]), .OUT(P_and_F[4]));
	and_gate and6(.E1(P[5]), .E2(F[5]), .OUT(P_and_F[5]));
	and_gate and7(.E1(P[6]), .E2(F[6]), .OUT(P_and_F[6]));

endmodule 

module and_gate(E1,E2,OUT);

	input E1,E2;
	output OUT;

	and(OUT,E1,E2);


endmodule 