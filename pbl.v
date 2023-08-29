module pbl(HH0,HH1,B0,B1,LED,MLED,SEG);
	
	input [3:0]HH0,[3:0]HH1, [1:0]B0, [1:0]B1;
	output [6:0]LEDS [7:0]MLED [7:0]SEG;
	
	circuito_autenticacao circuito_autenticacao0(
	
	.A(HH0[0]),
	.B(HH0[1]),
	.C(HH0[2]),
	.P1(),
	.P2(),
	.P3(),
	.P4(),
	.P5(),
	.P6(),
	.P7(),
	
	);
	
	circuito_funcionalidade circuito_funcionalidade1(
	
	.A(HH0[3]),
	.B(B0[0]),
	.C(B0[1]),
	.F1(),
	.F2(),
	.F3(),
	.F4(),
	.F5(),
	.F6(),
	.F7(),
	
	);
	
	circuito_autenticacao circuito_autenticacao0(
	
	.A(HH1[0]),
	.B(HH1[1]),
	.C(HH1[2]),
	.P1(),
	.P2(),
	.P3(),
	.P4(),
	.P5(),
	.P6(),
	.P7(),
	
	);
	
	
	circuito_funcionalidade circuito_funcionalidade1(
	
	.A(HH1[3]),
	.B(B1[0]),
	.C(B1[1]),
	.F1(),
	.F2(),
	.F3(),
	.F4(),
	.F5(),
	.F6(),
	.F7(),
	
	);
	
	
	circuito_seletor_saidas circuito_seletor_saidas0(
	
	.A(),
	.B(),
	.C(),
	.BITE(),
	
	);
	s
	circuito_seletor_saidas circuito_seletor_saidas1(
	
	.A(),
	.B(),
	.C(),
	.BITE(),
	
	);
	
	
	circuito_comparador_funcionalidade circuito_comparador_funcionalidade(
	
	.A();
	.B();
	.C();
	.D();
	.E();
	.F();
	.FI();
	
	);
	
	
	circuito_comparador_autenticacao circuito_comparador_autenticacao(
	
	.A();
	.B();
	.C();
	.D();
	.E();
	.F();
	.AUT1();
	.AUT2();
	.AUT3();
	
	);
	
	circuito_codificador_funcionalidade circuito_codificador_funcionalidade(
	
	.A(),
	.B(),
	.C(),
	.D(),
	.E(),
	.F(),
	.G(),
	.F1(),
	.F2(),
	.F3(),
	
	
	);
	
	seletor_terminais seletor_terminal(
	
	.A(),
	.B(),
	.C(),
	.D(),
	.E(),
	.F(), 
	.TERMINAL1(),
	.TERMINAL2(),
	
	);
	
	
	demux1_2 demux0(
	
	.A(),
	.SEL(),
	.OUT1(),
	.OUT2(),
	
	);
	
	demux1_2 demux1(
	
	.A(),
	.SEL(),
	.OUT1(),
	.OUT2(),
	
	);
	
	demux1_2 demux2(
	
	.A(),
	.SEL(),
	.OUT1(),
	.OUT2(),
	
	);
	
	demux1_2 demux3(
	
	.A(),
	.SEL(),
	.OUT1(),
	.OUT2(),
	
	);
	
	demux1_2 demux4(
	
	.A(),
	.SEL(),
	.OUT1(),
	.OUT2(),
	
	);
	
	demux1_2 demux5(
	
	
	.A(),
	.SEL(),
	.OUT1(),
	.OUT2(),
	
	);
	
	mux2_1 mux0(
	
	.A(),
	.B(),
	.SEL(),
	.OUT(),
	
	
	
	);
	
	
	mux2_1 mux1(
	
	
	.A(),
	.B(),
	.SEL(),
	.OUT(),
	
	
	);
	
	mux2_1 mux2(
	
	.A(),
	.B(),
	.SEL(),
	.OUT(),
	
	
	
	);
	
	mux2_1 mux3(
	
	.A(),
	.B(),
	.SEL(),
	.OUT(),
	
	
	
	);
	
	mux2_1 mux4(
	
	
	.A(),
	.B(),
	.SEL(),
	.OUT(),
	
	
	);
	
	
	mux2_1 mux5(
	
	.A(),
	.B(),
	.SEL(),
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
	circuito_7seg_f2 circuito_7seg_f20(
	
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