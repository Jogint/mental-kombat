switch (room) {
	case rm_trilha:
		if (array_length(global.perso_atuais) == 1) room_goto_next();
	break;
	case rm_selecao_personagem:
		// TODO: Review visual caso global.ultimo_selecionado == ""
		if (global.ultimo_selecionado != "") {
			if (array_length(global.perso_atuais) == 1) {
				scr_selecionou_perso(global.ultimo_selecionado);
				global.perguntas_geradas = scr_gerar_perguntas();
				room_goto_next();
			} else if (array_length(global.perso_atuais) == 0) {
				scr_selecionou_perso(global.ultimo_selecionado);
			} else {
				show_error("Numero de jogadores excedeu o máximo de " + string(global.qtd_players_partida) + ". Obteve: " + string(array_length(global.perso_atuais)), true);
			}
		}
	break;
}