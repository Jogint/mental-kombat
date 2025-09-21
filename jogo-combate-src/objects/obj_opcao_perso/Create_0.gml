dados = scr_config_selecao_perso();
obj_relacionado = dados[1];
sprite_index = dados[0];

var _largura_desejada = 64;
var _altura_desejada = 64;

image_xscale = _largura_desejada / sprite_get_width(sprite_index);
image_yscale = _altura_desejada / sprite_get_height(sprite_index);