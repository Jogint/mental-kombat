//Verifica se é vez do personagem
meu_turno = (global.jogador_atual == controlador);
var _is_rapido = global.modo_jogo_atual == global.modos_jogo[2];

if (global.turno_iniciou) {
	if (_is_rapido && !global.partida_acabou) {
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
	//ignora esse erro abaixo, a var é criada por script
	if (_is_rapido) {
		tempo_turno = 120;
	}
	
	if (meu_turno || _is_rapido) {
		scr_iniciar_timer_turno(tempo_turno * efeitos[0]);
		efeitos[0] = 1;
		
		bot_ataca();
		
		global.turno_iniciou = true;
	}
}