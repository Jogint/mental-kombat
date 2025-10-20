event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Impulso", (round(energia_total * 0.18)), global.tipos_hab[6], 1.3, 4), // Energético (Mais Barato)
	scr_definir_hab("Ataque Veloz", (round(energia_total * 0.4)), global.tipos_hab[1], 25, 4), // Dano
	scr_definir_hab("Sobrecarga Energet.", (energia_total), global.tipos_hab[4], 1.8, 4), // Prorroga (Custo Máx)
]