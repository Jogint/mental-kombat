event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Corte rápido", (round(energia_total * 0.3)), global.tipos_hab[HABS.ATAQUE], 30, spr_grumpy_hab1),
	scr_definir_hab("Sopro de fogo", (round(energia_total * 0.7)), global.tipos_hab[HABS.ATAQUE], 75, spr_grumpy_hab2),
	scr_definir_hab("Impacto mágico", (energia_total), global.tipos_hab[HABS.DRENA], 40, spr_grumpy_ult),
]