// ==================================================
// ENCERRA A EXECUÇÃO
// ==================================================
if (room == rm_selecao_personagem || obj_gestao_rodada.partida_acabou) exit;

// ==================================================
// VARIAVEIS GERAIS
// ==================================================
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
		    x += global.tamanhos.perso_maior;
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
		
		if (meu_turno || is_rapido) {
			altera_escala_sprite(dados_escala.maior);
			estado_turno = ESTADOS_TURNO.INICIANDO;
		}
	break;

	// ==================================================
	// ESTADO 2: SETUP DE INÍCIO DE TURNO
	// ==================================================
	case ESTADOS_TURNO.INICIANDO:
		// FALLBACK: REMOVER APÓS ACHAR A CAUSA
		if (obj_gestao_rodada.exibir_hab) {
				scr_toggle_hab();
			}
		if (is_rapido) {
			tempo_turno = tempo_rapido;
		}
		
		scr_iniciar_timer_turno(tempo_turno * efeitos.mult_tempo);
		efeitos.mult_tempo = 1;
		scr_proxima_pergunta(); // TODO: tirar isso
	
		set_bot_responde(id);

		estado_turno = ESTADOS_TURNO.JOGANDO;
	break;

	// ==================================================
	// ESTADO 3: TURNO EM ANDAMENTO
	// ==================================================
	case ESTADOS_TURNO.JOGANDO:
		// ---------- VERIFICA RESPOSTA ERRADA ----------
		if (obj_gestao_rodada.errou_resposta && !is_rapido) {
			obj_gestao_rodada.timer_turno = 0; // força fim do turno // REMOVE: atribuição indevida
			obj_gestao_rodada.errou_resposta = false; // REMOVE: atribuição indevida
			
			// ---------- Zera o multiplicador energético ----------
			//show_debug_message("mult energia " + string(efeitos.mult_energia));
			efeitos.mult_energia = 1;
			efeitos.timer_energia = 0;
		}

		// ---------- VERIFICA FIM DO TIMER DO TURNO ----------
		if (obj_gestao_rodada.timer_turno <= 0 && !treme_resposta_errada) {
			obj_gestao_rodada.timer_turno = 0; // REMOVE: atribuição indevida
			estado_turno = ESTADOS_TURNO.ESCOLHA_HAB;
		}
	break;
	
	// ==================================================
	// ESTADO 4: ESCOLHA DE HABILIDADE
	// ==================================================
	case ESTADOS_TURNO.ESCOLHA_HAB:
	
		if (instance_exists(obj_opcao_resposta)) instance_deactivate_object(obj_opcao_resposta);
		
		// ---------- EXIBE AS HABILIDADES ----------
		if (!obj_gestao_rodada.exibir_hab) { 
			scr_toggle_hab(habilidades);
			
			if (controlador == global.tipos_jogadores[JOGADOR.BOT]) {
				ultima_hab_usada = scr_bot_escolhe_hab(id, oponente);
				alarm[1] = game_get_speed(gamespeed_fps);
			}
		}
		
	break;
	
	// ==================================================
	// ESTADO 5: EXECUTANDO ANIMAÇÃO
	// ==================================================
	case ESTADOS_TURNO.EXIBINDO_HAB:
		
		if (!is_rapido) {
			
			// ---------- OCULTA AS HABILIDADES ----------
			if (obj_gestao_rodada.exibir_hab) {
				scr_toggle_hab();
			}
		
			if (instance_exists(obj_pular_turno)) instance_destroy(obj_pular_turno);
		
			if (is_string(ultima_hab_usada) || hab_em_uso == noone) {
				estado_turno = ESTADOS_TURNO.FINALIZANDO;
			}
			
		} else {
			estado_turno = ESTADOS_TURNO.JOGANDO;
		}
		
	break;

	// ==================================================
	// ESTADO 6: LÓGICA DE FIM DE TURNO
	// ==================================================
	case ESTADOS_TURNO.FINALIZANDO:
		
		ultima_hab_usada = {};
		hab_em_uso = noone;
		
		altera_escala_sprite(dados_escala.menor);
		
		layer_set_visible("Opcoes", true);
		obj_gestao_rodada.jogador_atual = oponente.controlador;
		scr_proxima_pergunta();
	
		global.turno_iniciou = false;
		
		instance_activate_object(obj_opcao_resposta);
		
		estado_turno = ESTADOS_TURNO.AGUARDANDO;
	break;
}