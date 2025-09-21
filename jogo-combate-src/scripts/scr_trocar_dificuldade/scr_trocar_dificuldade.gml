/// Chamada em rm_menu, num botão de alterar dificuldade
function scr_trocar_dificuldade(dificuldade_desejada){
	if (array_contains(global.niveis_dificuldade, dificuldade_desejada)) {
		global.dificuldade_atual = dificuldade_desejada;
		global.perguntas_geradas = scr_gerar_perguntas();
	} else {
		show_error(string(dificuldade_desejada) + "não é uma dificuldade válida. Verifique o scr_definir_globais para as opções", true);
	}
}