/// @description Exibir escolha bot
for (var i = 0; i < array_length(global.hab_visiveis); i++) {
	var _hab_atual = global.hab_visiveis[i]
	if (_hab_atual.habilidade.nome == ultima_hab_usada.nome) {
		scr_trocar_sprite(_hab_atual, 415, 80, spr_teste_btn);
		break;
	}
}
alarm[2] = game_get_speed(gamespeed_fps);