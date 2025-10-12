if (global.jogador_atual == "" && choosing_state == 0) {
    choosing_state = 1;
    var _total_flicker_time = 3; // 3 seconds
    var _flicker_rate_steps = 4; // Pisca 4x por segundo
    flicker_count = _total_flicker_time * (game_get_speed(gamespeed_fps) / _flicker_rate_steps);
    current_selection_name = global.perso_atuais[1].controlador; // primeiro nome
    alarm[0] = _flicker_rate_steps;
}

if (global.partida_acabou) {
	if (global.inst_perso_partida[1].hp_atual == 0) {
		global.quem_venceu = global.tipos_jogadores[1]; // vitoria do player1
	} else if (global.inst_perso_partida[0].hp_atual == 0) {
		if (global.modo_jogo_atual == global.modos_jogo[0]) {
			global.quem_venceu = global.tipos_jogadores[2]; // vitoria do player2
		} else {
			global.quem_venceu = global.tipos_jogadores[0]; // vitoria do bot
		}
	} else {
		show_error("Ninguém venceu. Hp de p1: " + string(global.inst_perso_partida[0].hp_atual) + " | Hp de p2: " + string(global.inst_perso_partida[1].hp_atual), true);
	}
}

if (global.partida_acabou && global.modo_jogo_atual == global.modos_jogo[0] && !player_pontuou) {
	scr_pontua_pvp();
	player_pontuou = true;
}