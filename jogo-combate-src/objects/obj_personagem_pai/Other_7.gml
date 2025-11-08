// ==================================================
/// @description Encerra o turno
// ==================================================

if (room == rm_selecao_personagem) exit;

// CASO A ANIMAÇÃO SEJA UMA DAS HABILIDADES
if (sprite_index == habilidades[0].sprite ||
sprite_index == habilidades[1].sprite ||
sprite_index == habilidades[2].sprite) {
    sprite_index = sprite_padrao;
    image_index = 0; 
    image_speed = 1;
	
	estado_turno = ESTADOS_TURNO.FINALIZANDO;
}