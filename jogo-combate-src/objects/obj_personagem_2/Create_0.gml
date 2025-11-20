event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Beijinhos", (round(energia_total * 0.3)), global.tipos_hab[HABS.DRENA], 15, spr_acerola_hab1),
	scr_definir_hab("Suco de uva", (round(energia_total * 0.6)), global.tipos_hab[HABS.ENERGETICO], 1.4, spr_acerola_hab2),
	scr_definir_hab("Busca de vida", (energia_total), global.tipos_hab[HABS.DRENA], 50, spr_acerola_ult),
]