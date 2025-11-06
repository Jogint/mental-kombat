/// @function scr_player_usa_hab(_player_index)
/// @description Gerencia tentativa de usar uma habilidade
/// @param {bool} _is_pulo Se o player vai pular a vez
/// habilidade é uma variavel do objeto que a chama, atribuida via scr_toggle_hab
function scr_player_usa_hab(_is_pulo) {
	var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
	var _player_index = array_get_index(global.tipos_jogadores, obj_gestao_rodada.jogador_atual) - 1; // bot é o index 0 (vira -1), o player não pode atacar
	if (_is_rapido) _player_index = 0;
	var _hab_index = array_get_index(global.hab_visiveis, id);
	
	if (_is_pulo) {
		global.inst_perso_partida[_player_index].estado_turno = ESTADOS_TURNO.EXIBINDO_HAB;
		return;
	}
	
	if (_player_index >= 0 || (_is_rapido && _hab_index < 3)){ // no modo rápido, player só acessa habilidades de 0 a 3
		atribui_efeito(_player_index, _is_rapido);
	}
}

/// @function atribui_efeito(_player_index, _is_rapido)
/// @description Verifica qual player está usando a habilidade, se ele pode e chama script de efeito
/// @param {Real} _player_index Qual dos players está selecionando a habilidade
function atribui_efeito(_player_index, _is_rapido) {
	var _energia_atual = global.inst_perso_partida[_player_index].energia_atual;
	
	if (_energia_atual >= habilidade.custo) {
		scr_ativa_animacao(global.inst_perso_partida[_player_index], habilidade);
	}
}