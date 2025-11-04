if (array_contains(global.inimigos_disponiveis, obj_relacionado)) {
	global.perso_atuais[1] = obj_relacionado;
    var _tamanho_quad = 64 * 5; // = 320
	scr_trocar_sprite(inst_inimigo_selecionado, _tamanho_quad, _tamanho_quad, sprite_index);
	if (inst_inimigo_selecionado.image_xscale > 0) {
		inst_inimigo_selecionado.image_xscale = -(inst_inimigo_selecionado.image_xscale)
	}
}