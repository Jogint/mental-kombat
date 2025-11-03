event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Dano Rápido", (round(energia_total * 0.15)), global.tipos_hab[1], 15, spr_teste_player), // Dano (Mais Barato)
	scr_definir_hab("Ritmo Acelerado", (round(energia_total * 0.4)), global.tipos_hab[4], 1.3, spr_teste_player), // Prorroga
	scr_definir_hab("Surto de Tempo", (energia_total), global.tipos_hab[5], 0.9, spr_teste_player), // Acelerar (Custo Máx)
]