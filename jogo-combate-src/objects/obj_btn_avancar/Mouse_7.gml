switch (room) {
	case rm_trilha:
		if (global.perso_atuais[1] != noone) room_goto_next();
	break;
	case rm_selecao_personagem:
		if (global.ultimo_selecionado != noone) {
			var _players_selecionados = (global.perso_atuais[0] != noone) + (global.perso_atuais[1] != noone);

			if (_players_selecionados < global.qtd_players_partida) {
			    scr_selecionou_perso(global.ultimo_selecionado);
			} else {
			    show_error("Número máximo de jogadores (" + string(global.qtd_players_partida) + ") já foi atingido.", true);
			}
			
			// Inicia se ambos estiverem selecionados
			if (global.perso_atuais[0] != noone && global.perso_atuais[1] != noone) {
				global.perguntas_geradas = scr_gerar_perguntas();
				room_goto_next();
			}
		}
	break;
}