function scr_trocar_sprite(obj, largura_desejada, altura_desejada, sprite){
	with (obj) {
		sprite_index = sprite;
		image_xscale = largura_desejada / sprite_get_width(sprite_index);
		image_yscale = altura_desejada / sprite_get_height(sprite_index);
	}
}