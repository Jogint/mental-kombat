if (room == rm_selecao_personagem) exit; // Obj criado apenas para acessar variáveis

// ==================================================
// VARIAVEIS GERAIS DO CÓDIGO
// ==================================================
var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
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
			
			// Zera o multiplicador
			efeitos.mult_energia = 1;
			// Garante que o contador fique zerado
			efeitos.timer_energia = 0;
		}
	
		// ---------- AÇÕES DE FIM DE TURNO ----------
		if (global.timer_turno <= 0) {
			global.timer_turno = 0; // não exibir menos que 0
			
			// ---------- EXIBE AS HABILIDADES ----------
			if (!global.exibir_hab && pos_turno) {
				pos_turno = false;
				scr_toggle_hab(habilidades);
				if (controlador == global.tipos_jogadores[JOGADOR.BOT]) scr_bot_escolhe_hab(habilidades);
			};
			
			bot_executou = false; // permite ataque inicial no próximo turno
	    } else {
			pos_turno = true;
		}
	}
} else if (!global.partida_acabou) {
	// ==================================================
	// STARTERS DO TURNO
	// ==================================================
	// ---------- ALTERA TIMER MODO RÁPIDO ----------
	if (_is_rapido) {
		tempo_turno = 120;
	}
	
	// ---------- INICIA TIMER ----------
	if (meu_turno || _is_rapido) {
		scr_iniciar_timer_turno(tempo_turno * efeitos.mult_tempo);
		efeitos.mult_tempo = 1;
		
		bot_ataca();
		
		global.turno_iniciou = true;
	}
}

// ==================================================
// CONTADOR DA HABILIDADE ENERGÉTICO
// ==================================================
// efeitos.mult_energia: mult_energetico
// efeitos.timer_energia: contador_energetico
var _segs_efeito = 10;

if (meu_turno && efeitos.mult_energia > 1) {
    // O efeito NÃO está ativo
	if (efeitos.timer_energia <= 0) {
		efeitos.timer_energia = _segs_efeito * game_get_speed(gamespeed_fps);
	} else {
        // O efeito ESTÁ ativo
		efeitos.timer_energia--;
	}
	
    // Verificação de Término
	if (efeitos.timer_energia <= 0) {
        // Zera o multiplicador
		efeitos.mult_energia = 1;
        // Garante que o contador fique zerado
		efeitos.timer_energia = 0;
	}
}






//// --- Evento Step ---

//if (room == rm_selecao_personagem) exit;

//// ==================================================
//// VARIAVEIS GERAIS (EXECUTADO TODO FRAME)
//// ==================================================
//var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
//meu_turno = (global.jogador_atual == controlador);

//// ==================================================
//// ATUALIZAÇÃO DE ESCALA (EXECUTADO TODO FRAME)
//// ==================================================
//// A flag 'alterou_tamanho' é DESNECESSÁRIA!
//// O estado atual (meu_turno) já define a escala.

//var _fator_escala = meu_turno ? 1.1 : 0.9;

//image_xscale = escala_padrao[0] * _fator_escala * inversao_sinal;
//image_yscale = escala_padrao[1] * _fator_escala;

//// ==================================================
//// MÁQUINA DE ESTADOS DO TURNO
//// ==================================================
//// A flag global.turno_iniciou também se torna desnecessária.
//// O estado do *objeto* é quem manda.

//switch (estado_turno) {

//	// ---------- ESTADO 1: AGUARDANDO O TURNO ----------
//	case ESTADOS_TURNO.AGUARDANDO:
//		if (meu_turno) {
//			// É minha vez!
//			estado_turno = ESTADOS_TURNO.INICIANDO;
//		}
//	break;

//	// ---------- ESTADO 2: SETUP DE INÍCIO DE TURNO (Roda 1x) ----------
//	case ESTADOS_TURNO.INICIANDO:
//		// Esta é a lógica do seu antigo "ELSE" (onde global.turno_iniciou == false)

