/// @description Vai para seleção
// Você pode escrever seu código neste editor

if (global.partida_acabou) {
	var _room_desejada = -1;
	if (global.modo_jogo_atual == global.modos_jogo[MODO.HIST]) {
		_room_desejada = 1;
	} else {
		_room_desejada = 2;
	}
	scr_fim_partida(_room_desejada);
}