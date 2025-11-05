event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("drenogem Leve", (round(energia_total * 0.1)), global.tipos_hab[HABS.DRENA], 5, spr_teste_player), // Dreno (Mais Barato)
	scr_definir_hab("Aceleração", (round(energia_total * 0.45)), global.tipos_hab[HABS.ENERGETICO], 1.5, spr_teste_player), // Energético
	scr_definir_hab("Paralisia Temporal", (energia_total), global.tipos_hab[HABS.ACELERA], 0.6, spr_teste_player), // Acelerar (Custo Máx)
]