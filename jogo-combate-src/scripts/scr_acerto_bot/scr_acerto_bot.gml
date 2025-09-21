/// chamado em obj_personagem_pai durante turno de bot
function scr_acerto_bot(obj, chance, corte){
	var _secs_por_dificuldade = [10, 6, 3]; // segundos antes de responder
	var _index_dificuldade = array_get_index(global.niveis_dificuldade, global.dificuldade_atual);
	var _secs_para_resposta = _secs_por_dificuldade[_index_dificuldade];
	var _secs_restantes = round(global.timer_turno / game_get_speed(gamespeed_fps));
	
	if (chance <= corte && // se ele bateu a % de acerto, manda bala
	global.jogador_atual == obj.controlador) { // se ainda for sua vez
		scr_proxima_pergunta();
		show_debug_message("tempo restante: " + string(_secs_restantes));
		if (_secs_restantes > _secs_para_resposta) { // se pode responder mais uma
			with (obj) {
				alarm[0] = _secs_para_resposta * game_get_speed(gamespeed_fps);
			}
		}
	} else {
		obj.alarm[0] = -1; // cancela o alarme
		global.errou_resposta = true; // encerra o turno
	}
}