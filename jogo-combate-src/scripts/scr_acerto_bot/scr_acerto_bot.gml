/// @function scr_acerto_bot(inst_bot, chance, corte)
/// @description Determina se o bot acerta/age e executa a lógica correspondente.
/// @param {Id.Instance} inst_bot Instância do personagem do bot
/// @param {Real} chance Valor aleatório gerado
/// @param {Real} corte Valor máximo para ser considerado um acerto
function scr_acerto_bot(inst_bot, chance, corte) {
    if (global.partida_acabou) {
        return;
    }

    var _is_rapido = global.modo_jogo_atual == global.modos_jogo[2];
    var _e_turno_bot = global.jogador_atual == inst_bot.controlador;
    var _bot_acertou_chance = (chance <= corte);

    // O bot só age se for o turno dele OU se estiver no modo rápido
    if (!_is_rapido && !_e_turno_bot) {
        return;
    }

    var _tempo_resp = scr_tempo_acerto_bot();
    var _secs_restantes = round(global.timer_turno / game_get_speed(gamespeed_fps));
    
    // DECISÃO: O bot AVANÇA?
    if (_bot_acertou_chance || _is_rapido) {
        bot_processar_acerto(inst_bot);
        
        if (_is_rapido) {
            bot_gerenciar_modo_rapido(inst_bot);
        }
        
        // Condição para agendar o próximo ataque
        if (_secs_restantes > _tempo_resp || _is_rapido) {
            bot_agendar_proxima_acao(inst_bot, _tempo_resp, _is_rapido);
        }
        
    } else { // Erro do bot
        if (!_is_rapido) {
            bot_encerrar_turno(inst_bot);
        }
    }
}

/// @function bot_processar_acerto(inst_bot)
function bot_processar_acerto(inst_bot) {
    inst_bot.aumentar_energia();
	scr_proxima_pergunta(); // TODO: mover isso pra um lugar pós escolha de habilidade
}

/// @function bot_gerenciar_modo_rapido(inst_bot)
/// @description Aqui são as coisas únicas a acontecerem no modo rápido
function bot_gerenciar_modo_rapido(inst_bot) {
    scr_bot_escolhe_hab(inst_bot.habilidades);
}

/// @function bot_encerrar_turno(inst_bot)
function bot_encerrar_turno(inst_bot) {
    inst_bot.alarm[0] = -1;
    global.errou_resposta = true;
}

/// @function bot_agendar_proxima_acao(inst_bot, tempo_em_segundos, _is_rapido)
function bot_agendar_proxima_acao(inst_bot, tempo_em_segundos, _is_rapido) {
    show_debug_message("O bot executará novamente em " + string(tempo_em_segundos));
    var _frames = tempo_em_segundos * game_get_speed(gamespeed_fps);
	if (_is_rapido) _frames += game_get_speed(gamespeed_fps); // 1 segundo extra
	
    with (inst_bot) {
        alarm[0] = _frames;
    }
}