//		if (_is_rapido) {
//			tempo_turno = 120;
//		}
		
//		scr_iniciar_timer_turno(tempo_turno * efeitos.mult_tempo);
//		efeitos.mult_tempo = 1;
		
//		bot_ataca(); // (Seu bot_ataca() original)
		
//		// Limpa flags do turno anterior
//		bot_executou = false; 

//		// Transição IMEDIATA para o próximo estado
//		estado_turno = ESTADOS_TURNO.JOGANDO;
//	break;

//	// ---------- ESTADO 3: TURNO EM ANDAMENTO (Timer correndo) ----------
//	case ESTADOS_TURNO.JOGANDO:
//		// Esta é a lógica do seu 'if (global.turno_iniciou)'
		
//		if (global.partida_acabou) {
//			estado_turno = ESTADOS_TURNO.AGUARDANDO; // Garante que para tudo
//			break;
//		}

//		// ---------- VERIFICA RESPOSTA ERRADA ----------
//		if (global.errou_resposta) {
//			global.timer_turno = 0; // força fim do turno
//			global.errou_resposta = false;
//			// Zera o multiplicador energético
//			efeitos.mult_energia = 1;
//			efeitos.timer_energia = 0;
//		}
		
//		// ---------- GESTÃO DO EFEITO ENERGÉTICO (Timer do Efeito) ----------
//		// (Roda em paralelo com o timer do turno)
//		if (efeitos.mult_energia > 1) {
//			// O efeito NÃO está ativo
//			if (efeitos.timer_energia <= 0) {
//				efeitos.timer_energia = 10 * game_get_speed(gamespeed_fps);
//			} else {
//				// O efeito ESTÁ ativo
//				efeitos.timer_energia--;
//			}
			
//			// Verificação de Término
//			if (efeitos.timer_energia <= 0) {
//				efeitos.mult_energia = 1;
//				efeitos.timer_energia = 0;
//			}
//		}

//		// ---------- VERIFICA FIM DO TIMER DO TURNO ----------
//		if (global.timer_turno <= 0) {
//			global.timer_turno = 0; // Trava em 0
			
//			// Fim do tempo! Muda de estado.
//			estado_turno = ESTADOS_TURNO.ESCOLHA_HABILIDADE;
//		}
//	break;

//	// ---------- ESTADO 4: ESCOLHA DE HABILIDADE (Timer = 0) ----------
//	case ESTADOS_TURNO.ESCOLHA_HABILIDADE:
//		// Esta é a lógica do seu 'if (global.timer_turno <= 0)'
//		// A flag 'pos_turno' morreu! Não precisamos mais dela.
		
//		// ---------- EXIBE AS HABILIDADES (Roda 1x) ----------
//		if (!global.exibir_hab) { 
//			scr_toggle_hab(habilidades);
//			if (controlador == global.tipos_jogadores[JOGADOR.BOT]) {
//				scr_bot_escolhe_hab(habilidades);
//			}
//		}
		
//		// O jogo agora está "preso" aqui, esperando uma ação.
//		// Em algum outro lugar (ex: no script da habilidade quando ela é usada),
//		// você deve forçar a mudança de estado:
//		//
//		// Ex: no script scr_usar_habilidade_ataque()
//		// obj_personagem.estado_turno = ESTADOS_TURNO.FINALIZANDO;
		
//	break;

//	// ---------- ESTADO 5: LÓGICA DE FIM DE TURNO (Roda 1x) ----------
//	case ESTADOS_TURNO.FINALIZANDO:
//		// Este estado é novo, mas é crucial.
//		// É aqui que você faz a limpeza antes de passar o turno.
		
//		if (global.exibir_hab) {
//			scr_toggle_hab(habilidades); // Esconde a UI
//		}
		
//		// (Aqui você realmente passa o turno)
//		// scr_passar_turno_proximo_jogador(); 
		
//		// E finalmente, volta a aguardar
//		estado_turno = ESTADOS_TURNO.AGUARDANDO;
//	break;
//}