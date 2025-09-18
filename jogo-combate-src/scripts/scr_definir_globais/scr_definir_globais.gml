function scr_definir_globais(){
	randomise();
	global.operacao = ["sum", "sub", "mult", "divi"];
	global.jogadores = ["bot", "player"];
	global.dificuldades = ["facil", "medio", "dificil"];
	global.qtd_alternativas = 4;
	global.dificuldade = global.dificuldades[1];
	global.jogador_atual = global.jogadores[1];
	global.timer_turno = 0;
	global.turno_iniciou = false;
	global.perguntas_geradas = scr_gerar_perguntas();
	global.pergunta_atual = global.perguntas_geradas[0];
	global.errou_resposta = false;
}