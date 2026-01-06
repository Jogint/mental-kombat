event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Atordoar", (round(energia_total * 0.15)), global.tipos_hab[HABS.CONGELA], 0.7, spr_umbros_hab1),
	scr_definir_hab("INDEFINIDA", (round(energia_total * 0.4)), global.tipos_hab[HABS.ENERGETICO], 1.6, spr_umbros_hab2),
	scr_definir_hab("INDEFINIDA", (energia_total), global.tipos_hab[HABS.DRENA], 60, spr_umbros_ult),
]