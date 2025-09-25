function scr_fim_partida(){
	// Desbloqueia um novo personagem e avança na trilha se venceu a partida
	show_debug_message("vencedor: " + string(global.quem_venceu));
	if (global.quem_venceu == global.tipos_jogadores[1]) {
		show_debug_message("players: " + string(global.perso_disponiveis));
		show_debug_message("inimigos: " + string(global.inimigos_disponiveis));
		
		if (!array_contains(global.perso_disponiveis, global.perso_atuais[0])) {
			array_push(global.perso_disponiveis, global.perso_atuais[0]);
			show_debug_message("player ganha: " + string(global.perso_atuais[0]));
		}
		var _prox = array_get_index(global.todos_perso, global.perso_atuais[0]) + 1;
		if (!array_contains(global.inimigos_disponiveis, global.todos_perso[_prox])) {
			array_push(global.inimigos_disponiveis, global.todos_perso[_prox]);
			show_debug_message("player luta: " + string(global.todos_perso[_prox]));
		}
	}
	
	// resetar globais
	global.jogador_atual = global.tipos_jogadores[1];
	global.perso_atuais = [];
	global.inst_perso_partida = [];
	global.perguntas_geradas = scr_gerar_perguntas();
	global.pergunta_atual = global.perguntas_geradas[0];
	global.partida_acabou = true;
	global.timer_turno = 0;
	global.turno_iniciou = false;
	global.errou_resposta = false;
	global.exibir_hab = false;
	global.hab_visiveis = [];
	
	room_goto(0); //volta para o menu (pode ser voltar para trilha)
}