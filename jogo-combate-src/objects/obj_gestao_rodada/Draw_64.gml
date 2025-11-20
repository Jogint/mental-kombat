// ==================================================
/// @description Exibe pop ups
// ==================================================

var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
var _cor_principal = c_black;
var _customizacoes;
pop_up_aberto = true;

if (estado_sorteio == 1 || estado_sorteio == 2) {
// ==================================================
// EXIBE O SORTEADOR DE QUEM COMEÇA
// ==================================================
	
	_customizacoes = {
		largura: 400,
		altura: 100,
		espaco_linhas: 10,
	}
	
	valida_estetica_popup(_customizacoes);

	scr_desenha_pop_up (["Escolhendo jogador a iniciar...", nome_sorteado_atual], _customizacoes);
	
} else if (obj_gestao_rodada.partida_acabou) {
// ==================================================
// EXIBE A TELA DE FIM DE JOGO
// ==================================================

	_customizacoes = {
		cor_fundo: quem_venceu == global.tipos_jogadores[JOGADOR.BOT] ? c_maroon : c_green,
		largura: 400,
		altura: 100,
		espaco_linhas: 10,
		//deslocamento_y: -100,
	}
	
	valida_estetica_popup(_customizacoes);

	var _textos_fim = ["Fim da partida!"];
	
	if (global.modo_jogo_atual == global.modos_jogo[MODO.PVP]) { // pvp
		
		// esse monstro abaixo é o placar do pvp
		var _resultado_partida = string(global.tipos_jogadores[JOGADOR.P1]) + ": " + string(global.pontuacao_pvp[0]) + 
		" | " + string(global.tipos_jogadores[JOGADOR.P2]) + ": " + string(global.pontuacao_pvp[1]);

		array_push(_textos_fim,	_resultado_partida);
	}
	
	scr_desenha_pop_up(_textos_fim, _customizacoes);
	
} else {
// ==================================================
// EXIBIÇÃO DAS PERGUNTAS E QUEM JOGA
// ==================================================
	if (!_is_rapido && obj_gestao_rodada.exibir_hab || !layer_get_visible("Opcoes")) {
		exit; // sai se não tiver pergunta em exibição
	}

	// Texto da pergunta
	if (obj_gestao_rodada.jogador_atual != noone) {
		var _texto_turno = "Turno " + string(obj_gestao_rodada.qtd_turnos) + " - " + string(obj_gestao_rodada.jogador_atual);
		var _texto_pergunta = "Pergunta: " + string(obj_gestao_rodada.pergunta_atual.n1);
		
		switch (obj_gestao_rodada.pergunta_atual.conta) {
			case global.operacoes[OPERACOES.SOMA]:
				_texto_pergunta += " + ";
				break;
			case global.operacoes[OPERACOES.SUB]:
				_texto_pergunta += " - ";
				break;
			case global.operacoes[OPERACOES.MULT]:
				_texto_pergunta += " * ";
				break;
			case global.operacoes[OPERACOES.DIVI]:
				_texto_pergunta += " / ";
				break;
			default:
				show_error("Operação matemática não identificada pelo switch, recebeu: " + obj_gestao_rodada.pergunta_atual.conta, true)
		}
		
		_texto_pergunta += string(obj_gestao_rodada.pergunta_atual.n2);
		
		var _personalizacao = {
			cor_fundo: c_dkgray,
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