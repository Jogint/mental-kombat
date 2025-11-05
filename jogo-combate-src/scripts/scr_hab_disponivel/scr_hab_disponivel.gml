/// @function scr_hab_disponivel()
/// @description Verifica a possibilidade do player usar essa habilidade e reduz a opacidade se não
/// @param {bool} _is_logo Define se é o ícone da habilidade, e não o fundo
// "alterou é uma variável" dentro dos objetos que chamam essa função
function scr_hab_disponivel(_is_logo) {
	var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
	var _hab_index = array_get_index(global.hab_visiveis, id);
	
	if (!alterou) {
		// definição de jogador do modo rápido
		var _player_atual = global.inst_perso_partida[0];
			
		if (_hab_index >= 3) { // 3 habilidades por player
			_player_atual = global.inst_perso_partida[1];
		}
		
		// definição de jogador dos outros modos
		if (!_is_rapido) {
			var _player_index = abs(array_get_index(global.tipos_jogadores, global.jogador_atual) - 1);
			_player_atual = global.inst_perso_partida[_player_index];
			alterou = true; // depois da alteração, a instancia é deletada, exceto rapido
			// no modo rapido, ele precisa estar frequentemente alterando o objeto
		}
		
		if (habilidade.custo <= _player_atual.energia_atual) {
			// se for logo, só aumenta opacidade
			if (_is_logo) {
				image_alpha = 1;
				return;
			}
			
			// se for fundo, altera a sprite
			var _i = array_get_index(global.fundo_hab_visiveis, self);
			var _tam = scr_define_tamanho_hab(_i, false, 80, 300, true); // MESMO DE SCR_TOGGLE_HAB
		
			scr_trocar_sprite(self, _tam[2], _tam[3], spr_hab_disponivel);
		}
	}
}