if (array_contains(global.perso_disponiveis, obj_relacionado)) {
	var _tamanho_quad = 64 * 5;
	scr_trocar_sprite(inst_perso_selecionado_p1, _tamanho_quad, _tamanho_quad, sprite_index)
	if (global.ultimo_selecionado != "") {
		global.ultimo_selecionado = "";
	}
	global.ultimo_selecionado = obj_relacionado;
}