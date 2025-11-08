// ==================================================
/// @description Seleção do player
// ==================================================

if (obj_gestao_rodada.jogador_atual != global.tipos_jogadores[JOGADOR.BOT] && // verifica se n é bot
!obj_gestao_rodada.errou_resposta) { // se ainda é válido responder
	
	// ---------- Se o player acertou a resposta ----------
	if (is_certo) {
		
		// ---------- No modo rápido, não tem jogador atual, age na inst ----------
		if (global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO]) {
			global.inst_perso_partida[0].aumentar_energia();
			// como o player acertou, reseta o timer do oponente para ele "pensar de novo"
			global.inst_perso_partida[1].alarm[0] = scr_tempo_acerto_bot() * game_get_speed(gamespeed_fps);
			
		} else {
			player_atual.aumentar_energia();
		}
		
		scr_proxima_pergunta();
		
	// ---------- Se o player errou a resposta ----------
	} else {
		treme_opcao();
		obj_gestao_rodada.errou_resposta = true; // REMOVE: atribuição indevida
	}
}