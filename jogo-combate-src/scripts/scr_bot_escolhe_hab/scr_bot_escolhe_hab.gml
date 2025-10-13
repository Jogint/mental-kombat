function scr_bot_escolhe_hab(obj, arr){
	var _chance_acerto = irandom_range(1, 2);
	var _hab_usada = 0; // hab 0 é a pular
	if (_chance_acerto < 2) {
		for (var i = array_length(arr) - 1; i > 0; i--) {
			//show_debug_message(string(obj.energia_atual) + " atual e " + string(arr[i].custo) + " precisa")
			if (obj.energia_atual >= arr[i].custo) {
				obj.energia_atual -= arr[i].custo;
				_hab_usada = i;
			}
		}
	}
	with (obj) {
		ultima_hab_usada = arr[_hab_usada];
		alarm[1] = game_get_speed(gamespeed_fps);
	}
}