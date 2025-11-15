event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Rajada Leve", (round(energia_total * 0.25)), global.tipos_hab[HABS.ATAQUE], 20, spr_umbros_idle), // Dano (Mais Barato)
	scr_definir_hab("Carga Rápida", (round(energia_total * 0.45)), global.tipos_hab[HABS.ENERGETICO], 1.3, spr_umbros_idle), // Energético
	scr_definir_hab("Explosão Nuclear", (energia_total), global.tipos_hab[HABS.ATAQUE], 150, spr_umbros_idle), // Dano (Custo Máx - Alto Valor)
]