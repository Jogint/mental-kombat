// ==================================================
/// @description Escolhe oponente
// ==================================================

if (instance_exists(obj_jbl)) obj_jbl.toca_som_clicou();

// ---------- Somente se não estiver bloqueado ----------
if (!bloqueado) {
	global.perso_atuais[1] = obj_relacionado;
	
    var _tamanho = global.tamanhos.perso_maior;
	var _sprite_i = array_get_index(global.miniaturas_perso, sprite_index);
	var _sprite_idle = global.idles_perso[_sprite_i];
	
	scr_trocar_sprite(inst_inimigo_selecionado, _tamanho, _tamanho, _sprite_idle);
	
	// ---------- Inverte a sprite ----------
	if (inst_inimigo_selecionado.image_xscale > 0) {
		inst_inimigo_selecionado.image_xscale = -(inst_inimigo_selecionado.image_xscale)
	}
}