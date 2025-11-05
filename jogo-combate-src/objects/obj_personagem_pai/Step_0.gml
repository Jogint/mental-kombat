if (room == rm_selecao_personagem) exit; // Obj criado apenas para acessar variáveis

// ==================================================
// VARIAVEIS GERAIS DO CÓDIGO
// ==================================================
var _is_rapido = global.modo_jogo_atual == global.modos_jogo[2];
var _fator_escala;
meu_turno = (global.jogador_atual == controlador);

// ==================================================
// ALTERAÇÃO NA ESCALA DA SPRITE
// ==================================================
// ---------- DETERMINA MULTIPLICADOR ----------
if (meu_turno) {
	_fator_escala = 1.1;
	} else {
	_fator_escala = 0.9;
}

// ---------- REALIZA INVERSÃO BOT ----------
if (id == global.inst_perso_partida[1] && !inverteu_sprite) {
	inverteu_sprite = true;
    inversao_sinal = -1; 
    x += 64 * 5;
	image_xscale = escala_padrao[0] * _fator_escala * inversao_sinal;
	image_yscale = escala_padrao[0] * _fator_escala;
}

// ---------- ALTERNA TAMANHOS POR TURNO ----------
if (!alterou_tamanho && global.turno_iniciou) {
// ENTRA 1X POR TURNO	
	image_xscale = escala_padrao[0] * _fator_escala * inversao_sinal;
	image_yscale = escala_padrao[1] * _fator_escala; // Y não precisa de inversão
	alterou_tamanho = true;
}


if (global.turno_iniciou) {
	// ==================================================
	// GESTÃO DE TURNO EM ANDAMENTO
	// ==================================================
	if (meu_turno &&
	global.jogador_atual != noone &&
	!global.partida_acabou ) {
		
		// ---------- VERIFICA RESPOSTA ERRADA ----------
		if (global.errou_resposta) {
			global.timer_turno = 0; // força fim do turno
			global.errou_resposta = false;
		}
	
		// ---------- AÇÕES DE FIM DE TURNO ----------
		if (global.timer_turno <= 0) {
			global.timer_turno = 0; // não exibir menos que 0
			
			// ---------- EXIBE AS HABILIDADES ----------
			if (!global.exibir_hab && pos_turno) {
				pos_turno = false;
				scr_toggle_hab(habilidades);
				if (controlador == global.tipos_jogadores[0]) scr_bot_escolhe_hab(habilidades);
			};
			
			bot_executou = false; // permite ataque inicial no próximo turno
	    } else {
			pos_turno = true;
		}
	}
} else {
	// ==================================================
	// STARTERS DO TURNO
	// ==================================================
	// ---------- ALTERA TIMER MODO RÁPIDO ----------
	if (_is_rapido) {
		tempo_turno = 120;
	}
	
	// ---------- INICIA TIMER ----------
	if (meu_turno || _is_rapido) {
		scr_iniciar_timer_turno(tempo_turno * efeitos[0]);
		efeitos[0] = 1;
		
		bot_ataca();
		
		global.turno_iniciou = true;
	}
}

// ==================================================
// CONTADOR DA HABILIDADE ENERGÉTICO
// ==================================================
// efeitos[1]: mult_energetico
// efeitos[2]: contador_energetico
var _segs_efeito = 10;

if (meu_turno && efeitos[1] > 1) {
    // O efeito NÃO está ativo
	if (efeitos[2] <= 0) {
		efeitos[2] = _segs_efeito * game_get_speed(gamespeed_fps);
	} else {
        // 2. O efeito ESTÁ ativo
		efeitos[2]--;
	}
	
    // Verificação de Término
	if (efeitos[2] <= 0) {
        // Zera o multiplicador
		efeitos[1] = 1;
        // Garante que o contador fique zerado
		efeitos[2] = 0;
	}
}