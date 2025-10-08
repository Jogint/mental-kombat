if (global.jogador_atual != global.tipos_jogadores[0]) {
	if (is_certo) {
		if (global.jogador_atual == global.tipos_jogadores[1]) {
			global.inst_perso_partida[1].aumentar_energia();
		} else {
			global.inst_perso_partida[0].aumentar_energia();
		}
		scr_proxima_pergunta();
	} else {
		global.errou_resposta = true;
	}
}