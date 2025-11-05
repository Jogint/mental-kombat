/// @function scr_encerrar_turno()
/// @description Remove o pop up de habilidades, troca o turno e chama a prox pergunta
function scr_encerrar_turno(){
	layer_set_visible("Opcoes", true);
	trocar_turno();
	scr_proxima_pergunta();
	
	var _p1 = global.inst_perso_partida[0];
	var _p2 = global.inst_perso_partida[1];
	_p1.alterou_tamanho = false;
	_p2.alterou_tamanho = false;
	
	global.turno_iniciou = false;
}

/// @function trocar_turno()
function trocar_turno(){
	if (!global.partida_acabou) {
		var _i = array_get_index(global.tipos_jogadores, global.jogador_atual);
		if (global.modo_jogo_atual != global.modos_jogo[MODO.PVP]) { // PvC
			if (_i == array_length(global.tipos_jogadores) - 2) { // se for vez do p1
				global.jogador_atual = global.tipos_jogadores[JOGADOR.BOT]; // volta pro bot
			} else {
				global.jogador_atual = global.tipos_jogadores[_i + 1]; // avança p p2
			}
		} else { // PvP
			if (_i == array_length(global.tipos_jogadores) - 1) { // se for vez do p2
				global.jogador_atual = global.tipos_jogadores[JOGADOR.P1]; // volta pro p1
			} else {
				global.jogador_atual = global.tipos_jogadores[_i + 1]; // avança p p1
			}
		}
	}
}