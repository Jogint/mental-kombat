// ==================================================
/// @description Escolhe oponente
// ==================================================
// ---------- Somente se não estiver bloqueado ----------
if (!bloqueado) {
	global.perso_atuais[1] = obj_relacionado;
	
    var _tamanho = global.tamanhos.perso_maior;
	
	scr_trocar_sprite(inst_inimigo_selecionado, _tamanho, _tamanho, sprite_index);
	
	// ---------- Inverte a sprite ----------
	if (inst_inimigo_selecionado.image_xscale > 0) {
		inst_inimigo_selecionado.image_xscale = -(inst_inimigo_selecionado.image_xscale)
	}
}