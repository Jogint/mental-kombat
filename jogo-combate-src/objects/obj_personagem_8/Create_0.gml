event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Corte Raso", (round(energia_total * 0.12)), global.tipos_hab[HABS.ATAQUE], 10, spr_umbros_idle), // Dano (Mais Barato)
	scr_definir_hab("Golpe Duplo", (round(energia_total * 0.4)), global.tipos_hab[HABS.ATAQUE], 30, spr_umbros_idle), // Dano
	scr_definir_hab("Vórtice Lâmina", (energia_total), global.tipos_hab[HABS.PRORROGA], 1.6, spr_umbros_idle), // Prorroga (Custo Máx)
]