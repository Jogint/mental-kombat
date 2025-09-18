//Verifica se é vez do personagem
meu_turno = (global.jogador_atual == controlador);

if (meu_turno) {
	if (!global.turno_iniciou) {
		scr_iniciar_timer_turno(tempo_turno); //ignora esse erro, a var é criada por script
		global.turno_iniciou = true;
	}
	
	global.timer_turno--;
	
	if (controlador != global.jogadores[0]) {
		// código se for player
		
	} else {
		// código se for bot
		// Acerto dos bots: acertar com base em % (fácil = 70% erro, médio = 50%, difícil = 30%)
		// Tempo de resposta: (fácil = 10 secs, médio = 6 secs, difícil = 3 secs)
		if (!bot_executou) {
			bot_executou = true;
			if (global.dificuldade == global.dificuldades[2]) {
				alarm[0] = 3 * game_get_speed(gamespeed_fps);
			} else if (global.dificuldade == global.dificuldades[1]) {
				alarm[0] = 6 * game_get_speed(gamespeed_fps);
			} else {
				alarm[0] = 10 * game_get_speed(gamespeed_fps);
			}
		}
		
		
		
		// O quadro de opções ainda deve ser visível para o player, mas numa cor acinzentada
		// indicando que ainda não é o turno dele
		
	}
	
	if (global.errou_resposta) {
		global.timer_turno = 0; // força fim do turno
		global.errou_resposta = false;
	}
	
	if (global.timer_turno <= 0) {
        // mandar para tela de skills antes de trocar turno, pra atacar o oponente
		bot_executou = false;
		scr_trocar_turno();
		scr_proxima_pergunta();
		show_debug_message("trocou turno para: " + global.jogador_atual);
		global.turno_iniciou = false;
    }
}
