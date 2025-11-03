/// @description Encerra o turno

// CASO A ANIMAÇÃO SEJA UMA DAS HABILIDADES
if (sprite_index == habilidades[0].sprite ||
sprite_index == habilidades[1].sprite ||
sprite_index == habilidades[2].sprite) {
    sprite_index = sprite_padrao;
    image_index = 0; 
    image_speed = 1;
	
	if (global.inst_perso_partida[0].hp_atual <= 0) {
		global.inst_perso_partida[0].hp_atual = 0;
		global.partida_acabou = true;
	}
	
	if (global.inst_perso_partida[1].hp_atual <= 0) {
		global.inst_perso_partida[1].hp_atual = 0;
		global.partida_acabou = true;
	}
	
	scr_encerrar_turno();
}