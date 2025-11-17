event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Preparar", (round(energia_total * 0.3)), global.tipos_hab[HABS.ENERGETICO], 1.2, spr_anim_teste), // Energético (Mais Barato)
	scr_definir_hab("Ataque de Dreno", (round(energia_total * 0.6)), global.tipos_hab[HABS.DRENA], 30, spr_anim_teste), // Dreno
	scr_definir_hab("Impacto Pesado", (energia_total), global.tipos_hab[HABS.ATAQUE], 80, spr_anim_teste), // Dano (Custo Máx)
]