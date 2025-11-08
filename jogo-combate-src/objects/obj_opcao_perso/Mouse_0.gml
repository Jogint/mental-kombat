// ==================================================
/// @description Seleciona Perso
// ==================================================
var _tamanho = global.tamanhos.perso_maior;

if (is_multiplayer) {
	muda_img(_tamanho);
} else {
	if (desbloqueado) {
		muda_img(_tamanho);
	}
}

