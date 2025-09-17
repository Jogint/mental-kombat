function scr_definir_globais(){
	randomise();
	global.operacao = ["sum", "sub", "mult", "divi"];
	global.jogadores = ["bot", "player"];
	global.dificuldades = ["facil", "medio", "dificil"];
	global.dificuldade = global.dificuldades[0];
	global.jogador_atual = global.jogadores[1];
	global.timer_turno = 0;
	global.turno_iniciou = false;
}