/// @function scr_bot_escolhe_hab(arr)
/// @description Decide se o bot vai usar uma habilidade e qual delas
/// @param {Array<Asset.GMObject>} arr Array de habilidades do bot
function scr_bot_escolhe_hab(arr){
	var _chance_acerto = irandom_range(0, 1);
	var _hab_usada = -1;
	
	if (_chance_acerto) {
		for (var i = array_length(arr) - 1; i >= 0; i--) {
			if (energia_atual >= arr[i].custo) {
				_hab_usada = i;
				break;
			}
		}
	}
	
	if (_hab_usada < 0) {
		ultima_hab_usada = global.tipos_hab[0];
		alarm[2] = game_get_speed(gamespeed_fps);
		return;
	}
	
	ultima_hab_usada = arr[_hab_usada];
	
	if (global.modo_jogo_atual == global.modos_jogo[2]) {
		return;
	}
	
	alarm[1] = game_get_speed(gamespeed_fps);
}