// ==================================================
/// @description Apresenta perso
// ==================================================
dados = scr_retorna_perso();
obj_relacionado = dados[1];
is_multiplayer = (global.modo_jogo_atual == global.modos_jogo[MODO.PVP]);
desbloqueado = (array_contains(global.perso_disponiveis, obj_relacionado));
var _tamanho = 64;

// ---------- Desbloqueia todos no PVP ----------
// TODO: Desbloquear apenas metade dos personagens
if (is_multiplayer) {
	scr_trocar_sprite(self, _tamanho, _tamanho, dados[0]);
} else {
	// ---------- Só exibe o desbloqueado nos outros modos ----------
	if (desbloqueado) {
		scr_trocar_sprite(self, _tamanho, _tamanho, dados[0]);
	} else {
		scr_trocar_sprite(self, _tamanho, _tamanho, spr_perso_bloqueado);
	}
}

// ==================================================
// Funções do objeto
// ==================================================

/// @function muda_img
/// @description Muda a sprite da instância de exibição de personagem e salva seu objeto
/// @param {Real} _tamanho Tamanho da sprite
function muda_img(_tamanho) {
	var _sprite_i = array_get_index(global.miniaturas_perso, sprite_index);
	var _sprite_idle = global.idles_perso[_sprite_i];
	
	if (global.perso_atuais[0] == noone) {
		scr_trocar_sprite(inst_perso_selecionado_p1, _tamanho, _tamanho, _sprite_idle);
	} else {
		scr_trocar_sprite(inst_perso_selecionado_p2, _tamanho, _tamanho, _sprite_idle);
	}
	
	global.ultimo_selecionado = obj_relacionado;
}