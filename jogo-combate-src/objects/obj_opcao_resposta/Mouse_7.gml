if (global.jogador_atual != global.tipos_jogadores[JOGADOR.BOT]) { // verifica se n é bot
	if (is_certo) {
		if (global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO]) {
			global.inst_perso_partida[0].aumentar_energia();
			global.inst_perso_partida[1].alarm[0] = scr_tempo_acerto_bot() * game_get_speed(gamespeed_fps);
			
		} else {
			if (global.jogador_atual == global.tipos_jogadores[JOGADOR.P1]) {
				global.inst_perso_partida[0].aumentar_energia(); // aumenta do p1
			} else {
				global.inst_perso_partida[1].aumentar_energia(); // aumenta do p2
			}
		}
		scr_proxima_pergunta();
	} else {
		global.errou_resposta = true;
	}
}