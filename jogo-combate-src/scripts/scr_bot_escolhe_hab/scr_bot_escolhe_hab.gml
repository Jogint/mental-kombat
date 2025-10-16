/// @function scr_bot_escolhe_hab(arr)
/// @description Decide se o bot vai usar uma habilidade e qual delas
/// @param {Array<Asset.GMObject>} arr Array de habilidades do bot
function scr_bot_escolhe_hab(arr){
	var _chance_acerto = irandom_range(0, 1);
	var _hab_usada = 0; // hab 0 é a pular
	
	if (_chance_acerto) {
		for (var i = array_length(arr) - 1; i > 0; i--) {
			// TODO: Checar se funciona assim, sem o obj.energia_atual
			if (energia_atual >= arr[i].custo) {
				energia_atual -= arr[i].custo;
				_hab_usada = i;
				break;
			}
		}
	}
	
	ultima_hab_usada = arr[_hab_usada];
	alarm[1] = game_get_speed(gamespeed_fps);
}