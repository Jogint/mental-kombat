event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Escudo", (round(energia_total * 0.28)), global.tipos_hab[HABS.CURA], 18, spr_player_idle_11), // Cura (Mais Barato)
	scr_definir_hab("Atraso Inibidor", (round(energia_total * 0.55)), global.tipos_hab[HABS.ACELERA], 0.7, spr_player_idle_11), // Acelerar
	scr_definir_hab("Colapso", (energia_total), global.tipos_hab[HABS.ATAQUE], 50, spr_player_idle_11), // Dano (Custo Máx)
]