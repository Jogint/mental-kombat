event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Corte Raso", (round(energia_total * 0.12)), global.tipos_hab[1], 10, 4), // Dano (Mais Barato)
	scr_definir_hab("Golpe Duplo", (round(energia_total * 0.4)), global.tipos_hab[1], 30, 4), // Dano
	scr_definir_hab("Vórtice Lâmina", (energia_total), global.tipos_hab[4], 1.6, 4), // Prorroga (Custo Máx)
]