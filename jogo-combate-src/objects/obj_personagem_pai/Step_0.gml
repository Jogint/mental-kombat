//Verifica se é vez do personagem
meu_turno = (global.jogador_atual == controlador);

//ignora esse erro abaixo, a var é criada por script
if (global.modo_jogo_atual == global.modos_jogo[2]) {
	tempo_turno = 120;
}

if (global.turno_iniciou) {
	if (global.modo_jogo_atual == global.modos_jogo[2] && !global.partida_acabou) {
		bot_ataca();
	} else if (meu_turno && global.jogador_atual != "" && !global.partida_acabou ) {
		if (global.errou_resposta) {
			global.timer_turno = 0; // força fim do turno
			global.errou_resposta = false;
		}
	
		if (global.timer_turno <= 0) {
			global.timer_turno = 0;
			if (!global.exibir_hab && pausa_animacao) {
				pausa_animacao = false;
				scr_toggle_hab(habilidades);
				if (controlador == global.tipos_jogadores[0]) scr_bot_escolhe_hab(habilidades);
			};
			bot_executou = false;
	    } else {
			pausa_animacao = true;
		}
	}
} else {
	if (meu_turno || global.modo_jogo_atual == global.modos_jogo[2]) {
		if (alterou_tempo != 1)show_debug_message("Tempo alterado para " + string(tempo_turno * alterou_tempo));
		scr_iniciar_timer_turno(tempo_turno * alterou_tempo);
		alterou_tempo = 1;
		
		bot_ataca();
		
		global.turno_iniciou = true;
	}
}