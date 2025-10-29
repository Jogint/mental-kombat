event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Recompor", (round(energia_total * 0.25)), global.tipos_hab[2], 15, 4), // Cura (Mais Barato)
	scr_definir_hab("Ataque Equil.", (round(energia_total * 0.5)), global.tipos_hab[1], 40, 4), // Dano
	scr_definir_hab("Foco Total", 1, global.tipos_hab[6], 1.5, 4), // Prorroga 4(Custo Máx)
]