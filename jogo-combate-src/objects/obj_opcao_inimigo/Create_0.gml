dados = scr_retorna_perso(true);
obj_relacionado = dados[1];
var _tamanho = 96;
scr_trocar_sprite(self, _tamanho, _tamanho, dados[0]);

if (!array_contains(global.inimigos_disponiveis, obj_relacionado)) {
	image_alpha = 0.3;
}