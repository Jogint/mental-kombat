// TODO: LIMPAR ESTE CÓDIGO
if (obj_gestao_rodada.jogador_atual != global.tipos_jogadores[JOGADOR.BOT]) { // verifica se n é bot
	if (is_certo) {
		if (global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO]) {
			global.inst_perso_partida[0].aumentar_energia();
			global.inst_perso_partida[1].alarm[0] = scr_tempo_acerto_bot() * game_get_speed(gamespeed_fps);
			
		} else {
			player_atual.aumentar_energia();
		}
		scr_proxima_pergunta();
	} else {
		treme_opcao();
		obj_gestao_rodada.errou_resposta = true;
	}
}