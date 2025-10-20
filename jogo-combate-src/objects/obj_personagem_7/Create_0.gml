event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Bênção", (round(energia_total * 0.15)), global.tipos_hab[2], 8, 4), // Cura (Mais Barato)
	scr_definir_hab("Potencializar", (round(energia_total * 0.5)), global.tipos_hab[6], 1.8, 4), // Energético
	scr_definir_hab("Julgamento", (energia_total), global.tipos_hab[1], 40, 4), // Dano (Custo Máx)
]