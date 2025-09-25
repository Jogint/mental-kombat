if (array_contains(global.inimigos_disponiveis, obj_relacionado)) {
	global.perso_atuais[0] = obj_relacionado;
	var _tamanho_quad = 64 * 5;
	scr_trocar_sprite(inst_inimigo_selecionado, _tamanho_quad, _tamanho_quad, sprite_index);
}