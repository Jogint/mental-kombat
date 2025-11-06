/// @function scr_acerto_bot(inst_bot, chance, corte)
/// @description Determina se o bot acerta/age e executa a lógica correspondente.
/// @param {Id.Instance} inst_bot Instância do personagem do bot
/// @param {Real} chance Valor aleatório gerado
/// @param {Real} corte Valor máximo para ser considerado um acerto
function scr_acerto_bot(inst_bot, chance, corte) {
    if (obj_gestao_rodada.partida_acabou) {
        return;
    }

    var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
    var _e_turno_bot = obj_gestao_rodada.jogador_atual == inst_bot.controlador;
    var _bot_acertou_chance = (chance <= corte);

    // O bot só age se for o turno dele OU se estiver no modo rápido
    if (!_is_rapido && !_e_turno_bot) {
        return;
    }

    var _tempo_resp = scr_tempo_acerto_bot();
    var _secs_restantes = round(obj_gestao_rodada.timer_turno / game_get_speed(gamespeed_fps));
    
    // DECISÃO: O bot AVANÇA?
    if (_bot_acertou_chance || _is_rapido) {
        bot_processar_acerto(inst_bot);
		apresenta_feedback(true);
        
        if (_is_rapido) {
            bot_gerenciar_modo_rapido(inst_bot);
        }
        
        // Condição para agendar o próximo ataque
        if (_secs_restantes > _tempo_resp || _is_rapido) {
            bot_agendar_proxima_acao(inst_bot, _tempo_resp, _is_rapido);
        }
        
    } else { // Erro do bot
		apresenta_feedback(false);
        if (!_is_rapido) {
            bot_encerrar_turno(inst_bot);
        }
    }
}

/// @function apresenta_feedback(_acertou)
/// @description chama função de exibir um circulo na seleção
function apresenta_feedback(_acertou) {
	var _respostas_array = []; 
	with (obj_opcao_resposta) {
	    array_push(_respostas_array, id);
	}
	
	array_shuffle(_respostas_array);

	if (_acertou) {
		for (var i = 0; i < array_length(_respostas_array); ++i) {
		    if (_respostas_array[i].is_certo) {
				show_debug_message("acertou: " + string(_respostas_array[i].numero));
				_respostas_array[i].opcao_selecionada(true, _acertou);
			}
		}
		return;
	}
	
	var _opcao_aleatoria = _respostas_array[0];
	if (_opcao_aleatoria.is_certo) _opcao_aleatoria = _respostas_array[1];
	show_debug_message("errou: " + string(_opcao_aleatoria.numero));
	_opcao_aleatoria.opcao_selecionada(true, _acertou);
}

/// @function bot_processar_acerto(inst_bot)
/// @description aumenta energia da instancia e passa a pergunta
function bot_processar_acerto(inst_bot) {
    inst_bot.aumentar_energia();
	scr_proxima_pergunta();
}

/// @function bot_gerenciar_modo_rapido(inst_bot)
/// @description Aqui são as coisas únicas a acontecerem no modo rápido
function bot_gerenciar_modo_rapido(inst_bot) {
    scr_bot_escolhe_hab(inst_bot.habilidades);
}

/// @function bot_encerrar_turno(inst_bot)
function bot_encerrar_turno(inst_bot) {
    inst_bot.alarm[0] = -1;
    obj_gestao_rodada.errou_resposta = true;
}

/// @function bot_agendar_proxima_acao(inst_bot, tempo_em_segundos, _is_rapido)
function bot_agendar_proxima_acao(inst_bot, tempo_em_segundos, _is_rapido) {
    //show_debug_message("O bot executará novamente em " + string(tempo_em_segundos));
    var _frames = tempo_em_segundos * game_get_speed(gamespeed_fps);
	if (_is_rapido) _frames += game_get_speed(gamespeed_fps); // 1 segundo extra
	
    with (inst_bot) {
        alarm[0] = _frames;
    }
}