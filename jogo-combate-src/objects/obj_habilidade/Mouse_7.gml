/// @function player_usa_hab(_player_index)
/// @description Verifica qual player está usando a habilidade, se ele pode e chama script de efeito
/// @param {Real} _player_index Qual dos players está selecionando a habilidade
function player_usa_hab(_player_index) {
	debug_habilidades(_player_index);
	
	if (global.inst_perso_partida[_player_index].energia_atual >= habilidade.custo) {
		global.inst_perso_partida[_player_index].energia_atual -= habilidade.custo;
		var _alvo = 1; if (_player_index == 1) _alvo--;
		scr_efeito_hab(global.inst_perso_partida[_player_index], global.inst_perso_partida[_alvo], habilidade);
	}
}

var _player_index = array_get_index(global.tipos_jogadores, global.jogador_atual) - 1;
var _is_modo_rapido = global.modo_jogo_atual == global.modos_jogo[2];

if (_player_index >= 0 || _is_modo_rapido) {
	if (!_is_modo_rapido){ 
		player_usa_hab(_player_index);
	} else {
		var _hab_index = array_get_index(global.hab_visiveis, id);
		if (_hab_index < 4) player_usa_hab(0); // player1 é indice 0 em inst_perso_partida
		// o player só pode acessar as habilidades de 0 a 3, o restante é do bot
	}
}

function debug_habilidades(_player_index) {
	show_debug_message("tentando habilidade " + habilidade.nome);
	show_debug_message("Pelo player " + string(_player_index));
	show_debug_message("Que possui energia " + string(global.inst_perso_partida[_player_index].energia_atual));
}