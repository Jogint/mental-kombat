/// @description Encerra o turno

// CASO A ANIMAÇÃO SEJA UMA DAS HABILIDADES
if (sprite_index == habilidades[0].sprite ||
sprite_index == habilidades[1].sprite ||
sprite_index == habilidades[2].sprite) {
    sprite_index = sprite_padrao;
    image_index = 0; 
    image_speed = 1;
	scr_encerrar_turno();
}