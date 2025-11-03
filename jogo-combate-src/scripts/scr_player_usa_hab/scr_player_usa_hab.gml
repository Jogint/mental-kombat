/// @function scr_player_usa_hab(_player_index)
/// @description Gerencia tentativa de usar uma habilidade
/// @param {bool} _is_pulo Se o player vai pular a vez
/// habilidade é uma variavel do objeto que a chama, atribuida via scr_toggle_hab
function scr_player_usa_hab(_is_pulo) {
	var _is_rapido = global.modo_jogo_atual == global.modos_jogo[2];
	var _player_index = array_get_index(global.tipos_jogadores, global.jogador_atual) - 1; // bot é o index 0 (vira -1), o player não pode atacar
	if (_is_rapido) _player_index = 0;
	var _alvo = 1; if (_player_index == 1) _alvo--;
	var _hab_index = array_get_index(global.hab_visiveis, id);
	
	if (_is_pulo) {
		scr_efeito_hab(global.inst_perso_partida[_player_index], global.inst_perso_partida[_alvo], global.tipos_hab[0]);
		return;
	}
	
	if (_player_index >= 0 || (_is_rapido && _hab_index < 3)){ // no modo rápido, player só acessa habilidades de 0 a 3
		atribui_efeito(_player_index, _alvo, _is_rapido);
	}
}

/// @function atribui_efeito(_player_index, _alvo, _is_rapido)
/// @description Verifica qual player está usando a habilidade, se ele pode e chama script de efeito
/// @param {Real} _player_index Qual dos players está selecionando a habilidade
/// @param {Real} _alvo Qual dos players está sofrendo a habilidade
function atribui_efeito(_player_index, _alvo, _is_rapido) {
	var _energia_atual = global.inst_perso_partida[_player_index].energia_atual;
	
	if (_energia_atual >= habilidade.custo) {
		scr_efeito_hab(global.inst_perso_partida[_player_index], global.inst_perso_partida[_alvo], habilidade);
	}
}