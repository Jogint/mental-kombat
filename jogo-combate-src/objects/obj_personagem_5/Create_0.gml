event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Impulso", (round(energia_total * 0.18)), global.tipos_hab[HABS.ENERGETICO], 1.3, spr_teste_player), // Energético (Mais Barato)
	scr_definir_hab("Ataque Veloz", (round(energia_total * 0.4)), global.tipos_hab[HABS.ATAQUE], 25, spr_teste_player), // Dano
	scr_definir_hab("Sobrecarga Energet.", (energia_total), global.tipos_hab[HABS.PRORROGA], 1.8, spr_teste_player), // Prorroga (Custo Máx)
]