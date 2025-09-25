dados = scr_retorna_perso();
obj_relacionado = dados[1];
var _tamanho = 64;

if (array_contains(global.perso_disponiveis, obj_relacionado)) {
	scr_trocar_sprite(self, _tamanho, _tamanho, dados[0]);
} else {
	scr_trocar_sprite(self, _tamanho, _tamanho, spr_teste_quest);
}
