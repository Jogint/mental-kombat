event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Dano Rápido", (round(energia_total * 0.15)), global.tipos_hab[HABS.ATAQUE], 30, spr_umbros_idle), // Dano (Mais Barato)
	scr_definir_hab("Ritmo Acelerado", (round(energia_total * 0.4)), global.tipos_hab[HABS.PRORROGA], 1.3, spr_umbros_idle), // Prorroga
	scr_definir_hab("Surto de Tempo", (energia_total), global.tipos_hab[HABS.ACELERA], 0.9, spr_umbros_idle), // Acelerar (Custo Máx)
]