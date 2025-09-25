// chamado pelo obj_personagem_pai no fim do turno; TODO: mudar para após usar skill
function scr_trocar_turno(){
	if (!global.partida_acabou) {
		var _i = array_get_index(global.tipos_jogadores, global.jogador_atual);

		if (_i == array_length(global.tipos_jogadores) - 1) {
			global.jogador_atual = global.tipos_jogadores[0];
		} else {
			global.jogador_atual = global.tipos_jogadores[_i + 1];
		}
	}
}