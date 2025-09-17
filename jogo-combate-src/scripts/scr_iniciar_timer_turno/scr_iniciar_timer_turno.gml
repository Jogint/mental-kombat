function scr_iniciar_timer_turno(secs){
	global.timer_turno = secs * game_get_speed(gamespeed_fps);
	global.turno_iniciou = true;
}