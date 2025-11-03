var _i = array_get_index(global.modos_jogo, global.modo_jogo_atual);

if (_i >= 0) {
	if (_i == array_length(global.modos_jogo) - 1 || global.modo_jogo_atual == "") {
		global.modo_jogo_atual = global.modos_jogo[0];
	} else {
		global.modo_jogo_atual = global.modos_jogo[_i + 1];
		
		if (global.modo_jogo_atual == "") {
			global.modo_jogo_atual = global.modos_jogo[0];
		}
	}
} else {
	show_error("O modo de jogo atual não é um modo válido em global.modos_jogo. Recebeu: " + global.modo_jogo_atual, true)
}