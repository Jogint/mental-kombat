event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Pequena Cura", (round(energia_total * 0.2)), global.tipos_hab[HABS.CURA], 10, spr_player_idle_11), // Cura (Mais Barato)
	scr_definir_hab("Ataque Firme", (round(energia_total * 0.55)), global.tipos_hab[HABS.ATAQUE], 35, spr_player_idle_11), // Dano
	scr_definir_hab("Restaurar Vitalidade", (energia_total), global.tipos_hab[HABS.CURA], 50, spr_player_idle_11), // Cura (Custo Máx)
]