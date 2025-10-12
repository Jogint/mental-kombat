var _tamanho_quad = 64 * 5;

function muda_img (_tamanho_quad) {
	if (global.perso_atuais[0] == noone) {
		scr_trocar_sprite(inst_perso_selecionado_p1, _tamanho_quad, _tamanho_quad, sprite_index);
	} else {
		scr_trocar_sprite(inst_perso_selecionado_p2, _tamanho_quad, _tamanho_quad, sprite_index);
	}
	global.ultimo_selecionado = obj_relacionado;
}

if (is_multiplayer) {
	muda_img(_tamanho_quad);
} else {
	if (array_contains(global.perso_disponiveis, obj_relacionado)) {
		muda_img(_tamanho_quad);
	}
}