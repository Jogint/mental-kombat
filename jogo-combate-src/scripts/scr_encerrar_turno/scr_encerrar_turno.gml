function scr_encerrar_turno(){
	scr_toggle_hab([]);
	trocar_turno();
	scr_proxima_pergunta();
	show_debug_message("trocou turno para: " + global.jogador_atual);
	global.turno_iniciou = false;
}

function trocar_turno(){
	if (!global.partida_acabou) {
		var _i = array_get_index(global.tipos_jogadores, global.jogador_atual);
		if (global.modo_jogo_atual != global.modos_jogo[0]) {
			if (_i == array_length(global.tipos_jogadores) - 2) { //ignora o p2
				global.jogador_atual = global.tipos_jogadores[0];
			} else {
				global.jogador_atual = global.tipos_jogadores[_i + 1];
			}
		} else {
			if (_i == array_length(global.tipos_jogadores) - 1) {
				global.jogador_atual = global.tipos_jogadores[1]; //ignora o bot
			} else {
				global.jogador_atual = global.tipos_jogadores[_i + 1];
			}
		}
	}
}