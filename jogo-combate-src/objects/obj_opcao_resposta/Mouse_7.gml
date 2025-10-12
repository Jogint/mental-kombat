if (global.jogador_atual != global.tipos_jogadores[0]) { // verifica se n é bot
	if (is_certo) {
		if (global.jogador_atual == global.tipos_jogadores[1]) {
			global.inst_perso_partida[0].aumentar_energia(); // aumenta do p1
		} else {
			global.inst_perso_partida[1].aumentar_energia(); // aumenta do p2
		}
		scr_proxima_pergunta();
	} else {
		global.errou_resposta = true;
	}
}