// --- Evento Step ---

// ==================================================
// ENCERRA A EXECUÇÃO
// ==================================================
if (room == rm_selecao_personagem || obj_gestao_rodada.partida_acabou) exit;

// ==================================================
// VARIAVEIS GERAIS
// ==================================================
var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
meu_turno = (obj_gestao_rodada.jogador_atual == controlador);

// ---------- MÁQUINA DE ESTADOS ----------
switch (estado_turno) {
	
	// ==================================================
	// ESTADO 0: SETUPS EXECUTADOS 1X POR PARTIDA
	// ==================================================
	case ESTADOS_TURNO.SETUP:
		// ---------- INVERTE A SPRITE DO P2 ----------
		if (id == global.inst_perso_partida[1] && !inverteu_sprite) {
			inverteu_sprite = true;
			inversao_sinal = -1; 
		    x += global.tamanhos.personagem;
		}
		
		// ---------- ALTERA A ESCALA ----------
		altera_escala_sprite(dados_escala.menor);
		
		// ---------- RECONHECE INSTANCIA INIMIGA ----------
		if (global.inst_perso_partida[0] == id) {
		    oponente = global.inst_perso_partida[1];
		} else {
		    oponente = global.inst_perso_partida[0];
		}
		
		estado_turno = ESTADOS_TURNO.AGUARDANDO;
	break;

	// ==================================================
	// ESTADO 1: AGUARDANDO O TURNO
	// ==================================================
	case ESTADOS_TURNO.AGUARDANDO:
		altera_escala_sprite(dados_escala.menor);
		
		if (meu_turno) {
			altera_escala_sprite(dados_escala.maior);
			estado_turno = ESTADOS_TURNO.INICIANDO;
		}
	break;

	// ==================================================
	// ESTADO 2: SETUP DE INÍCIO DE TURNO
	// ==================================================
	case ESTADOS_TURNO.INICIANDO:
		if (_is_rapido) {
			tempo_turno = tempo_rapido;
		}
		
		scr_iniciar_timer_turno(tempo_turno * efeitos.mult_tempo);
		efeitos.mult_tempo = 1;
		
		bot_ataca();
		
		// Limpa flags do turno anterior
		bot_executou = false; 

		estado_turno = ESTADOS_TURNO.JOGANDO;
	break;

	// ==================================================
	// ESTADO 3: TURNO EM ANDAMENTO
	// ==================================================
	case ESTADOS_TURNO.JOGANDO:
		// ---------- VERIFICA RESPOSTA ERRADA ----------
		if (obj_gestao_rodada.errou_resposta) {
			obj_gestao_rodada.timer_turno = 0; // força fim do turno
			obj_gestao_rodada.errou_resposta = false;
			// Zera o multiplicador energético
			efeitos.mult_energia = 1;
			efeitos.timer_energia = 0;
		}
		
		// ---------- GESTÃO DO EFEITO ENERGÉTICO ----------
		if (efeitos.mult_energia > 1) {
			// O efeito NÃO está ativo
			if (efeitos.timer_energia <= 0) {
				efeitos.timer_energia = segs_por_habilidade * game_get_speed(gamespeed_fps);
			} else {
				// O efeito ESTÁ ativo
				efeitos.timer_energia--;
			}
			
			// Verificação de Término
			if (efeitos.timer_energia <= 0) {
				efeitos.mult_energia = 1;
				efeitos.timer_energia = 0;
			}
		}

		// ---------- VERIFICA FIM DO TIMER DO TURNO ----------
		if (obj_gestao_rodada.timer_turno <= 0 && !retornou_erro) {
			// retornou erro é alterada como verdadeira ou falsa em scr_acerto_bot e obj_opcao_resposta
			// e é responsável por animação tremendo ao errar a resposta
			obj_gestao_rodada.timer_turno = 0; // Trava em 0
			estado_turno = ESTADOS_TURNO.ESCOLHA_HAB;
		}
	break;
	
	// ==================================================
	// ESTADO 4: ESCOLHA DE HABILIDADE
	// ==================================================
	case ESTADOS_TURNO.ESCOLHA_HAB:
		
		// ---------- EXIBE AS HABILIDADES ----------
		if (!obj_gestao_rodada.exibir_hab) { 
			scr_toggle_hab(habilidades);
			if (controlador == global.tipos_jogadores[JOGADOR.BOT]) {
				scr_bot_escolhe_hab(habilidades);
			}
		}
		
	break;
	
	// ==================================================
	// ESTADO 5: EXECUTANDO ANIMAÇÃO
	// ==================================================
	case ESTADOS_TURNO.EXIBINDO_HAB:
		
		// ---------- OCULTA AS HABILIDADES ----------
		if (obj_gestao_rodada.exibir_hab) { 
			scr_toggle_hab([]);
		}
		
		// ---------- VERIFICA ANIMAÇÃO HABILIDADES ----------
		// INFO: este NÃO É o método principaL pra passar o estado, só verificador para não interromper a execução do jogo
		if (animacao_em_uso == noone) {
		    show_debug_message("AVISO: Não há animação sendo executada."); // TODO: Alterar animações por personagem assim que terminar de desenhá-las
		    estado_turno = ESTADOS_TURNO.FINALIZANDO;
		}
		
		// Estado alterado no evento animation end ou scr_ativa_animacao (em caso de pulo)
	break;

	// ==================================================
	// ESTADO 6: LÓGICA DE FIM DE TURNO
	// ==================================================
	case ESTADOS_TURNO.FINALIZANDO:
		efeito_hab(self, oponente, animacao_em_uso);
		
		altera_escala_sprite(dados_escala.menor);
		
		scr_encerrar_turno()
		
		estado_turno = ESTADOS_TURNO.AGUARDANDO;
	break;
}