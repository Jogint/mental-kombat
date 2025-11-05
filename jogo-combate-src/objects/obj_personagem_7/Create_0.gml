event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Bênção", (round(energia_total * 0.15)), global.tipos_hab[HABS.CURA], 8, spr_teste_player), // Cura (Mais Barato)
	scr_definir_hab("Potencializar", (round(energia_total * 0.5)), global.tipos_hab[HABS.ENERGETICO], 1.8, spr_teste_player), // Energético
	scr_definir_hab("Julgamento", (energia_total), global.tipos_hab[HABS.ATAQUE], 40, spr_teste_player), // Dano (Custo Máx)
]