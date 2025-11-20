event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Perfurações", (round(energia_total * 0.2)), global.tipos_hab[HABS.ATAQUE], 20, spr_niara_hab1),
	scr_definir_hab("Congela", (round(energia_total * 0.5)), global.tipos_hab[HABS.CONGELA], 0.8, spr_niara_hab2),
	scr_definir_hab("Sequência fria", (energia_total), global.tipos_hab[HABS.CONGELA], 0.5, spr_niara_ult),
]