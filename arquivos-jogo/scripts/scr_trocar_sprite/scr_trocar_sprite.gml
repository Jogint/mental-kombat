/// @function scr_trocar_sprite(obj, largura_desejada, altura_desejada, sprite)
/// @description Altera a sprite de um objeto
/// @param {Asset.GMObject|Id.Instance} obj Objeto que terá o sprite alterado
/// @param {Real} largura_desejada Largura desejada da sprite
/// @param {Real} altura_desejada Altura que ficará a sprite
/// @param {Asset.GMSprite} sprite A imagem usada no objeto
/// @return {bool}
function scr_trocar_sprite(obj, largura_desejada, altura_desejada, sprite){
	with (obj) {
		sprite_index = sprite;
		image_xscale = largura_desejada / sprite_get_width(sprite_index);
		image_yscale = altura_desejada / sprite_get_height(sprite_index);
	}
}