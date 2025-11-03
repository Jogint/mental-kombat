var _cor_principal = c_lime;

if (choosing_state == 1 || choosing_state == 2) {
	pop_up_aberto = true;
	
	var _customizacoes = {
		largura: 400,
		altura: 100,
		espaco_linhas: 10,
	}
	valida_estetica_popup(_customizacoes);

	scr_desenha_pop_up (["Escolhendo jogador a iniciar...", current_selection_name], _customizacoes);
	
} else if (global.partida_acabou) {
	pop_up_aberto = true;
	
	if (global.modo_jogo_atual != global.modos_jogo[0]) {
		scr_desenha_pop_up(["Fim da partida!", "", "Pressione 'R' para jogar novamente", "Pressione 'M' para voltar ao menu inicial"]);
	
	} else {
		scr_desenha_pop_up(["Fim da partida!", string(global.tipos_jogadores[1]) + ": " + string(global.pontuacao_pvp[0])+ " | " + string(global.tipos_jogadores[2]) + ": " + string(global.pontuacao_pvp[1]), "", "Pressione 'R' para jogar novamente", "Pressione 'M' para voltar ao menu inicial"]);
	}
	
} else {
	draw_set_color(_cor_principal);
	
	// Texto da pergunta
	if (global.jogador_atual != "") {
		var _texto_pergunta = "Pergunta para " + string(global.jogador_atual) + ": " + string(global.pergunta_atual.n1);
		
		switch (global.pergunta_atual.conta) {
			case global.operacoes[0]:
				_texto_pergunta += " + ";
				break;
			case global.operacoes[1]:
				_texto_pergunta += " - ";
				break;
			case global.operacoes[2]:
				_texto_pergunta += " * ";
				break;
			case global.operacoes[3]:
				_texto_pergunta += " / ";
				break;
			default:
				show_error("Operação matemática não identificada pelo switch, recebeu: " + global.pergunta_atual.conta, true)
		}
		
		_texto_pergunta += string(global.pergunta_atual.n2);
		draw_text(x, y, _texto_pergunta);
		
		var _tempo_restante = round(global.timer_turno / game_get_speed(gamespeed_fps))
		if (_tempo_restante < 10) draw_set_color(c_red); 
		draw_text(x, y - 20, "Tempo restante: " + string(_tempo_restante));
		draw_set_color(_cor_principal);

		// vida dos personagens PROVISÓRIO
		draw_text(100, 40, "vida: " + string(global.inst_perso_partida[0].hp_atual) + " | energia: " + string(global.inst_perso_partida[0].energia_atual));
		draw_text(1085, 40, "vida: " + string(global.inst_perso_partida[1].hp_atual) + " | energia: " + string(global.inst_perso_partida[1].energia_atual));
	}
}

scr_reset_draw();