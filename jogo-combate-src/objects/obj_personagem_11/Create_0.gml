event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("drenogem", (round(energia_total * 0.15)), global.tipos_hab[3], 10, 4), // Dreno (Mais Barato)
	scr_definir_hab("Aprimoramento", (round(energia_total * 0.4)), global.tipos_hab[6], 1.6, 4), // Energético
	scr_definir_hab("Vazio da Alma", (energia_total), global.tipos_hab[3], 60, 4), // Dreno (Custo Máx)
]