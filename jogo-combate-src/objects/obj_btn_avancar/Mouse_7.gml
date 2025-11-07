// ==================================================
/// @description Ação por room
// ==================================================

switch (room) {
	case rm_trilha:
		// ---------- Verifica se selecionou e avança ----------
		if (global.perso_atuais[1] != noone) room_goto_next();
		
	break;
	
	case rm_selecao_personagem:
		// ==================================================
		// Insere objeto no global.perso_atuais
		// ==================================================
		if (global.ultimo_selecionado != noone) {
			// ---------- Verifica qtd de perso selecionados ----------
			var _players_selecionados = (global.perso_atuais[0] != noone) + (global.perso_atuais[1] != noone);

			if (_players_selecionados < global.qtd_players_partida) {
			    scr_selecionou_perso(global.ultimo_selecionado);
			} else {
			    show_error("Número máximo de jogadores (" + string(global.qtd_players_partida) + ") já foi atingido.", true);
			}
			
			// ---------- Inicia a partida se tiverem 2 jogadores ----------
			if (global.perso_atuais[0] && global.perso_atuais[1]) {
				// O objeto abaixo chama a room_goto_next()
				instance_create_layer(x-1350, y-1100, "Transicao", obj_transicao);
			}
		}
	break;
	
	case rm_menu:
		// ==================================================
		// Gerencia a troca de modos ou dificuldade
		// ==================================================
		var _inst_botoes = [inst_troca_modo_e, inst_troca_modo_d, inst_troca_dif_e, inst_troca_dif_d];

		switch (id) {
		    // Troca Modo Esquerda
		    case _inst_botoes[0]:
		        global.modo_jogo_atual = scr_ciclo_iterar_array(global.modos_jogo, global.modo_jogo_atual, -1);
		    break;
        
		    // Troca Modo Direita
		    case _inst_botoes[1]:
		        global.modo_jogo_atual = scr_ciclo_iterar_array(global.modos_jogo, global.modo_jogo_atual, 1);
		    break;
        
		    // Troca dificuldade Esquerda
		    case _inst_botoes[2]:
		        global.dif_atual = scr_ciclo_iterar_array(global.niveis_dif, global.dif_atual, -1);
		    break;
        
		    // Troca dificuldade Direita
		    case _inst_botoes[3]:
		        global.dif_atual = scr_ciclo_iterar_array(global.niveis_dif, global.dif_atual, 1);
		    break;
		}
	break;
}