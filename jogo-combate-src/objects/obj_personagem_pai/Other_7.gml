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
	
	switch (hab_em_uso.tipo) {
		case global.tipos_hab[HABS.ATAQUE]: // dano
			efetua_dano(oponente, hab_em_uso.valor_efeito);
			break;
		case global.tipos_hab[HABS.CURA]: // cura
			aumenta_vida(id, hab_em_uso.valor_efeito);
			break;
		case global.tipos_hab[HABS.DRENA]: // dreno
			efetua_dano(oponente, hab_em_uso.valor_efeito);
			if (oponente.hp_atual > 0) aumenta_vida(id, hab_em_uso.valor_efeito);
			break;
		case global.tipos_hab[HABS.PRORROGA]: // prorroga
			id.efeitos.mult_tempo = hab_em_uso.valor_efeito;
			break;
		case global.tipos_hab[HABS.ACELERA]: // acelerA
			oponente.efeitos.mult_tempo = hab_em_uso.valor_efeito;
			break;
		case global.tipos_hab[HABS.ENERGETICO]: // energetico
			id.efeitos.mult_energia = hab_em_uso.valor_efeito;
			break;
	}

	if (is_rapido) {
		estado_turno = ESTADOS_TURNO.JOGANDO;
	} else {
		estado_turno = ESTADOS_TURNO.FINALIZANDO;
	}
	
}