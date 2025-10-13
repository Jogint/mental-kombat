///@description Chamado em obj_personagem_pai durante turno de bot
///@param obj: object. Personagem do bot
///@param chance: int. Valor definido pelo i_random_range
///@param corte: int. Valor máximo para ser considerado um acerto
function scr_acerto_bot(obj, chance, corte){
	if (!global.partida_acabou) {
		var _tempo_para_responder = scr_tempo_acerto_bot(); // segundos antes de responder
		var _secs_restantes = round(global.timer_turno / game_get_speed(gamespeed_fps));
	
		if ((chance <= corte && // se ele bateu a % de acerto, manda bala
		global.jogador_atual == obj.controlador) || // se ainda for sua vez
		global.modo_jogo_atual == global.modos_jogo[2]) {
			global.inst_perso_partida[1].aumentar_energia(); // pontua pelo acerto
			scr_proxima_pergunta();
			if (global.modo_jogo_atual == global.modos_jogo[2]) { // escolhe uma habilidade a cada acerto
				scr_bot_escolhe_hab(global.inst_perso_partida[1], global.inst_perso_partida[1].habilidades);
			}
			if (_secs_restantes > _tempo_para_responder) { // se pode responder mais uma
				with (obj) {
					alarm[0] = _tempo_para_responder * game_get_speed(gamespeed_fps);
				}
			}
		} else {
			obj.alarm[0] = -1; // cancela o alarme
			global.errou_resposta = true; // encerra o turno
		}
	}
}