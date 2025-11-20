event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Brincar de espada", (round(energia_total * 0.25)), global.tipos_hab[HABS.ATAQUE], 35, spr_toya_hab1),
	scr_definir_hab("Cortes rápidos", (round(energia_total * 0.5)), global.tipos_hab[HABS.ATAQUE], 75, spr_toya_hab2),
	scr_definir_hab("Espadada", (energia_total), global.tipos_hab[HABS.ATAQUE], 110, spr_toya_ult),
]