// ==================================================
/// @description Vai pra seleção
// ==================================================

if (obj_gestao_rodada.partida_acabou) {
	
	var _room_desejada;
	
	if (global.modo_jogo_atual == global.modos_jogo[MODO.HIST]) {
		_room_desejada = 1;
	} else {
		_room_desejada = 2;
	}
	
	scr_fim_partida(_room_desejada);
	
}