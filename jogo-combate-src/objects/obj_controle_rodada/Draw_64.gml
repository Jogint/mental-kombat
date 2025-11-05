var _is_rapido = global.modo_jogo_atual == global.modos_jogo[2];
var _cor_principal = c_black;
pop_up_aberto = true;

if (estado_sorteio == 1 || estado_sorteio == 2) {
// ==================================================
// EXIBE O SORTEADOR DE QUEM COMEÇA
// ==================================================
	
	var _customizacoes = {
		largura: 400,
		altura: 100,
		espaco_linhas: 10,
	}
	valida_estetica_popup(_customizacoes);

	scr_desenha_pop_up (["Escolhendo jogador a iniciar...", nome_sorteado_atual], _customizacoes);
	
} else if (global.partida_acabou) {
// ==================================================
// EXIBE A TELA DE FIM DE JOGO
// ==================================================
	var _textos_fim = [];
	
	if (global.modo_jogo_atual == global.modos_jogo[0]) { // pvp
		
		// esse monstro abaixo é o placar do pvp
		var _resultado_partida = string(global.tipos_jogadores[1]) + ": " + string(global.pontuacao_pvp[0]) + 
        " | " + string(global.tipos_jogadores[2]) + ": " + string(global.pontuacao_pvp[1]);

		_textos_fim = [
		    _resultado_partida,
		    "",
		    "Pressione 'R' para jogar novamente"
		];
		
	} else if (global.modo_jogo_atual == global.modos_jogo[1]) { // historia
		
		_textos_fim = [
			"", 
			"Pressione 'R' para escolher o próximo oponente"
		];
	} else { // default (rapido)
		
		_textos_fim = [
			"", 
			"Pressione 'R' para jogar novamente"
		];
	}
	
	array_insert(_textos_fim, 0, "Fim da partida!")
	array_push(_textos_fim, "Pressione 'M' para voltar ao menu inicial")
	scr_desenha_pop_up(_textos_fim);
	
} else {
// ==================================================
// EXIBIÇÃO DAS PERGUNTAS E QUEM JOGA
// ==================================================
	if (!_is_rapido && global.exibir_hab || !layer_get_visible("Opcoes")) {
		exit; // sai se não tiver pergunta em exibição
	}

	// Texto da pergunta
	if (global.jogador_atual != "") {
		var _texto_turno = "Turno " + string(global.qtd_turnos) + " - " + string(global.jogador_atual);
		var _texto_pergunta = "Pergunta: " + string(global.pergunta_atual.n1);
		
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
		
		var _personalizacao = {
			fundo_cor: c_dkgray,
			texto_cores: [c_white, c_white],
			altura: 80,
			largura: 350,
			deslocamento_y: -220,
			espaco_linhas: 10,
		}

		var _string_dados = [_texto_turno, _texto_pergunta];
		
		scr_desenha_pop_up(_string_dados, _personalizacao);
	}
}

scr_reset_draw();