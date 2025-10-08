//Verifica se é vez do personagem
meu_turno = (global.jogador_atual == controlador);

if (global.partida_acabou) {
	if (global.inst_perso_partida[0].hp_atual == 0) {
		global.quem_venceu = global.tipos_jogadores[1]; // vitoria do player
	} else if (global.inst_perso_partida[1].hp_atual == 0) {
		global.quem_venceu = global.tipos_jogadores[0]; // vitoria do bot
	} else {
		global.quem_venceu = "noone";
	}
	scr_fim_partida();
}

if (meu_turno && !global.partida_acabou) {
	if (!global.turno_iniciou) {
		scr_iniciar_timer_turno(tempo_turno); //ignora esse erro, a var é criada por script
		global.turno_iniciou = true;
	}
	
	global.timer_turno--;
	
	if (controlador == global.tipos_jogadores[0]) {
		// código DO BOT, o código do player está em obj_opcao_resposta
		// Acerto dos bots: acertar com base em % (fácil = 70% erro, médio = 50%, difícil = 30%)
		// Tempo de resposta: (fácil = 10 secs, médio = 6 secs, difícil = 3 secs)
		if (!bot_executou) {
			bot_executou = true;
			if (global.dificuldade_atual == global.niveis_dificuldade[2]) {
				alarm[0] = 3 * game_get_speed(gamespeed_fps);
			} else if (global.dificuldade_atual == global.niveis_dificuldade[1]) {
				alarm[0] = 6 * game_get_speed(gamespeed_fps);
			} else {
				alarm[0] = 10 * game_get_speed(gamespeed_fps);
			}
		}
	}
	
	if (global.errou_resposta) {
		global.timer_turno = 0; // força fim do turno
		global.errou_resposta = false;
	}
	
	if (global.timer_turno <= 0) {
		global.timer_turno = 0;
		if (!global.exibir_hab) {
			scr_toggle_hab(habilidades);
			if (controlador == global.tipos_jogadores[0]) scr_bot_escolhe_hab(self, habilidades);
		};
		bot_executou = false;
    }
}
