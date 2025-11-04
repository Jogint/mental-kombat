/// @function scr_fim_partida(_onde)
/// @description Encerra o jogo e redireciona o jogador
/// @param {Real} _onde Index da próxima room
function scr_fim_partida(_onde){
	if (global.quem_venceu == global.tipos_jogadores[1]) {
		desbloqueou_trilha();
	}
	
	scr_definir_globais_var(_onde == 0);
	room_goto(_onde);
}

/// @function desbloqueou_trilha()
function desbloqueou_trilha() {
	if (global.modo_jogo_atual == global.modos_jogo[1]) {
		//show_debug_message("p1 venceu");
		if (!array_contains(global.perso_disponiveis, global.perso_atuais[1])) {
			array_push(global.perso_disponiveis, global.perso_atuais[1]);
			//show_debug_message("player ganha: " + string(global.perso_atuais[1]));
		}
		var _prox = array_get_index(global.todos_perso, global.perso_atuais[1]) + 1;
		if (_prox < array_length(global.todos_perso)) {
			if (!array_contains(global.inimigos_disponiveis, global.todos_perso[_prox])) {
				array_push(global.inimigos_disponiveis, global.todos_perso[_prox]);
				//show_debug_message("novo inimigo: " + string(global.todos_perso[_prox]));
			}
		}
	}
}