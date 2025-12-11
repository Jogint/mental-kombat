// ==================================================
/// @description Seleciona Perso
// ==================================================

if (instance_exists(obj_jbl)) obj_jbl.toca_som_clicou();

var _tamanho = global.tamanhos.perso_maior;

if (is_multiplayer) {
	muda_img(_tamanho);
} else {
	if (desbloqueado) {
		muda_img(_tamanho);
	}
}

