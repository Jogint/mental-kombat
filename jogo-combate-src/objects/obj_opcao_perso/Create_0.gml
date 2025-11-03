dados = scr_retorna_perso();
obj_relacionado = dados[1];
is_multiplayer = global.modo_jogo_atual == global.modos_jogo[0];
var _tamanho = 64;

if (is_multiplayer) {
	scr_trocar_sprite(self, _tamanho, _tamanho, dados[0]);
} else {
	if (array_contains(global.perso_disponiveis, obj_relacionado)) {
		scr_trocar_sprite(self, _tamanho, _tamanho, dados[0]);
	} else {
		scr_trocar_sprite(self, _tamanho, _tamanho, spr_perso_bloqueado);
	}
}