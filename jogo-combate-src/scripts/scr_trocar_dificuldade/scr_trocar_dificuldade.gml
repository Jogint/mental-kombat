function scr_trocar_dificuldade(dificuldade_desejada){
	if (array_contains(global.dificuldades, dificuldade_desejada)) {
		global.dificuldade = dificuldade_desejada;
	} else {
		show_error(string(dificuldade_desejada) + "não é uma dificuldade válida. Verifique o scr_definir_globais para as opções", true);
	}
}