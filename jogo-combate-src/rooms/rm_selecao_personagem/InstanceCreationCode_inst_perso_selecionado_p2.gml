array_push(global.perso_atuais, obj_personagem_1);
sprite_index = spr_teste_player_1;

var _largura_desejada = 64 * 5;
var _altura_desejada = 64 * 5;

image_xscale = _largura_desejada / sprite_get_width(sprite_index);
image_yscale = _altura_desejada / sprite_get_height(sprite_index);