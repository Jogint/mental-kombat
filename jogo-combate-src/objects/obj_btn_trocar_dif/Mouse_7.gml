var _i = array_get_index(global.niveis_dificuldade, global.dificuldade_atual);

if (_i >= 0) {
	if (_i == array_length(global.niveis_dificuldade) - 1) {
		global.dificuldade_atual = global.niveis_dificuldade[0];
	} else {
		global.dificuldade_atual = global.niveis_dificuldade[_i + 1];
	}
} else {
	show_error("A dificuldade atual não é um modo válido em global.niveis_dificuldade. Recebeu: " + global.modo_jogo_atual, true)
}