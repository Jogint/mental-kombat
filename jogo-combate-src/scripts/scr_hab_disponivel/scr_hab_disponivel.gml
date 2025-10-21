/// @function scr_hab_disponivel()
/// @description Verifica a possibilidade do player usar essa habilidade e reduz a opacidade se não
/// @param {bool} _is_logo Define se é o ícone da habilidade, e não o fundo
// "alterou é uma variável" dentro dos objetos que chamam essa função
function scr_hab_disponivel(_is_logo) {
	// TODO: fazer isso também para o modo rápido
	if (!alterou && global.modo_jogo_atual != global.modos_jogo[2]) {
		var _player_index = abs(array_get_index(global.tipos_jogadores, global.jogador_atual) - 1);
		var _player_atual = global.inst_perso_partida[_player_index];
		
		if (habilidade.custo <= _player_atual.energia_atual) {
			if (_is_logo) {
				image_alpha = 1;
				return;
			}
			
			// TODO: Transformar todo num que repete em global (array de tamanhos?)
			var _i = array_get_index(global.fundo_hab_visiveis, self);
			var _tam = scr_define_tamanho_hab(_i, false, 80, 300, true); // MESMO DE SCR_TOGGLE_HAB
			
			scr_trocar_sprite(self, _tam[2], _tam[3], spr_hab_disponivel);
		}
		
		alterou = true;
	}
}