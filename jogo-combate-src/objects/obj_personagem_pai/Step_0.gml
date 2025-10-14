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
		if (controlador == global.tipos_jogadores[0]) {
			// código DO BOT, o código do player está em obj_opcao_resposta
			bot_ataca();
		}
	
		if (global.errou_resposta) {
			global.timer_turno = 0; // força fim do turno
			global.errou_resposta = false;
		}
	
		if (global.timer_turno <= 0) {
			global.timer_turno = 0;
			if (!global.exibir_hab) {
				// NÃO OUSE TIRAR ESSE BLOCO IF ABAIXO DAQUI
				// Ain mas pq não scr_toggle_hab(habilidades) direto?
				// PQ TÁ PEGANDO OS DADOS DO OPONENTE???? NÃO MEXE NO QUE TÁ QUIETO
				if (controlador == global.tipos_jogadores[1]) {
					scr_toggle_hab(global.inst_perso_partida[0].habilidades);
				} else {
					scr_toggle_hab(global.inst_perso_partida[1].habilidades);
				}
			
				if (controlador == global.tipos_jogadores[0]) scr_bot_escolhe_hab(self, habilidades);
			};
			bot_executou = false;
	    }
	}
} else {
	scr_iniciar_timer_turno(tempo_turno * alterou_tempo);
	alterou_tempo = 1;
	global.turno_iniciou = true;
}