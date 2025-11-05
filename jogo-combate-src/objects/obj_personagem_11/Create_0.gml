event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("drenogem", (round(energia_total * 0.15)), global.tipos_hab[HABS.DRENA], 10, spr_teste_player), // Dreno (Mais Barato)
	scr_definir_hab("Aprimoramento", (round(energia_total * 0.4)), global.tipos_hab[HABS.ENERGETICO], 1.6, spr_teste_player), // Energético
	scr_definir_hab("Vazio da Alma", (energia_total), global.tipos_hab[HABS.DRENA], 60, spr_teste_player), // Dreno (Custo Máx)
]