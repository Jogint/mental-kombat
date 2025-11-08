// ==================================================
/// @description Recebe os dados
// ==================================================
// ----------  ----------
dados = scr_retorna_perso(true);
obj_relacionado = dados[1];
bloqueado = !array_contains(global.inimigos_disponiveis, obj_relacionado);
var _tamanho = global.tamanhos.inimigo_trilha;

scr_trocar_sprite(self, _tamanho, _tamanho, dados[0]);

// ---------- Altera a opacidade se bloqueado ----------
if (bloqueado) {
	image_alpha = 0.3;
}