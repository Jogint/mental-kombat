/// @function scr_iniciar_timer_turno(_secs)
/// @description Inicia a contagem do tempo do turno
/// @param {bool} _secs Tempo em segundos do turno atual
function scr_iniciar_timer_turno(_secs){
	obj_gestao_rodada.timer_turno = _secs * game_get_speed(gamespeed_fps);
	global.turno_iniciou = true;
}