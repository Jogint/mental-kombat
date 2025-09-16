function scr_trocar_turno(){
	var i = array_index_of(global.jogadores, global.jogador_atual);
	if (i == array_length(global.jogadores) - 1) {
		global.jogador_atual = global.jogadores[0];
	} else {
		global.jogador_atual = global.jogadores[i + 1];
	}
}