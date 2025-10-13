function scr_encerrar_turno(){
	scr_toggle_hab([]);
	trocar_turno();
	scr_proxima_pergunta();
	//show_debug_message("trocou turno para: " + global.jogador_atual);
	global.turno_iniciou = false;
}

function trocar_turno(){
	if (!global.partida_acabou) {
		var _i = array_get_index(global.tipos_jogadores, global.jogador_atual);
		if (global.modo_jogo_atual != global.modos_jogo[0]) { // PvC
			if (_i == array_length(global.tipos_jogadores) - 2) { // se for vez do p1
				global.jogador_atual = global.tipos_jogadores[0]; // volta pro bot
			} else {
				global.jogador_atual = global.tipos_jogadores[_i + 1]; // avança p p2
			}
		} else { // PvP
			if (_i == array_length(global.tipos_jogadores) - 1) { // se for vez do p2
				global.jogador_atual = global.tipos_jogadores[1]; // volta pro p1
			} else {
				global.jogador_atual = global.tipos_jogadores[_i + 1]; // avança p p1
			}
		}
	}
}