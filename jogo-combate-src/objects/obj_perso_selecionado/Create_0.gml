/// @description Trocar foto

function alterar_foto(sprite) {
	sprite_index = sprite;

	var _largura_desejada = 64 * 5;
	var _altura_desejada = 64 * 5;

	image_xscale = _largura_desejada / sprite_get_width(sprite_index);
	image_yscale = _altura_desejada / sprite_get_height(sprite_index);
}