event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Soco potente", (round(energia_total * 0.28)), global.tipos_hab[HABS.ATAQUE], 18, spr_emilio_hab1),
	scr_definir_hab("Ataque surpresa", (round(energia_total * 0.55)), global.tipos_hab[HABS.ATAQUE], 42, spr_emilio_hab2),
	scr_definir_hab("Aposta na moeda", (energia_total), global.tipos_hab[HABS.ATAQUE], 100, spr_emilio_ult),
]