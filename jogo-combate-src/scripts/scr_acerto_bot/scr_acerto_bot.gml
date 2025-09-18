function scr_acerto_bot(obj, chance, corte){
	var _secs_por_dificuldade = [3, 6, 10]
	if (chance <= corte && global.timer_turno >= _secs_por_dificuldade[array_get_index(global.dificuldades, global.dificuldade)] && global.jogador_atual == obj.controlador) {
		scr_proxima_pergunta();
		with (obj) {
			if (global.dificuldade == global.dificuldades[2]) {
				alarm[0] = 3 * game_get_speed(gamespeed_fps);
			} else if (global.dificuldade == global.dificuldades[1]) {
				alarm[0] = 6 * game_get_speed(gamespeed_fps);
			} else {
			    alarm[0] = 10 * game_get_speed(gamespeed_fps);
			}
		}
	} else {
		obj.alarm[0] = -1;
		global.errou_resposta = true;
	}
}